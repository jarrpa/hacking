#!/bin/bash

set -e

OLD_NAME="${1}"
NEW_NAME="${2}"

go mod edit -module ${NEW_NAME}

find . -type f -name '*.go' \
  -exec sed -i -e "'s,${OLD_NAME},${NEW_NAME},g'" {} \;
