#!/usr/bin/env bash

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

# cfn-nag
gem install cfn-nag

# Python packages
python -m pip install -r dev_requirements.txt
