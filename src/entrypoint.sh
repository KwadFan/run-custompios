#!/usr/bin/env bash
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

set -eoux pipefail

echo $SHELL
echo "Hello! I am working :)"

# Check git command
if [[ -z "$(command -v git)" ]]; then
    echo "Command 'git' not found."
    exit 1
fi
