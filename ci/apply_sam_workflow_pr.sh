#!/usr/bin/env bash

git remote set-branches --add origin $TRAVIS_BRANCH
git fetch
ci/find_changed_files.sh
python ci/apply_sam_workflow_pr.py

