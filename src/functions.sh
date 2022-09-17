#!/usr/bin/env bash
# written by Stephan Wendel aka KwadFan <me@stephanwe.de>
# Copyright 2022
# This file is distributed under GPLv3

# This file contains fuctions needed by entypoint.sh

# shellcheck enable=require-variable-braces

set -xeou pipefail

# clone repo
gitclone() {
    local branch repo
    repo="${1}"
    branch="${2}"
    if [[ -z "${branch}" ]]; then
        git clone --depth=1 https://github.com/"${repo}".git /CustomPiOS
    fi
    if [[ -n "${branch}" ]]; then
        git clone "${repo}" --branch "${branch}" \
        https://github.com/"${repo}".git /CustomPiOS
    fi
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

