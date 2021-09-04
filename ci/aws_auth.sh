#!/usr/bin/env bash

mkdir -p ~/.aws

cat > ~/.aws/credentials << EOL
[default]
<<<<<<< HEAD
aws_access_key_id=${AWS_ACCESS_KEY_ID}
aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}

=======
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
>>>>>>> 4f5c3d4 (Fix aws profiles in travis (#13))
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
<<<<<<< HEAD
role_arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
=======
role-arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
>>>>>>> 4f5c3d4 (Fix aws profiles in travis (#13))
source_profile = default

[profile prod]
region = eu-west-1
output = json
<<<<<<< HEAD
role_arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
=======
role-arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
>>>>>>> 4f5c3d4 (Fix aws profiles in travis (#13))
source_profile = default

EOL

ls ~/.aws

aws configure list
