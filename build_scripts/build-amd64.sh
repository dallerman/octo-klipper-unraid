#!/usr/bin/env sh

REPO=dallerman
IMAGE=octoprint-klipper
TAG=amd64

# Build & push latest
docker build -t ${REPO}/${IMAGE}:${TAG} --pull --no-cache --compress ../
docker push ${REPO}/${IMAGE}:${TAG}
