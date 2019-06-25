#!/bin/sh
# This script is to startup ssh-agent for KDE plasma
sleep 10
export SSH_ASKPASS="/usr/bin/ksshaskpass"
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
