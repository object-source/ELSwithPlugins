#!/bin/bash
set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=objectsource
# image name
IMAGE=els-with-plugins
docker build -t $USERNAME/$IMAGE:latest .
