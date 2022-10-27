#!/bin/bash

number=$RANDOM
passwd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 6)
ip=$(curl ifconfig.me)

clear

RED='\033[0;31m'
NC='\033[0m' # No Color
BLUE='\033[0;34m'

echo "--------------------------------------------------------"
echo -e "${BLUE}Free Ubuntu 22.04 VM by fb.com/thuong.hai.581"
echo -e "${BLUE}Every VM valid for 1 hour. Reload page to get new one${NC}"
echo "--------------------------------------------------------"
echo -e "${RED}Ubuntu 22.04 NoVNC${NC} READY. Password is ${RED}$passwd${NC} . Go to: ${RED}http:///$ip:$number${NC}"
echo "-------------------------------------------------------------------------------"

timeout 3600 docker run --privileged --shm-size 1g -p $number:10000 -e VNC_PASSWD=$passwd -e PORT=10000 -e AUDIO_PORT=1699 -e WEBSOCKIFY_PORT=6900 -e VNC_PORT=5900 -e SCREEN_WIDTH=1024 -e SCREEN_HEIGHT=768 -e SCREEN_DEPTH=24 thuonghai2711/ubuntu-novnc-pulseaudio:22.04

