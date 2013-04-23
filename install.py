#!/usr/bin/python
import os
import sys


def install(source_dir, install_dir, backup_dir):
    dotfiles = os.listdir(source_dir)
    if not os.path.exists(backup_dir):
        os.mkdir(backup_dir)
    for dotfile in dotfiles:
        source = os.path.join(source_dir, dotfile)
        target = os.path.join(install_dir, dotfile)
        if os.path.exists(target):
            backup = os.path.join(backup_dir, dotfile)
            if os.path.exists(backup):
                print('Backup exists: %s' % backup)
            else:
                os.rename(target, backup)
                print('Backed up %s' % target)
        if os.path.exists(target):
            if os.readlink(target) == source:
                print('Warning: Already linked: %s' % target)
            else:
                print('Warning: Could not back up, not linking: %s' % target)
                continue
        else:
            os.symlink(source, target)
            print('Linked    %s' % target)
    print('Backups in %s' % backup_dir)


def uninstall(source_dir, install_dir, backup_dir):
    dotfiles = os.listdir(source_dir)
    if not os.path.exists(backup_dir):
        sys.exit('Backup dir not found (%s), aborting' % backup_dir)
    for dotfile in dotfiles:
        source = os.path.join(source_dir, dotfile)
        target = os.path.join(install_dir, dotfile)
        backup = os.path.join(backup_dir, dotfile)
        if not os.path.exists(target) or not os.readlink(target) == source:
            print('Warning: Not linked to our version: %s' % target)
            continue
        if not os.path.exists(backup):
            print('Warning: Backup does not exist: %s' % backup)
            continue
        os.remove(target)
        os.rename(backup, target)
        print('Restored %s' % target)
    try:
        os.rmdir(backup_dir)
    except OSError:
        print('Could not delete backup dir, not empty? (%s)' % backup_dir)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        install_dir = sys.argv[1]
    else:
        install_dir = os.path.expanduser('~')
    backup_dir = os.path.join(os.path.expanduser('~'), 'dotfiles.old')
    here_path = os.path.abspath(__file__)
    here_dir = os.path.split(here_path)[0]
    source_dir = os.path.join(here_dir, 'src')
    call_name = os.path.split(sys.argv[0])[1]
    if call_name == 'install.py':
        install(source_dir, install_dir, backup_dir)
    elif call_name == 'uninstall.py':
        uninstall(source_dir, install_dir, backup_dir)

