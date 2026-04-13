#!/usr/bin/env bash
#
# gsh - Test runner for all scripts
#
# Copyright (c) 2015-2026, Augusto Damasceno.
# All rights reserved.
# SPDX-License-Identifier: GPL-3.0
#
# See https://github.com/augustodamasceno/gsh
#
# Usage: run_tests.sh

TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
TOTAL_PASS=0
TOTAL_FAIL=0
TOTAL_SKIP=0
FILES_PASS=0
FILES_FAIL=0

for test_file in "$TESTS_DIR"/test_*.sh; do
    name=$(basename "$test_file" .sh | sed 's/^test_//')
    printf '\n\033[1m=== %s ===\033[0m\n' "$name"
    output=$(bash "$test_file" 2>&1)
    exit_code=$?
    echo "$output"

    p=$(echo "$output" | grep -c '\[PASS\]' 2>/dev/null)
    f=$(echo "$output" | grep -c '\[FAIL\]' 2>/dev/null)
    s=$(echo "$output" | grep -c '\[SKIP\]' 2>/dev/null)

    TOTAL_PASS=$((TOTAL_PASS + p))
    TOTAL_FAIL=$((TOTAL_FAIL + f))
    TOTAL_SKIP=$((TOTAL_SKIP + s))

    if [[ $exit_code -eq 0 ]]; then
        FILES_PASS=$((FILES_PASS + 1))
    else
        FILES_FAIL=$((FILES_FAIL + 1))
    fi
done

printf '\n\033[1m========================================\033[0m\n'
printf 'Results : \033[0;32m%d passed\033[0m, \033[0;31m%d failed\033[0m, \033[0;33m%d skipped\033[0m\n' \
    "$TOTAL_PASS" "$TOTAL_FAIL" "$TOTAL_SKIP"
printf 'Files   : %d/%d passed\n' "$FILES_PASS" "$((FILES_PASS + FILES_FAIL))"
printf '\033[1m========================================\033[0m\n'

[[ $TOTAL_FAIL -eq 0 ]]
