#!/usr/bin/python

__author__ = 'saketkus'

import sys
import os
from subprocess import call
from subprocess import Popen
from subprocess import PIPE
from subprocess import STDOUT

HOME = os.environ['HOME']
DOTFILE_DIR = HOME + '/dotfiles/'
VIM_PLUGIN_LIST_FILE = 'git_plugin_list.txt'
PLUGIN_DIR = DOTFILE_DIR + 'vim/bundle/'

def execute_command_for_output(cmd):
    p = Popen(cmd, stdout=PIPE, stderr=STDOUT, shell=True)
    out, err = p.communicate()
    return out.strip('\n')

def sync_vim_plugin():
    with open(DOTFILE_DIR + VIM_PLUGIN_LIST_FILE) as f:
        for line in f:
            repo_url = line.rstrip('\n')
            if 'saketkus' in repo_url:
                continue

            basename = execute_command_for_output('basename ' + line)
            repo_name = basename.split('.')
            clone_cmd = 'git clone ' +  repo_url + ' ' + PLUGIN_DIR + repo_name[0]
            print 'Executing: ' + clone_cmd
            execute_command_for_output(clone_cmd)

def main():
    sync_vim_plugin()

if __name__ == '__main__':
    sys.exit(main())
