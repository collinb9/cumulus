#!/usr/bin/env bash

mkdir -p ~/.aws

cat > ~/.aws/credentials << EOL
[default]
aws_access_key_id=${AWS_ACCESS_KEY_ID}
aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}

EOL

cat > ~/.aws/config << EOL
[default]
region = eu-west-1
output = json
role_arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default

[profile bastion]
region = eu-west-1
output = json
role_arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default

[profile staging]
region = eu-west-1
output = json
role_arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
source_profile = default

[profile prod]
region = eu-west-1
output = json
role_arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
source_profile = default

EOL

ls ~/.aws

aws configure list