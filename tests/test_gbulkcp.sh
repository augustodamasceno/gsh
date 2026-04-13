#!/usr/bin/env bash
#
# gsh - Tests for bulkcp
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gbulkcp"
RESOURCES="$TESTS_DIR/resources"

CURRENT_TEST="bulkcp: exits with error on wrong number of args"
"$SCRIPT" 2>/dev/null
assert_exit_fail $?

CURRENT_TEST="bulkcp: stderr message on wrong number of args"
out=$("$SCRIPT" 2>&1)
assert_contains "Wrong number" "$out"

CURRENT_TEST="bulkcp: exits with error when list file does not exist"
"$SCRIPT" /nonexistent_list.txt /src /dst 2>/dev/null
assert_exit_fail $?

CURRENT_TEST="bulkcp: copies listed files to destination"
tmpdir=$(mktemp -d)
"$SCRIPT" "$RESOURCES/file_list.txt" "$RESOURCES/source" "$tmpdir" >/dev/null 2>&1
assert_exit_ok $?

CURRENT_TEST="bulkcp: file1.txt exists in destination"
assert_file_exists "$tmpdir/file1.txt"

CURRENT_TEST="bulkcp: subdir/file2.txt is copied preserving directory structure"
assert_file_exists "$tmpdir/subdir/file2.txt"

CURRENT_TEST="bulkcp: copied file has correct content"
content=$(cat "$tmpdir/file1.txt")
assert_contains "source file 1" "$content"

rm -rf "$tmpdir"
print_results "gbulkcp"
