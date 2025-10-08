#!/usr/bin/env sh

usage="$(basename "$0") [-h] [<outputDir>] -- generate the docs to given output dir [default: output]"

# shellcheck disable=SC2034
if getopts ":h" option
then
  echo "$usage"
  exit
fi

rootDir=$PWD

inputDir="docs/en"

outputArg="${1}"
firstChar=$(echo "$1" | cut -c1-1)

if [ "$firstChar" != "/" ]
then
  # Output directory should be relative to working directory
  outputArg="$rootDir/$outputArg"
fi

defaultOutputDir="$rootDir/output"
outputDir="${outputArg:-${defaultOutputDir:-default}}"

baseDir=$(dirname "$(dirname "$0")")
output=$(composer install -d "$baseDir" 2>&1) || print "$output"

"$baseDir/vendor/bin/guides" -vvv --no-progress --fail-on-log "$rootDir/$inputDir" --output="$outputDir"
