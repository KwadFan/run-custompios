# syntax=docker/dockerfile:1
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

ARG VERSION="bullseye-backports"
FROM debian:${VERSION}

ENV VERSION="bullseye"
ENV PACKAGES="binfmt-support build-essential lsof sudo util-linux fdisk git \
wget curl p7zip-full python3 zip sudo xz-utils ca-certificates"
ENV BPO="qemu qemu-user-static"

#Initialize external ENV Vars
ENV CUSTOMPIOS_REPO=""
ENV CUSTOMPIOS_BRANCH=""
ENV CUSTOMPIOS_COMMIT=""

# Install Dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install --no-install-recommends --yes ${PACKAGES} \
    && apt-get install --no-install-recommends --yes -t ${VERSION}-backports ${BPO} \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

# link python interpreter
RUN ln -s /usr/bin/python3 /usr/bin/python

# mount point for external source
RUN mkdir -p /distro

COPY entrypoint.sh /entrypoint.sh
COPY functions.sh /functions.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/entrypoint.sh" ]
