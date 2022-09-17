#!/usr/bin/env bash
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

# shellcheck enable=require-variable-braces

set -eou pipefail

# Debug
if [ "${ACTION_DEBUG}" = "true" ]; then
    echo -e "\e[33mDebug: Verbose output enabled!\e[0m"
    set -x
fi

# source functions.sh
if [[ -f "/functions.sh" ]]; then
    source /functions.sh
else
    echo -e "\e[31mERROR: functions.sh not found! \e[0mExiting..."
    exit 1
fi

# Check git command
if [[ -z "$(command -v git)" ]]; then
    echo_red "Command 'git' not found. Exiting..."
    exit 1
fi

# clone repo
if [[ -n "${CUSTOMPIOS_REPO}" ]]; then
    echo_blue "Clone CustomPiOS repo from ${CUSTOMPIOS_REPO}"
    gitclone "${CUSTOMPIOS_REPO}" "$CUSTOMPIOS_BRANCH"
else
    echo_red "CustomPiOS Repository not set! Exiting..."
    exit 1
fi

# Checkout commit
if [[ -n "${CUSTOMPIOS_COMMIT}" ]]; then
    echo_blue "Checkout CustomPiOS commit: ${CUSTOMPIOS_COMMIT}"
    checkout_commit "${CUSTOMPIOS_COMMIT}"
fi

#start build
build
