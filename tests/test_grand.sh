#!/usr/bin/env bash
#
# gsh - Tests for grand
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/grand"

CURRENT_TEST="grand: default (no args) produces output"
out=$("$SCRIPT" 2>&1)
assert_exit_ok $?
assert_not_empty "$out"

CURRENT_TEST="grand: default output is 16 bytes"
out_default=$("$SCRIPT")
assert_eq "16" "${#out_default}"

CURRENT_TEST="grand: produces output of the requested length"
out32=$("$SCRIPT" 32)
assert_eq "32" "${#out32}"

CURRENT_TEST="grand: output consists of valid base64 characters"
if echo "$out32" | grep -qE '^[A-Za-z0-9+/=]+$'; then pass; else fail "output contains non-base64 chars: $out32"; fi

CURRENT_TEST="grand: -o flag (openssl) produces non-empty output"
if ! command -v openssl >/dev/null 2>&1; then
    skip "openssl not installed"
else
    out_o=$("$SCRIPT" 16 -o 2>&1)
    assert_exit_ok $?
    assert_not_empty "$out_o"
fi

CURRENT_TEST="grand: invalid flag shows error"
out_bad=$("$SCRIPT" 16 -x 2>&1)
assert_contains "Invalid" "$out_bad"

CURRENT_TEST="grand: two runs produce different output"
run1=$("$SCRIPT" 32)
run2=$("$SCRIPT" 32)
if [[ "$run1" != "$run2" ]]; then pass; else fail "identical output on two runs (extremely unlikely)"; fi

print_results "grand"
