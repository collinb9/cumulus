#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
>>>>>>> b737daf (fix)
=======
export AWS_CONFIG_FILE="~/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="~/.aws/credentials"
>>>>>>> 9c25efb (export config and credentials location)
aws --version
>>>>>>> 5ee2619 (fix)
which aws
<<<<<<< HEAD
>>>>>>> 5d1ddcf (debug)
=======
aws s3 ls --profile staging
>>>>>>> b737daf (fix)
python ci/apply_sam_workflow_merge.py
