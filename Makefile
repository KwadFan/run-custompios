# For local development only
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

build:
	docker build -t kwadfan:run-custompios ./src

test:
	docker run --force-rm kwadfan:run-custompios

run:
	docker run --force-rm -it --entrypoint /bin/bash kwadfan:run-custompios

prune:
	docker image rm -f kwadfan:run-custompios
