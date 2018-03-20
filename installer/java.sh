#!/bin/sh


echo "Installing Java..."

apk add --no-cache ${JAVA_PACKAGE} || exit 1

echo "Java Installed."

exit 0
