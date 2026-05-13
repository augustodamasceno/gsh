#!/usr/bin/env bash
#
# gsh - Tests for gwmirror
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gwmirror"

CURRENT_TEST="gwmirror: exits with error on missing argument"
"$SCRIPT" 2>/dev/null
assert_exit_fail $?

CURRENT_TEST="gwmirror: stderr message on missing argument"
out=$("$SCRIPT" 2>&1)
assert_contains "Wrong number" "$out"

CURRENT_TEST="gwmirror: exits with error on too many arguments"
"$SCRIPT" http://example.com extra 2>/dev/null
assert_exit_fail $?

CURRENT_TEST="gwmirror: requires wget (dependency check)"
if ! command -v wget >/dev/null 2>&1; then
    skip "wget not installed"
else
    tmpdir=$(mktemp -d)
    pushd "$tmpdir" >/dev/null

    CURRENT_TEST="gwmirror: exits successfully mirroring example.com"
    "$SCRIPT" http://example.com >/dev/null 2>&1
    assert_exit_ok $?

    CURRENT_TEST="gwmirror: creates example.com directory"
    assert_dir_exists "$tmpdir/example.com"

    CURRENT_TEST="gwmirror: downloads index page from example.com"
    assert_file_exists "$tmpdir/example.com/index.html"

    CURRENT_TEST="gwmirror: index page contains expected content"
    content=$(cat "$tmpdir/example.com/index.html" 2>/dev/null)
    assert_contains "Example Domain" "$content"

    popd >/dev/null
    rm -rf "$tmpdir"
fi

print_results "gwmirror"
