#!/bin/bash
set -e

# Determine tag
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
REPO="ghcr.io/$docker_username/fortune-cookie"

echo "Building frontend and backend images with tags: latest and 1.0-$Tag"

# Build all services using docker-compose
docker-compose -f docker-compose.yml build \
    --build-arg REPO="$REPO" \
    --build-arg TAG="$Tag"

# Tag images for GHCR
docker tag fortune-cookie-frontend "$REPO-frontend:latest"
docker tag fortune-cookie-frontend "$REPO-frontend:1.0-$Tag"
docker tag fortune-cookie-backend "$REPO-backend:latest"
docker tag fortune-cookie-backend "$REPO-backend:1.0-$Tag"
