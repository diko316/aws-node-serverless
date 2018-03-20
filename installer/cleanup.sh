#!/bin/sh

echo 'Cleanup Traces of Installation...'

#####################################################
# Purge build tools
#####################################################
apk del curl \
        linux-headers \
        build-base \
        paxctl \
        libgcc \
        libstdc++ \
        gnupg \
        musl-dev \
        pcre-dev

#####################################################
# Purge directories
#####################################################
rm -rf /etc/ssl \
		/usr/share/man \
		/usr/include/* \
		/tmp/* \
		/var/cache/apk/* \
		/root/.npm \
		/root/.node-gyp \
		/root/.gnupg \
		/usr/lib/node_modules/npm/man \
		/usr/lib/node_modules/npm/doc \
		/usr/lib/node_modules/npm/html > /dev/null


echo "Cleanup Success!"

exit 0
