#!/bin/bash
set -e 
set -o pipefail

## Stop the new container:
cd ./docker
docker-compose down
docker system prune -f
cd ..
