#!/usr/bin/env bash

export CHANGED_TEMPLATES=`git diff --name-only --diff-filter=d origin/master | grep -E 'template.yaml' | tr '\n' ' '`
# if [ -z "$CHANGED_TEMPLATES" ]
# then
# 	export CHANGED_TEMPLATES="hello_world"
# fi