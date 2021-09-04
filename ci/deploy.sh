#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

# export AWS_DEFAULT_PROFILE=$ENVIRONMENT
# export AWS_CONFIG_FILE="~/.aws/config"
# export AWS_SHARED_CREDENTIALS_FILE="~/.aws/credentials"
# aws --version
# aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
# aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY

# aws configure set staging.region eu-west-1
# aws configure set staging.output json
# aws configure set staging.role

aws sts get-caller-identity --profile $ENVIRONMENT
python ci/apply_sam_workflow_merge.py
