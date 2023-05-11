#!/bin/bash
set -e 
set -o pipefail

## Stop running containers:
cd ./docker
docker-compose down
cd ..

## Clean up:
docker system prune -f
