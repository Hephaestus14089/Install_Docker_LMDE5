#!/usr/bin/env bash

# removing any older versions of docker
sudo apt remove docker docker-engine docker.io containerd runc

# updating the apt package index and installing the prerequisites
sudo apt update
sudo apt install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

# adding docker's official gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# setting up the stable repository of docker for debian 11
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# updating the apt package index
sudo apt update

# installing the docker engine
sudo apt install \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-compose-plugin

# verifying that the docker engine is correctly installed
sudo docker run hello-world
