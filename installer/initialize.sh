#!/bin/sh

echo "Updating Packages..."

apk update && \
    apk upgrade || exit 1

echo "Package list updated..."

exit 0
