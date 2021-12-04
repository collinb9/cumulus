#!/usr/bin/env bash
sam build --config-env ${1}
sam package --config-env ${1} > /dev/null
sam deploy --config-env "$@"
