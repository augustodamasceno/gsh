#!/usr/bin/env bash
#
# gsh - Tests for ghmac
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/ghmac"

CURRENT_TEST="ghmac: requires openssl (dependency check)"
if ! command -v openssl >/dev/null 2>&1; then
    skip "openssl not installed"
else
    CURRENT_TEST="ghmac: exits successfully with valid args"
    out=$("$SCRIPT" sha256 password salt 2>&1)
    assert_exit_ok $?

    CURRENT_TEST="ghmac: produces non-empty output"
    assert_not_empty "$out"

    CURRENT_TEST="ghmac: output contains an equals sign (hash format)"
    assert_contains "=" "$out"

    CURRENT_TEST="ghmac: sha256 output is deterministic"
    out2=$("$SCRIPT" sha256 password salt 2>&1)
    assert_eq "$out" "$out2"

    CURRENT_TEST="ghmac: different password produces different output"
    out3=$("$SCRIPT" sha256 different_password salt 2>&1)
    if [[ "$out" != "$out3" ]]; then pass; else fail "same output for different passwords"; fi

    CURRENT_TEST="ghmac: sha512 runs successfully"
    out4=$("$SCRIPT" sha512 password salt 2>&1)
    assert_exit_ok $?
    assert_not_empty "$out4"
fi

print_results "ghmac"
