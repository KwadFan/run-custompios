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
ENV CUSTOMPIOS="https://github.com/guysoft/CustomPiOS.git"

# Install Dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install --no-install-recommends --yes ${PACKAGES} \
    && apt-get install --no-install-recommends --yes -t ${VERSION}-backports ${BPO} \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

# Get latest CustomPiOS
RUN git clone ${CUSTOMPIOS} /CustomPiOS
