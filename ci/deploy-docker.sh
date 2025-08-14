#!/bin/bash
set -e

# Log in
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin

# Pull the latest images
docker pull "ghcr.io/$docker_username/fortune-cookie-frontend:latest"
docker pull "ghcr.io/$docker_username/fortune-cookie-backend:latest"

# Deploy with docker-compose
docker-compose -f docker-compose.yml up -d