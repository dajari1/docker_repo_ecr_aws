#!/bin/bash
sudo apt update -y

sudo apt upgrade -y

sudo apt install openjdk-17-jre -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
jenkins --version

echo "waiting for 30 seconds before installing docker"
sleep 30

# ---
sudo apt-get install docker.io
#add permission
sudo chmod 777 /var/run/docker.sock
docker --version

echo "Waiting for 30 seconds before installing the aws cli..."
sleep 30

## install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo apt install unzip 
unzip awscliv2.zip 
sudo ./aws/install

#check the version

aws --version
