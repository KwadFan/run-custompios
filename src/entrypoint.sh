#!/usr/bin/env bash
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

# shellcheck enable=require-variable-braces

set -eoux pipefail

# source functions.sh
if [[ -f "/functions.sh" ]]; then
    source /functions.sh
else
    echo -e "functions.sh not found! Exiting..."
    exit 1
fi

# Check git command
if [[ -z "$(command -v git)" ]]; then
    echo "Command 'git' not found."
    exit 1
fi

# clone repo
if [[ -n "${CUSTOMPIOS_REPO}" ]]; then
    gitclone "${CUSTOMPIOS_REPO}" "$CUSTOMPIOS_BRANCH"
else
    echo -e "CustomPiOS Repository not set! Exiting..."
    exit 1
fi

