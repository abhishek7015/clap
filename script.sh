#!/bin/bash

# Update package lists
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
sudo apt install -y ca-certificates curl gnupg openjdk-17-jdk

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists and install Jenkins
sudo apt update -y
sudo apt install -y jenkins

# Enable and start Jenkins
sudo systemctl enable --now jenkins

# Print Jenkins initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins installation complete. Use the above password to set up Jenkins."
