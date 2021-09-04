#!/usr/bin/env bash

export ENVIRONMENT=${1}

echo "Deploying $ENVIRONMENT ..."

export AWS_DEFAULT_PROFILE=$ENVIRONMENT
export AWS_CONFIG_FILE="~/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="~/.aws/credentials"
aws --version
which aws
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY

cat > ~/.aws/config << EOL
[default]
region = eu-west-1
output = json
role-arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default

[profile bastion]
region = eu-west-1
output = json
role-arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default

[profile staging]
region = eu-west-1
output = json
role-arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
source_profile = default

[profile prod]
region = eu-west-1
output = json
role-arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
source_profile = default

EOL

aws s3 ls --profile staging
aws sts get-caller-identity
aws sts get-caller-identity --profile staging
# cd iam/roles
# sam build --config-env $ENVIRONMENT
# sam deploy --config-env $ENVIRONMENT
python ci/apply_sam_workflow_merge.py
