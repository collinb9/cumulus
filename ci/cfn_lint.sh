#!/usr/bin/env bash

if [ -z "$CHANGED_TEMPLATES" ]
then
    echo "No changed templates found"
else
    cfn-lint $CHANGED_TEMPLATES
fi