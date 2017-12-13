#!/usr/bin/env bash
JEKYLL_VERSION=3.3.1

JEKYLL_IMAGE=jekyll/builder:$JEKYLL_VERSION
BUNDLE_CACHE=vimc-website-bundle-cache

docker pull $JEKYLL_IMAGE

docker volume create $BUNDLE_CACHE

docker run --rm \
       -v $BUNDLE_CACHE:/usr/local/bundle \
       -v ${PWD}:/srv/jekyll \
       $JEKYLL_IMAGE \
       jekyll build
