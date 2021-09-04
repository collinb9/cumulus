#!/usr/bin/env bash
sam build --config-env ${1}
sam deploy --config-env "$@"