#!/bin/bash

# Source the project constants
source ./project_constants.sh

# Build the Docker image
docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} -f Dockerfile 

