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
<<<<<<< HEAD
>>>>>>> 5d1ddcf (debug)
=======
aws s3 ls --profile staging
<<<<<<< HEAD
>>>>>>> b737daf (fix)
python ci/apply_sam_workflow_merge.py
=======
cd iam/roles
sam build --config-env $ENVIRONMENT
sam deploy --config-env $ENVIRONMENT
# python ci/apply_sam_workflow_merge.py
>>>>>>> 3685ecd (try this)
=======
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws s3 ls --profile staging
# cd iam/roles
# sam build --config-env $ENVIRONMENT
# sam deploy --config-env $ENVIRONMENT
python ci/apply_sam_workflow_merge.py
>>>>>>> d5b89e6 (try this)
