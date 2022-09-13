# For local development only
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

build:
	docker build -t kwadfan:run-custompios ./src

run:
	docker run --rm -it kwadfan:run-custompios /bin/bash

prune:
	docker image rm -f kwadfan:run-custompios