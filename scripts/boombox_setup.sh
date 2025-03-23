#!/bin/sh

SCRIPTS_DIR=scripts


NUMBER_STEPS=2


echo "Set up all boombox apps with SCRIPTS_DIR: ${SCRIPTS_DIR} in ${NUMBER_STEPS} steps !"

echo "[1/${NUMBER_STEPS}] check git branch"
git status

echo "[2/${STEPS}] configure docker daemon"
sh ${SCRIPTS_DIR}/docker_configure.sh

echo "Done setting up all boombox for this host at final SCRIPTS_DIR: ${SCRIPTS_DIR} in ${NUMBER_STEPS} steps !!!"
#echo "Now reboot!"
#sudo reboot
