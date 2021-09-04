#!/usr/bin/env bash

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip > /dev/null 2>&1
./aws/install
which aws
aws --version

# cfn-nag
gem install cfn-nag

# Python packages
python -m pip install -r dev_requirements.txt
