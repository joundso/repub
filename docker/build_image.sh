#!/bin/bash
set -e 
set -o pipefail

source ./.env

## Variables:
REGISTRY_PREFIX=${REGISTRY_PREFIX}
IMAGE_NAME=${IMAGE_NAME}
VERSION_TAG=${IMAGE_VERSION_TAG}

## Should the docker building process build using caching? (true/false)
docker_build_with_cache=true

## -------------------------------------------
## Starting the actual script:
## -------------------------------------------

if [ "$docker_build_with_cache" = true ]
then
    docker_build_no_cache=false
else
    docker_build_no_cache=true
fi

printf "\n\n##################################\n"
printf "Building images with version tag $VERSION_TAG"
printf "\n##################################\n"

printf "\n\nPlease insert your login credentials to registry: $REGISTRY_PREFIX ...\n"
docker login

printf "\n\n##################################\n"
printf "$IMAGE_NAME"
printf "\n##################################\n"
printf "\nPulling cached $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
printf "\n\nBuilding $REGISTRY_PREFIX/$IMAGE_NAME image (latest):\n"

docker build \
    --progress=plain \
    --no-cache=${docker_build_no_cache} \
    --label "org.label-schema.name=$REGISTRY_PREFIX/$IMAGE_NAME" \
    --label "org.label-schema.vsc-url=https://github.com/joundso/repub" \
    --label "org.label-schema.vcs-ref=$(git rev-parse HEAD)" \
    --label "org.label-schema.version=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -f ./Dockerfile \
    -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log

printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# Push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"

# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
printf "\n\nPushing $IMAGE_NAME image ($VERSION_TAG)\n"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"

echo 'Hooray :-)'
exit 0
