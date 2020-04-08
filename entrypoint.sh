#!/bin/sh -l

# Diagnostic output:
echo "Using options:"

echo "update"
echo "${{ inputs.package }}"
echo "--revision=${{ inputs.revision }}"
echo "--branch=${{ inputs.branch }}"
echo "--version=${{ inputs.version}}"
echo "--filename=./Gopkg.toml"
echo "--verbose"

echo '============================='
echo

# Runs tomles:
output=$($GOPATH/bin/tomles update ${{ inputs.package }} --revision=${{ inputs.revision }} --branch=${{ inputs.branch }} --version=${{ inputs.version}} --filename=./Gopkg.toml --verbose)
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