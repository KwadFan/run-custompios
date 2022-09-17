#!/usr/bin/env bash
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

# This file contains fuctions needed by entypoint.sh

# shellcheck enable=require-variable-braces

set -eou pipefail

# messages
echo_red() {
    echo -e "\e[31m${1}\e[0m"
}

echo_green() {
    echo -e "\e[32m${1}\e[0m"
}

echo_yellow() {
    echo -e "\e[33m${1}\e[0m"
}

echo_blue() {
    echo -e "\e[34m${1}\e[0m"
}

# clone repo
gitclone() {
    local branch repo
    local -a param
    repo="${1}"
    branch="${2}"
    param=()
    if [ "${ACTION_DEBUG}" = "true" ]; then
        param+=(--progress)
    fi

    if [[ -n "${branch}" ]]; then
        param+=(--branch "${branch}")
    fi
    param+=(https://github.com/"${repo}".git /CustomPiOS)

    git clone "${param[@]}"
}

checkout_commit() {
    local sha
    sha="${1}"
    if [[ -n "${CUSTOMPIOS_COMMIT}" ]]; then
        pushd /CustomPiOS || exit 1
            git checkout "${sha}"
        popd || exit 1
    fi
}

build() {
    cd /distro
    if [[ -f "${PWD}/build_dist" ]]; then
        echo_green "Start build ..."
        bash +x ./build_dist
    else
        echo_red "Start build failed, no valid source! Exiting..."
        exit 1
    fi
}
