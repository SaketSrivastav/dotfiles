#! /bin/python

import os
import subprocess

def execute_cmd_ret(cmd, cwd):
    my_env = os.environ.copy()
    os.chdir(cwd)
    p = subprocess.Popen(cmd, shell=True, env=my_env,
                         stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT)
    out, err = p.communicate()
    return (out, err)

def execute_cmd_no_ret(cmd, cwd):
    my_env = os.environ.copy()
    os.chdir(cwd)
    p = subprocess.Popen(cmd, shell=True, env=my_env)
    p.communicate()
