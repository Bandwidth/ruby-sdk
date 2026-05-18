#!/bin/bash

# Generates new test files for models. Run from the root.

# allow generator to write test files
sed -i.bak 's|^/spec/\*\*|# /spec/**|' .openapi-generator-ignore && rm .openapi-generator-ignore.bak
# remove current test files for models
rm -f ./spec/unit/models/*
# generate new test files for models
openapi-generator-cli generate -i bandwidth.yml -o ./ -c openapi-config.yml -g ruby > /dev/null
# move generated model test files to the correct location (exclude api tests)
mv ./spec/models/* ./spec/unit/models/
# remove remaining generated test files (api tests, etc.)
rm -rf ./spec/api ./spec/models
# discard changes to modified files only (leaves deletions and new test files intact)
modified=$(git diff --name-only --diff-filter=M) && [ -n "$modified" ] && echo "$modified" | xargs git checkout --
