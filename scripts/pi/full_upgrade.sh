#!/bin/sh

NUMBER_STEPS=5

DOCKER_CONFIG_PATH="docker/daemon.json"
SYS_DOCKER_CONFIG_PATH="/etc/${DOCKER_CONFIG_PATH}"

# https://itsfoss.com/apt-list-upgradable/
echo "Full system upgrade to apt in ${NUMBER_STEPS} steps!"

echo "[1/${NUMBER_STEPS}] update registry"
sudo apt update

echo "[2/${NUMBER_STEPS}] list upgrades"
sudo apt list --upgradeable


echo "[3/${NUMBER_STEPS}] remove docker config before update process at SYS_DOCKER_CONFIG_PATH: ${SYS_DOCKER_CONFIG_PATH}"
sudo rm sudo rm $SYS_DOCKER_CONFIG_PATH


echo "[4/${NUMBER_STEPS}] full upgrade apt"
sudo apt full-upgrade -y


echo "[5/${NUMBER_STEPS}] now clean up"
sudo apt autoremove -y

echo "Done updating apt stuffz in ${NUMBER_STEPS} steps!!!"

#echo "Now, reboot!"
#sudo reboot
