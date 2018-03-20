#!/bin/sh

echo "Installing AWS ..."

mkdir -p /tmp && \
    cd /tmp && \
    apk --no-cache add \
        bash \
        bash-completion \
        groff \
        less \
        jq \
        py-pip \
        openssh && \
    pip install --upgrade \
        awscli \
        pip \
        python-dateutil && \
    ln -s /usr/bin/aws_bash_completer /etc/profile.d/aws_bash_completer.sh && \
    curl -sSL --output ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip && \
    curl -sSL --output ${RDS_TMP} http://s3.amazonaws.com/rds-downloads/RDSCli.zip && \
    unzip -q ${S3_TMP} -d /tmp && \
    unzip -q ${RDS_TMP} -d /tmp && \
    mv ${S3_ZIP}/S3 ${S3_ZIP}/s3cmd /usr/bin/ && \
    mv /tmp/RDSCli-${RDS_VERSION} /usr/local/ && \
    rm -rf /tmp/* && \
    mkdir ~/.aws && \
    chmod 700 ~/.aws || exit 1

echo "AWS installed."

exit 0
