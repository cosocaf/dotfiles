mkdir tmp
cd tmp

sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt clean

sudo apt install apt-transport-https

sudo apt install curl git wget

# install fish
sudo apt install fish
fish ../ubuntu-setup.fish

cd ..
rm -rf tmp

