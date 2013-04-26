#!/usr/bin/python
import os
import sys


def get_source_dir():
    here_path = os.path.abspath(__file__)
    here_dir = os.path.split(here_path)[0]
    source_dir = os.path.join(here_dir, 'src')
    return source_dir


def install(source_dir, install_dir, backup_dir):
    dotfiles = os.listdir(source_dir)
    if not os.path.exists(backup_dir):
        os.mkdir(backup_dir)
    for dotfile in dotfiles:
        source = os.path.join(source_dir, dotfile)
        target = os.path.join(install_dir, dotfile)
        target_exists = os.path.exists(target)
        target_isdir = os.path.isdir(target)
        source_isdir = os.path.isdir(source)

        if target_exists:
            if target_isdir:
                if source_isdir:
                    sub_backup_dir = os.path.join(backup_dir, dotfile)
                    install(source, target, sub_backup_dir)
                else:
                    print('Warning: not overwriting dir with file: %s'
                          % target)
            else:
                already_linked = (os.readlink(target) == source)
                if already_linked:
                    print('Already linked: %s' % target)
                else:
                    backup = os.path.join(backup_dir, dotfile)
                    if os.path.exists(backup):
                        print('Warning: Can not back up, backup exists: %s, '
                              'skipping' % backup)
                    else:
                        os.rename(target, backup)
                        print('Backed up %s' % target)
                        if source_isdir:
                            os.mkdir(target)
                            sub_backup_dir = os.path.join(backup_dir, dotfile)
                            install(source, target, sub_backup_dir)
                        else:
                            os.symlink(source, target)
                            print('Linked    %s' % target)
        else:
            if source_isdir:
                os.mkdir(target)
                sub_backup_dir = os.path.join(backup_dir, dotfile)
                install(source, target, sub_backup_dir)
            else:
                os.symlink(source, target)
                print('Linked    %s' % target)


def uninstall(source_dir, install_dir, backup_dir):
    dotfiles = os.listdir(source_dir)
    if backup_dir and not os.path.exists(backup_dir):
        print('Warning: Backup dir not found: %s' % backup_dir)
    for dotfile in dotfiles:
        source = os.path.join(source_dir, dotfile)
        target = os.path.join(install_dir, dotfile)
        if backup_dir != '':
            backup = os.path.join(backup_dir, dotfile)
        else:
            backup = ''
        backup_exists = os.path.exists(backup)
        backup_isdir = os.path.isdir(backup)
        target_exists = os.path.exists(target)
        target_isdir = os.path.isdir(target)

        if target_exists:
            if target_isdir:
                if backup_exists:
                    if backup_isdir:
                        sub_backup_dir = os.path.join(backup_dir, dotfile)
                        uninstall(source, target, sub_backup_dir)
                    else:
                        uninstall(source, target, '')
                        try:
                            os.rmdir(target)
                        except OSError:
                            print('Could not delete target dir, not empty? '
                                  '(%s)' % target)
                        else:
                            os.rename(backup, target)
                else:
                    print('Warning: No backup found: %s' % target)
                    uninstall(source, target, '')
            else:
                if not os.readlink(target) == source:
                    print('Not installed, skipping: %s' % target)
                else:
                    if backup_exists:
                        os.remove(target)
                        os.rename(backup, target)
                        print('Restored    %s' % target)
                    else:
                        os.remove(target)
                        print('Uninstalled %s' % target)

    if os.path.exists(backup_dir):
        try:
            os.rmdir(backup_dir)
        except OSError:
            print('Could not delete backup dir, not empty? (%s)' % backup_dir)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        install_dir = sys.argv[1]
    else:
        install_dir = os.path.expanduser('~')
    backup_dir = os.path.join(install_dir, 'dotfiles.old')
    source_dir = get_source_dir()
    call_name = os.path.split(sys.argv[0])[1]
    if call_name == 'install.py':
        install(source_dir, install_dir, backup_dir)
        print('Backups in %s' % backup_dir)
    elif call_name == 'uninstall.py':
        uninstall(source_dir, install_dir, backup_dir)
