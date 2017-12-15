#!/usr/bin/env bash
set -e

GIT_ID=$(git rev-parse --short=7 HEAD)
GIT_BRANCH=$(git symbolic-ref --short HEAD)

REGISTRY=docker.montagu.dide.ic.ac.uk:5000
NAME=vimc-website-builder

COMMIT_TAG=$REGISTRY/$NAME:$GIT_ID
BRANCH_TAG=$REGISTRY/$NAME:$GIT_BRANCH

docker build -t $COMMIT_TAG -t $BRANCH_TAG .
docker push $COMMIT_TAG
docker push $BRANCH_TAG
