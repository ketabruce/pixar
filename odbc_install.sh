#!/bin/bash

# Download the package to configure the Microsoft repo
curl -sSL -O https://packages.microsoft.com/config/ubuntu/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2)/packages-microsoft-prod.deb

# Install the package
sudo dpkg -i packages-microsoft-prod.deb

# Delete the file
rm packages-microsoft-prod.deb

# Install package
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
