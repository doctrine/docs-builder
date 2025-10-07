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

defaultOutputDir="$rootDir/output"
outputDir="${1:-${defaultOutputDir:-default}}"

baseDir=$(dirname "$0")

cd "$baseDir" || exit
cd ../
composer install

vendor/bin/guides -vvv --no-progress --fail-on-log "$rootDir/$inputDir" --output="$outputDir"
cd "$rootDir" || exit