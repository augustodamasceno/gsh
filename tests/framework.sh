#!/usr/bin/env bash
#
# gsh - Shared test framework utilities
#
# Copyright (c) 2015-2026, Augusto Damasceno.
# All rights reserved.
# SPDX-License-Identifier: GPL-3.0
#
# See https://github.com/augustodamasceno/gsh

PASS=0
FAIL=0
SKIP=0
CURRENT_TEST=""

pass() {
    PASS=$((PASS + 1))
    printf '  \033[0;32m[PASS]\033[0m %s\n' "$CURRENT_TEST"
}

fail() {
    FAIL=$((FAIL + 1))
    printf '  \033[0;31m[FAIL]\033[0m %s: %s\n' "$CURRENT_TEST" "$1"
}

skip() {
    SKIP=$((SKIP + 1))
    printf '  \033[0;33m[SKIP]\033[0m %s: %s\n' "$CURRENT_TEST" "$1"
}

assert_eq() {
    local expected="$1"
    local actual="$2"
    if [[ "$expected" == "$actual" ]]; then
        pass
    else
        fail "expected '$expected', got '$actual'"
    fi
}

assert_contains() {
    local needle="$1"
    local haystack="$2"
    if [[ "$haystack" == *"$needle"* ]]; then
        pass
    else
        fail "output does not contain '$needle'"
    fi
}

assert_exit_ok() {
    if [[ $1 -eq 0 ]]; then
        pass
    else
        fail "expected exit 0, got $1"
    fi
}

assert_exit_fail() {
    if [[ $1 -ne 0 ]]; then
        pass
    else
        fail "expected non-zero exit, got 0"
    fi
}

assert_file_exists() {
    if [[ -f "$1" ]]; then
        pass
    else
        fail "file '$1' does not exist"
    fi
}

assert_dir_exists() {
    if [[ -d "$1" ]]; then
        pass
    else
        fail "directory '$1' does not exist"
    fi
}

assert_not_empty() {
    if [[ -n "$1" ]]; then
        pass
    else
        fail "expected non-empty value"
    fi
}

print_results() {
    local name="${1:-tests}"
    printf '\n  \033[1m%s\033[0m: \033[0;32m%d passed\033[0m, \033[0;31m%d failed\033[0m, \033[0;33m%d skipped\033[0m\n' \
        "$name" "$PASS" "$FAIL" "$SKIP"
    [[ $FAIL -eq 0 ]]
}
