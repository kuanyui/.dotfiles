#!/bin/bash
function replaceFile() {  # source, dist
    source=`readlink -f $1`
    dist=$2
    echo $source $dist
    if [ -f $dist ]; then
        rm $dist
    fi
    ln -s $source $dist
}

replaceFile ./my-ssh-add.sh            ~/.config/autostart-scripts/my-ssh-add.sh
replaceFile ./my-ssh-agent-shutdown.sh ~/.config/plasma-workspace/shutdown/my-ssh-agent-shutdown.sh
replaceFile ./my-ssh-agent-startup.sh  ~/.config/plasma-workspace/env/my-ssh-agent-startup.sh
replaceFile ./my-export-ksshaskpass.sh /etc/profile.d/my-export-ksshaskpass.sh
