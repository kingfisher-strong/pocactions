#!/bin/bash
## GITHUB_ACTIONS
## GITHUB_EVENT_NAME
## GITHUB_ACTOR
##
## GITHUB_REPOSITORY
## GITHUB_SHA
## GITHUB_REF
##
## RUNNER_TEMP
## RUNNER_OS
##
## https://rabbit.octopus.app/app#/Spaces-42/projects/docker-site/overview
## https://developer.github.com/v3/repos/releases/#create-a-release


export _RELEASE_VERSION=$(node -e 'console.log(require("./package").version)';)
export _PATCH_VERSION="$(date +"%H%M")"
export _BASE_NAME="$(basename $PWD)"
export _RELEASE_NAME="${_BASE_NAME}.${_RELEASE_VERSION}"
export _RELEASE_TYPE=${1};

echo "Creating [$_RELEASE_NAME] in v[${_RELEASE_VERSION}], will use [$_PATCH_VERSION] patch version for release."

## GitHub Tag and Release
##
function githubRelease {

  ## create tag
  curl -s -XPOST -d '{"ref": "refs/tags/'${_RELEASE_VERSION}'","sha": "'${GITHUB_SHA}'"}' --header "Content-Type:application/json" --header 'Accept:application/vnd.github.mercy-preview+json' --header "Authorization: token  ${GITHUB_TOKEN}" https://api.github.com/repos/${GITHUB_REPOSITORY}/git/refs

  ## create release
  curl -s -XPOST -d '{"name":"'${_RELEASE_VERSION}'","target_commitish":"latest","tag_name":"'${_RELEASE_VERSION}'","body":"","draft":false ,"prerelease":false}' --header "Content-Type:application/json" --header 'Accept:application/vnd.github.mercy-preview+json' --header "Authorization: token  ${GITHUB_TOKEN}" https://api.github.com/repos/${GITHUB_REPOSITORY}/releases

}

if [[ "$_RELEASE_TYPE" == "github" ]]; then
  githubRelease
fi;
