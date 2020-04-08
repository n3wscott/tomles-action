#!/bin/sh -l

# Diagnostic output:
echo "Using options:"

echo "update"
echo "$INPUT_PACKAGE"
echo "--revision=$INPUT_REVISON"
echo "--branch=$INPUT_BRANCH"
echo "--version=$INPUT_VERSION"
echo "--filename=./Gopkg.toml"
echo "--verbose"

echo '============================='
echo

# Runs tomles:
output=$($GOPATH/bin/tomles update $INPUT_PACKAGE --revision=$INPUT_REVISON --branch=$INPUT_BRANCH --version=$INPUT_VERSION --filename=./Gopkg.toml --verbose)
status="$?"

# Sets the output variable for Github Action API:
# See: https://help.github.com/en/articles/development-tools-for-github-action
echo "::set-output name=output::$output"
echo '================================='
echo

# Fail the build in case status code is not 0:
if [ "$status" -ge 100 ]; then
  echo 'Failing with output:'
  echo "$output"
  echo "Process failed with the status code: $status"
  exit "$status"
fi