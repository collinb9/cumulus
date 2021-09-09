#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

aws sts get-caller-identity --profile $ENVIRONMENT
python ci/apply_sam_workflow_merge.py
