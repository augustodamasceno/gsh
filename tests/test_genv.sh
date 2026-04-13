#!/usr/bin/env bash
#
# gsh - Tests for genv
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/genv"

CURRENT_TEST="genv: invalid option shows error message"
out=$("$SCRIPT" -z 2>&1)
assert_contains "no option" "$out"

CURRENT_TEST="genv: -n without name falls through to error"
out2=$("$SCRIPT" -n 2>&1)
assert_contains "no option" "$out2"

CURRENT_TEST="genv: -l lists envs or reports none when ~/myvenvs missing"
if [[ ! -d ~/myvenvs ]]; then
    out3=$("$SCRIPT" -l 2>&1)
    assert_contains "none" "$out3"
else
    CURRENT_TEST="genv: -l runs without error when ~/myvenvs exists"
    "$SCRIPT" -l >/dev/null 2>&1
    assert_exit_ok $?
fi

CURRENT_TEST="genv: -n creates a virtualenv"
if ! command -v python3 >/dev/null 2>&1; then
    skip "python3 not available"
else
    test_venv_name="gsh_test_venv_$$"
    "$SCRIPT" -n "$test_venv_name" >/dev/null 2>&1
    assert_dir_exists "$HOME/myvenvs/$test_venv_name"
    rm -rf "$HOME/myvenvs/$test_venv_name"
fi

print_results "genv"
