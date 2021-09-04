#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

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
aws --version
>>>>>>> 5ee2619 (fix)
which aws
<<<<<<< HEAD
>>>>>>> 5d1ddcf (debug)
=======
aws s3 ls --profile staging
>>>>>>> b737daf (fix)
python ci/apply_sam_workflow_merge.py
