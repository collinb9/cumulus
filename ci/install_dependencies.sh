#!/usr/bin/env bash

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip > /dev/null 2>&1
sudo ./aws/install
which aws
aws --version

# AWS SAM CLI
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
sha256sum aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d ~/sam-installation > /dev/null 2>&1
sudo ~/sam-installation/install
sam --version

# cfn-nag
gem install cfn-nag

# Python packages
python -m pip install --upgrade pip
python -m pip install -r dev_requirements.txt
