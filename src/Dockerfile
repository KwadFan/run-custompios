# syntax=docker/dockerfile:1
ARG VERSION="bullseye-backports"
FROM debian:${VERSION}


ENV VERSION="bullseye"
ENV PACKAGES="binfmt-support build-essential lsof sudo util-linux fdisk git \
wget curl p7zip-full python3 zip sudo xz-utils"
ENV BPO="qemu qemu-user-static"

RUN set -ex \
    && apt-get update \
    && apt-get install --no-install-recommends --yes ${PACKAGES} \
    && apt-get install --no-install-recommends --yes -t ${VERSION}-backports ${BPO} \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*