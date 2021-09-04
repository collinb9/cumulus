#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

export AWS_CONFIG_FILE="~/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="~/.aws/credentials"
aws --version
which aws
aws s3 ls --profile staging
python ci/apply_sam_workflow_merge.py
