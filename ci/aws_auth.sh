#!/usr/bin/env bash

mkdir -p ~/.aws

<<<<<<< HEAD
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
=======
# cat > ~/.aws/credentials << EOL
# [default]
# aws_access_key_id = ${AWS_ACCESS_KEY_ID}
# aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
# EOL
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
>>>>>>> 7bba033 (Debug travis deploy (#14))

cat > ~/.aws/config << EOL
[default]
region = eu-west-1
output = json
role_arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default

[profile bastion]
region = eu-west-1
output = json
<<<<<<< HEAD
role_arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
source_profile = default
=======
role-arn = arn:aws:iam::564188978527:role/IAMAdmin-bastion
<<<<<<< HEAD
>>>>>>> 7bba033 (Debug travis deploy (#14))
=======
source_profile = default
>>>>>>> 1f62da4 (add back source profile)

[profile staging]
region = eu-west-1
output = json
<<<<<<< HEAD
role_arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
=======
role-arn = arn:aws:iam::626964907981:role/DeveloperAccess-staging
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 4f5c3d4 (Fix aws profiles in travis (#13))
source_profile = default
=======
>>>>>>> 7bba033 (Debug travis deploy (#14))
=======
source_profile = default
>>>>>>> 1f62da4 (add back source profile)

[profile prod]
region = eu-west-1
output = json
<<<<<<< HEAD
role_arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
=======
role-arn = arn:aws:iam::875094265107:role/DeveloperAccess-prod
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 4f5c3d4 (Fix aws profiles in travis (#13))
source_profile = default

=======
>>>>>>> 7bba033 (Debug travis deploy (#14))
=======
source_profile = default
>>>>>>> 1f62da4 (add back source profile)
EOL

ls ~/.aws

<<<<<<< HEAD
aws configure list
=======
aws configure list
>>>>>>> 7bba033 (Debug travis deploy (#14))
