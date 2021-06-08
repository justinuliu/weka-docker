#!/bin/bash

startup_linux(){
    xhost +local:root
    sudo docker-compose up
}

startup_mac(){
    if [ ! -e /tmp/.X11-unix/X0 ]; then
    open -a Xquartz
    fi

    until [ -e /tmp/.X11-unix/X0 ]; do  
        sleep 5; 
    done
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    DISPLAY=$ip:0
    xhost + $ip
    sudo docker-compose up
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     startup_linux
        ;;
    Darwin*)    startup_mac
        ;;
    *)          exit 1;;
esac
