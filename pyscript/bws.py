#!/bin/python

import logging
import os
import sys

import git

import utils

LOCAL_HOME = os.getenv('HOME')
WS_DIR = LOCAL_HOME + "/ws"
PANOS_00 = 'TiMOS-DC_0_0_new'

logger = logging.getLogger('BWS')
formatter = logging.Formatter('%(asctime)s:%(levelname)s:%(message)s')
logger.setLevel(logging.INFO)
fh = logging.FileHandler(LOCAL_HOME + '/dotfiles/pyscript/bws.log', mode='w')
fh.setFormatter(formatter)
logger.addHandler(fh)

def execute_cmd(cwd, cmd, ret=True):
    logger.info('Executing: ' + cmd + ' in ' + cwd)
    out = None
    err = None
    if ret == 1:
        out, err = utils.execute_cmd_ret(cmd, cwd)
    else:
        utils.execute_cmd_no_ret(cmd, cwd)

    return (out, err)


def get_git_ws(repos_dir):
    out, err = execute_cmd(
        repos_dir, 'find . -maxdepth 4 -type d -name ".git" -printf "%h"')
    return out.split('.')


def panos_repo_upd(panos_dir):
    """Updates the panos repo by doing the following operation:
    1) git fetch <all remotes>
    2) git checkout origin TiMOS-DC_0_0
    3) git pull TiMOS-DC_0_0
    4) git pull TiMOS-DC_0_0 official/TiMOS-DC_0_0
    5) git push origin TiMOS-DC_0_0
    """
    # Initializations
    g = git.Git(panos_dir)
    r = git.Repo(panos_dir)
    has_off_rem = False
    ws_dirty = False

    # Step 1: Fetch all remotes
    for rem in r.remotes:
        if rem.name == 'official':
            has_off_rem = True
        rem.fetch()
    logger.info('Fetching all remotes done')

    #Step 2: Checkout TiMOS-DC_0_0
    curr_branch = r.active_branch
    if r.is_dirty():
        logger.info(panos_dir + " workspace is dirty, stashing the changes")
        r.git.stash('save')
        ws_dirty = True

    if curr_branch.name != PANOS_00 :
        logger.info(panos_dir + ": Curr Branch: " + curr_branch.name)
        logger.info(panos_dir + ": Checking out TiMOS-DC_0_0_new")
        g.checkout(PANOS_00)

    logger.info('Checkout: TiMOS-DC_0_0')
    #Step 3: Update changes from origin
    origin = r.remotes.origin
    origin.pull()

    #Step 4: Update changes from official
    if (has_off_rem == True):
        official = r.remotes.official
        res = official.pull('TiMOS-DC_0_0:remotes/official/TiMOS-DC_0_0')
        for info in res:
            logger.info(panos_dir + ": Pull " + info.ref.path)

    logger.info('Pull: TiMOS-DC_0_0 from origin and official')
    #Step 5: Push changes to origin
    if (has_off_rem == True):
        logger.info(panos_dir + ": Push changes to origin")
        origin.push()

    # Restore repo state
    if curr_branch.name != 'TiMOS-DC_0_0':
        logger.info(panos_dir + ": Restoring state repo: " + curr_branch.name)
        g.checkout(curr_branch.name)
        if ws_dirty:
            r.git.stash('pop')


def panos_build(panos_dir):
    logger.info(panos_dir + ': Building panos')
    out, err = execute_cmd(panos_dir, './mk cleanall &> /dev/null', ret=False)
    out, err = execute_cmd(panos_dir, './mk &> log.txt', ret=False)


def panos_cscope(panos_dir):
    logger.info(panos_dir + ' : Building Cscope')
    # out, err = execute_cmd(panos_dir, '"./make/distws.sh -get gen/agent/,*" &> /dev/null',
    #                        ret=False)
    out, err = execute_cmd(panos_dir, 'rm -f cscope.*', ret=False)
    out, err = execute_cmd(
        panos_dir, '/usr/local/timostools/cscope-indexer.sh', ret=False)


def is_ws_upd(panos_dir):
    if (panos_dir.find('panos') == -1) or \
       (panos_dir.find('sros') != -1) or \
       (panos_dir.find('remotes') != -1) or \
       (panos_dir.find('old_dc') != -1) or \
       (panos_dir.find('VCA') != -1):
        return False
    return True


def upd_ws():
    git_upd_ws = []
    dirs = get_git_ws(WS_DIR)
    for ws in dirs:
        panos_dir = WS_DIR + ws
        if (is_ws_upd(panos_dir) == True):
            git_upd_ws.append(panos_dir)

    for panos_dir in git_upd_ws:
        logger.info("Workspace: " + str(panos_dir))
        panos_repo_upd(str(panos_dir))
        # panos_build(str(panos_dir))
        panos_cscope(str(panos_dir))


def main():
    logger.info("Building workspace script started")
    upd_ws()
    logger.info("Building workspace script ended")


if __name__ == '__main__':
    main()
