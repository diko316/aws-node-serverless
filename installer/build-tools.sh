#!/bin/sh

echo "Installing Build tools..."

apk add --no-cache \
        curl \
        python \
        linux-headers \
        build-base \
        paxctl \
        libgcc \
        libstdc++ \
        gnupg \
        musl-dev \
        pcre-dev || exit 1

echo "Build tools Installed..."

exit 0
