#!/usr/bin/env sh

# NOTE: this runs in the jekyll containers plain bourne shell so bash
# extensions are unlikely to work

set -ex
SRC=/srv/jekyll
BRANCH=$1
if [ -z "$BRANCH" ]; then
    BRANCH=origin/master
fi

if [ $BRANCH == "HEAD" ]; then
    echo "Not updating git HEAD"
    if [ ! -d $SRC/.git ]; then
        echo "Can't use branch 'HEAD' if sources are not already checked out"
        exit 1
    fi
else
    if [ -d $SRC/.git ]; then
        echo "Updating existing website sources"
        git -C $SRC fetch
    else
        echo "Fetching website sources"
        git clone https://github.com/vimc/vimc-website $SRC
    fi
    echo "Setting git to $BRANCH"
    git -C $SRC reset --hard $BRANCH
fi

if [ -d $USER_BUNDLE_CACHE ]; then
    echo "Bundle cache already set up"
else
    echo "Setting up bundle cache"
    cp -r /usr/local/bundle_src $USER_BUNDLE_CACHE
fi

echo "Building website"
jekyll build
