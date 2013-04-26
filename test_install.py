import unittest
from tempfile import gettempdir
import os
from shutil import rmtree

from install import install, uninstall, get_source_dir


class DotFilesBase(unittest.TestCase):
    def setUp(self):
        tmpdir = gettempdir()
        self.source_dir = get_source_dir()
        self.target_dir = os.path.join(tmpdir, 'dotfile_tmp')
        self.backup_dir = os.path.join(self.target_dir, 'dotfiles.old')
        if os.path.exists(self.target_dir):
            rmtree(self.target_dir)
        os.mkdir(self.target_dir)
        os.mkdir(self.backup_dir)


class TestDotfilesInstall(DotFilesBase):
    def test_target_does_not_exist(self):
        install(self.source_dir, self.target_dir, self.backup_dir)

        bashrc_source = os.path.join(self.source_dir, '.bashrc')
        bashrc_target = os.path.join(self.target_dir, '.bashrc')
        pysnippets_source = os.path.join(
            self.source_dir,
            '.vim/snippets/python.snippets')
        pysnippets_target = os.path.join(
            self.target_dir,
            '.vim/snippets/python.snippets')

        self.assertTrue(os.path.exists(bashrc_target))
        self.assertTrue(os.readlink(bashrc_target) == bashrc_source)
        self.assertTrue(os.path.exists(pysnippets_target))
        self.assertTrue(os.readlink(pysnippets_target) == pysnippets_source)


class TestDotfilesUninstall(DotFilesBase):
    def test_uninstall_after_install(self):
        install(self.source_dir, self.target_dir, self.backup_dir)
        uninstall(self.source_dir, self.target_dir, self.backup_dir)
        bashrc_target = os.path.join(self.target_dir, '.bashrc')
        pysnippets_target = os.path.join(
            self.target_dir,
            '.vim/snippets/python.snippets')
        self.assertFalse(os.path.exists(bashrc_target))
        self.assertFalse(os.path.exists(pysnippets_target))


if __name__ == '__main__':
    unittest.main()
