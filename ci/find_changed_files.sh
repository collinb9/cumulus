#!/usr/bin/env bash

if [ -z "$TRAVIS_BRANCH" ]
then
    echo "No TRAVIS_BRANCH, using existing BRANCH"
else
    export BRANCH=$TRAVIS_BRANCH
fi
echo $BRANCH
export CHANGED_FILES=`git diff --name-only --diff-filter=d origin/${BRANCH} | tr '\n' ' '`
echo $CHANGED_FILES
export CHANGED_TEMPLATES=`git diff --name-only --diff-filter=d origin/${BRANCH} | grep -E 'template.yaml' | tr '\n' ' '`
echo $CHANGED_TEMPLATES