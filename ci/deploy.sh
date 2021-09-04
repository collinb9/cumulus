#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

<<<<<<< HEAD
aws sts get-caller-identity --profile $ENVIRONMENT
=======
aws -version
which aws
>>>>>>> 5d1ddcf (debug)
python ci/apply_sam_workflow_merge.py
