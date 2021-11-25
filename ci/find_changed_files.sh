#!/usr/bin/env bash

branch=$1

if [ -z "$branch" ]
then
    echo "No branch given"
    exit 1
fi

echo Branch - $branch
export CHANGED_FILES=`git diff --name-only --diff-filter=d origin/${branch} | tr '\n' ' '`
echo $CHANGED_FILES
export CHANGED_TEMPLATES=`git diff --name-only --diff-filter=d origin/${branch} | grep -E 'template.yaml' | tr '\n' ' '`
echo $CHANGED_TEMPLATES
