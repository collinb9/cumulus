#!/usr/bin/env bash

mkdir -p ~/.aws

# cat > ~/.aws/credentials << EOL
# [default]
# aws_access_key_id = ${AWS_ACCESS_KEY_ID}
# aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
# EOL
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY

cat > ~/.aws/config << EOL
[profile bastion]
region = eu-west-1
output = json
role-arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion

[profile staging]
region = eu-west-1
output = json
role-arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging

[profile prod]
region = eu-west-1
output = json
role-arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
EOL

ls ~/.aws

aws configure list