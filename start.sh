#!/bin/bash
set -e 
set -o pipefail

## Stop currently running container and clean up:
bash ./stop.sh

## Remove stuff from last container runtime:
rm -rf ./.cache ./.local ./.quarto ./.Rproj.user ./.Rhistory

## Start the new container:
cd ./docker
docker-compose up -d
cd ..

## Open firefox with login mask:
printf "Log in with username 'rstudio' and password 'pwd' at http://127.0.0.1:8080/ - If this does not work, have a look at the README.md file."
start firefox http://127.0.0.1:8080/
