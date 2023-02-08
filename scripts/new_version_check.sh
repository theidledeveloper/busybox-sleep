#!/bin/bash
set -eu

# REPOSITORY TO CHECK FOR AND SOME CONSTANT VARIABLES
REPO_OWNER="docker-library"
REPO_NAME="busybox"
REPOSITORY_PATH="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}"
FILE="versions.json"

# GET THE SPECIFIC VERSION FROM THE FILE 24 HOURS AGO
# NEED TO ENCODE @{24.hours.ago} to @%7B24.hours.ago%7D
version_24_hours_ago=$(curl ${REPOSITORY_PATH}/HEAD@%7B24.hours.ago%7D/${FILE} | jq -r '.latest.version')

# GET THE CURRENT VERSION
current_version=$(curl "${REPOSITORY_PATH}/HEAD/${FILE}" | jq -r '.latest.version')

# CHECK IF THE VERSION HAS CHANGED WITHIN THE LAST 24 HOURS
if [[ "${version_24_hours_ago}" != "${current_version}" ]]; then
  echo "The version has been updated from ${version_24_hours_ago} to ${current_version} within the last 24 hours. Tagging this repository to trigger rebuild"
  git tag "${current_version}"
  git push origin "${current_version}"
else
  echo "No new releases found, nothing to do"
fi
