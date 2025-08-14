#!/bin/bash
set -e
REPO="ghcr.io/katbirk/fortune-cookie"


# Log in
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin

# Pull the latest images
docker pull "$REPO-frontend:latest"
docker pull "$REPO-backend:latest"

# Deploy with docker-compose
docker compose -f docker-compose.yml up -d