#!/usr/bin/env bash
#
# gsh - Tests for grsync
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/grsync"

CURRENT_TEST="grsync: requires rsync (dependency check)"
if ! command -v rsync >/dev/null 2>&1; then
    skip "rsync not installed"
elif ! command -v pv >/dev/null 2>&1; then
    CURRENT_TEST="grsync: requires pv (dependency check)"
    skip "pv not installed"
else
    src=$(mktemp -d)
    dst=$(mktemp -d)
    echo "hello" > "$src/file1.txt"
    echo "world" > "$src/file2.txt"
    mkdir -p "$src/subdir"
    echo "nested" > "$src/subdir/file3.txt"

    CURRENT_TEST="grsync: exits successfully"
    "$SCRIPT" "$src/" "$dst/" >/dev/null 2>&1
    assert_exit_ok $?

    CURRENT_TEST="grsync: copies file1.txt to destination"
    assert_file_exists "$dst/file1.txt"

    CURRENT_TEST="grsync: copies file2.txt to destination"
    assert_file_exists "$dst/file2.txt"

    CURRENT_TEST="grsync: copies nested file preserving structure"
    assert_file_exists "$dst/subdir/file3.txt"

    CURRENT_TEST="grsync: synced file has correct content"
    content=$(cat "$dst/file1.txt")
    assert_eq "hello" "$content"

    rm -rf "$src" "$dst"
fi

print_results "grsync"
