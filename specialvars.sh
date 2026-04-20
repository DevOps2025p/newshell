#!/bin/bash
echo "All the special variables in script here:: $@"
echo "Script name is:: $0"
echo "Number of arguments passed:: $#"
echo "Current directory is:: $PWD"
echo "User name is:: $USER"
echo "Home directory is:: $HOME"
echo "Current process id is:: $$"
sleep 10 &
echo "Background process id is:: $!"