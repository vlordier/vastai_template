#!/bin/bash
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
	sudo apt update &&
	sudo apt install gh libgl1-mesa-glx software-properties-common -y
apt install -y nvtop nano virtualenv python3-dev build-essential
pip install --upgrade pip
touch /root/.no_auto_tmux

# install python3.10
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install -y python3.10

# install pip
sudo apt-get install -y python3.10-distutils
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.10

# create venv without pip, install pip, because some error with pip
python3.10 -m venv --without-pip venv
source venv/bin/activate
curl https://bootstrap.pypa.io/get-pip.py | python

# install python3.10-dev
apt install python3.10-dev
