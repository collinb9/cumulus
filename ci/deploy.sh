#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

<<<<<<< HEAD
<<<<<<< HEAD
aws sts get-caller-identity --profile $ENVIRONMENT
=======
aws -version
=======
aws --version
>>>>>>> 5ee2619 (fix)
which aws
>>>>>>> 5d1ddcf (debug)
python ci/apply_sam_workflow_merge.py
