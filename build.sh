#!/usr/bin/env bash
set -ex
IMAGE=docker.montagu.dide.ic.ac.uk:5000/vimc-website-builder:i1205
docker pull $IMAGE
VOLUME=$1
BRANCH=$2
if [ -z $VOLUME ]; then
    VOLUME_MAP=""
else
    if [ "$VOLUME" == . ]; then
        VOLUME=$PWD
    fi
    if [ "$VOLUME" == "$PWD" ]; then
        BRANCH=HEAD
        shift
    fi
    VOLUME_MAP="-v $VOLUME:/srv/jekyll"
fi

docker run -t --rm \
       $VOLUME_MAP \
       $IMAGE \
       build-site.sh $BRANCH
