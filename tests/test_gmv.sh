#!/usr/bin/env bash
#
# gsh - Tests for gmv
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gmv"

# gmv uses "find $(pwd) | grep $(whoami)" so the tmpdir path must contain the username.
tmpdir=$(mktemp -d "/tmp/$(whoami)_gsh_XXXXXX")
mkdir -p "$tmpdir/photos"
touch "$tmpdir/photos/screenshot:2024-01-01.png"
touch "$tmpdir/photos/screenshot:2024-01-02.png"

CURRENT_TEST="gmv: does not rename files when user answers n"
(cd "$tmpdir" && echo "n" | "$SCRIPT" photos screenshot ":" "_" 2>/dev/null)
count=$(ls "$tmpdir/photos/" | grep -c ":" || echo 0)
assert_eq "2" "$count"

CURRENT_TEST="gmv: creates myrenamefile listing matched files"
(cd "$tmpdir" && echo "n" | "$SCRIPT" photos screenshot ":" "_" 2>/dev/null)
assert_file_exists "$tmpdir/myrenamefile"

CURRENT_TEST="gmv: renames files when user answers y"
if ! command -v rename >/dev/null 2>&1; then
    skip "rename utility not available"
else
    (cd "$tmpdir" && echo "y" | "$SCRIPT" photos screenshot ":" "_" >/dev/null 2>&1)
    renamed=$(ls "$tmpdir/photos/" | grep -c "_" || echo 0)
    if [[ $renamed -ge 2 ]]; then pass; else fail "expected renamed files, got $renamed"; fi
fi

rm -rf "$tmpdir"
print_results "gmv"
