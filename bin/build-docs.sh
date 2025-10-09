#!/usr/bin/env sh

usage="$(basename "$0") [-h] [<outputDir>] -- generate docs to given output dir [default: docs/output]"

# shellcheck disable=SC2034
if getopts ":h" option
then
  echo "$usage"
  exit
fi

docsRoot="$PWD/docs"

outputArg="${1}"
firstChar=$(echo "$1" | cut -c1-1)

if [ "$firstChar" != "/" ] && [ "$firstChar" != "" ]
then
  # The output path provided is not an absolute path;
  # therefore treat the path as relative to the working dir (project root).
  outputArg="$docsRoot/$outputArg"
fi

defaultOutputDir="$docsRoot/output"
outputDir="${outputArg:-${defaultOutputDir:-default}}"

"$docsRoot/vendor/bin/guides" -vvv --no-progress --fail-on-log "$docsRoot/en" --output="$outputDir"
