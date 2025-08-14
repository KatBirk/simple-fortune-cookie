#!/bin/bash
set -e
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
REPO="ghcr.io/$docker_username/"
echo "${REPO}"
docker build -t "${REPO}fortune-cookie-app:latest" -t "${REPO}fortune-cookie-app:1.0-$Tag" app/