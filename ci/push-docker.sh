#!/bin/bash
set -e
REPO="ghcr.io/katbirk/fortune-cookie"

# Log in
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin

docker push "$REPO-frontend:latest"
docker push "$REPO-frontend:1.0-${GIT_COMMIT::8}" &
docker push "$REPO-backend:latest"
docker push "$REPO-backend:1.0-${GIT_COMMIT::8}" &

wait
