FROM gliderlabs/alpine:3.6

ENV JAVA_PACKAGE=openjdk8 NODE_VERSION=8.10.0 NPM_VERSION=latest
ENV S3_TMP=/tmp/s3cmd.zip S3_ZIP=/tmp/s3cmd-master
ENV RDS_TMP=/tmp/RDSCLi.zip RDS_VERSION=1.19.004

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV AWS_RDS_HOME=/usr/local/RDSCli-${RDS_VERSION}
ENV PATH ${PATH}:${AWS_RDS_HOME}/bin:${JAVA_HOME}/bin:${AWS_RDS_HOME}/bin
ENV PAGER more

COPY ./installer /opt/install-cache

RUN /opt/install-cache/initialize.sh && \
    /opt/install-cache/build-tools.sh && \
    /opt/install-cache/java.sh && \
    /opt/install-cache/aws.sh && \
    /opt/install-cache/node.sh && \
    /opt/install-cache/cleanup.sh && \
    mkdir -p /opt/app && \
    cd /opt/app && \
    npm install -g serverless && \
    rm -Rf /opt/install-cache && exit 0

VOLUME ["~/.aws"]

WORKDIR /opt/app
