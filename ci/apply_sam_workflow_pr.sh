#!/usr/bin/env bash

branch="$1"

git remote set-branches --add origin $branch
git fetch
source ci/find_changed_files.sh
python ci/apply_sam_workflow_pr.py

