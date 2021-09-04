#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

aws --version
which aws
aws s3 ls --profile staging
python ci/apply_sam_workflow_merge.py
