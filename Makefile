# For local development only
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

.PHONY: build test run prune buildtest

build:
	docker build --force-rm --tag kwadfan:run-custompios ./src

test:
	docker run --rm \
	--env CUSTOMPIOS_REPO=guysoft/CustomPiOS \
	--env CUSTOMPIOS_BRANCH=devel \
	--env ACTION_DEBUG=true \
	kwadfan:run-custompios

buildtest:
	docker run --rm \
	--env CUSTOMPIOS_REPO=guysoft/CustomPiOS \
	--env CUSTOMPIOS_BRANCH=devel \
	--env ACTION_DEBUG=true \
	-v "${PWD}"/test/src:/distro \
	kwadfan:run-custompios

run:
	docker run --rm -it --entrypoint /bin/bash kwadfan:run-custompios

prune:
	docker image rm -f kwadfan:run-custompios
