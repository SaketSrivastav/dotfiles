#!/bin/python

import sys
import os
from enum import Enum

class Proj(Enum):
    SROS = 1
    VCA  = 2

GITHUB_URL = 'https://github.mv.usa.alcatel.com/'
SROS_PROJ_URL = GITHUB_URL + 'SROS/TiMOS/compare/'
VCA_PROJ_URL = GITHUB_URL + 'VCA/VCA/compare/'

def prepare_rem_branch(name, version, proj):
    err = 0;
    rem_br = ""
    if(proj == Proj.SROS):
        if(version == '00'):
            rem_br = 'TiMOS-DC_' + \
                     version[0] + '_' + version[1]
        else:
            rem_br = 'TiMOS-DC_' + \
                     version[0] + '_' + version[1] + '_current'
    elif (proj == Proj.VCA):
        if(version == '00'):
            rem_br = 'vca-master'
        else:
            rem_br = 'vca-' + version[0] + '.' + version[1]
    else:
        print 'Invalid project'
        return ""

    return rem_br

def prepare_gpr_url(my_br, rem_br, proj):

    if(proj == Proj.SROS):
        url = SROS_PROJ_URL + rem_br + '...saketkus:' + my_br + '?expand=1'
    elif(proj == Proj.VCA):
        url = VCA_PROJ_URL + rem_br + '...saketkus:' + my_br + '?expand=1'
    else:
        url = ""

    return url

def main(argv):
    my_br = argv[1]
    proj = argv[2]
    proj_ver = argv[3]

    if(proj == 'sros'):
        rem_br = prepare_rem_branch(proj, proj_ver, Proj.SROS)
        url = prepare_gpr_url(my_br, rem_br, Proj.SROS)
    elif (proj == 'vca'):
        rem_br = prepare_rem_branch(proj, proj_ver, Proj.VCA)
        url = prepare_gpr_url(my_br, rem_br, Proj.VCA)
    else:
        print 'Invalid project'
        return

    # print 'Final url: ' + url
    os.system('xdg-open ' + url);

if __name__ == '__main__' :
    try :
        main (sys.argv)
    except SystemExit :
        # Let system.exit() calls complete normally
        raise
