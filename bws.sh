function bws_log ()
{
    logger -t BWS $1
}

# Additional commands
function add_cmds ()
{
    bws_log "Build tags, cscope started `pwd`"
    rm -f cscope.* &> /dev/null
    # rm -f tags
    /usr/local/timostools/cscope-indexer.sh &> /dev/null
    # make tags &> /dev/null
    bws_log "Build tags, cscope completed `pwd`"
}

function build_cmds ()
{
    bws_log "Build started `pwd`"
    ./mk cleanall &> /dev/null
    ./mk &> log.txt
    /bin/bash -c "make/distws.sh -get gen/agent/,*" &> /dev/null
    build_log=`tail -3 log.txt`
    bws_log "$build_log"
    bws_log "Build completed `pwd`"
}

function bws ()
{
    ws_dir="$2/panos"
    if [ ! -d $2 ]; then
        exit 1
    fi

    pushd &> /dev/null
    cd $ws_dir
    export PAN_DIR=$ws_dir
    curr_branch=`git rev-parse --abbrev-ref HEAD`
    if [[ $1 -eq "-s" ]]; then
        git up
    else
        git fetch origin $curr_branch &> /dev/null
        git pull origin $curr_branch &> /dev/null
    fi

    if [ ! -f "$ws_dir/prefs.mk" ]; then
        cp $HOME/work/prefs.mk $ws_dir
    fi
    build_cmds
    add_cmds
    popd &> /dev/null
    export PAN_DIR=`pwd`
}

bws "-s" "$HOME/ws/00-1"
bws "-s" "$HOME/ws/00-2"
bws "-s" "$HOME/ws/00-3"
bws "-x" "$HOME/ws/bugs/0"
bws "-x" "$HOME/ws/bugs/1"
bws "-x" "$HOME/ws/bugs/2"
bws "-x" "$HOME/ws/bugs/3"
bws "-x" "$HOME/ws/features/0"
bws "-x" "$HOME/ws/features/1"
bws "-x" "$HOME/ws/features/2"
bws "-x" "$HOME/ws/features/3"
