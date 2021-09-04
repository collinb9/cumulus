#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

ci/aws_auth.sh
aws --version
which aws
python ci/apply_sam_workflow_merge.py
