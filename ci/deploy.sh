#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
aws sts get-caller-identity --profile $ENVIRONMENT
=======
aws -version
=======
=======
ci/aws_auth.sh
>>>>>>> 92d202a (fix)
aws --version
>>>>>>> 5ee2619 (fix)
which aws
>>>>>>> 5d1ddcf (debug)
python ci/apply_sam_workflow_merge.py
