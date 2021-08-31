#!/usr/bin/env bash

export CHANGED_FILES=`git diff --name-only --diff-filter=d origin/${BRANCH} | tr '\n' ' '`
export CHANGED_TEMPLATES=`git diff --name-only --diff-filter=d origin/${BRANCH} | grep -E 'template.yaml' | tr '\n' ' '`