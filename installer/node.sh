#!/bin/sh

echo "Installing Node ${NODE_VERSION}..."

cd /tmp && \
    curl -o node-v${NODE_VERSION}.tar.gz -SsL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz && \
    tar -zxf node-v${NODE_VERSION}.tar.gz && \
    cd node-v${NODE_VERSION} && \
    export GYP_DEFINES="linux_use_gold_flags=0" && \
    ./configure --fully-static --prefix=/usr && \
    NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make -j${NPROC} -C out mksnapshot BUILDTYPE=Release && \
    paxctl -cm out/Release/mksnapshot && \
    make -j${NPROC} && \
    make install && \
    paxctl -cm /usr/bin/node || exit 1

if [ -x /usr/bin/npm ]; then
    npm install -g npm@${NPM_VERSION} &&
        find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf || exit 1
fi

echo "Node ${NODE_VERSION} Installed"
exit 0
