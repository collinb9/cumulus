#!/usr/bin/env bash

branch=$1

git remote set-branches --add origin $branch
git fetch
. ci/find_changed_files.sh $branch
python ci/test_sam_workflow_pr.py
