#!/usr/bin/env bash
#
# gsh - Tests for ggif
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/ggif"

CURRENT_TEST="ggif: shows error message on wrong number of args (0)"
out=$("$SCRIPT" 2>&1)
assert_contains "2 arguments" "$out"

CURRENT_TEST="ggif: shows error message on wrong number of args (1)"
out2=$("$SCRIPT" "*.png" 2>&1)
assert_contains "2 arguments" "$out2"

CURRENT_TEST="ggif: requires ImageMagick (dependency check)"
if ! command -v identify >/dev/null 2>&1 || ! command -v convert >/dev/null 2>&1; then
    skip "ImageMagick not installed — full GIF creation test skipped"
else
    CURRENT_TEST="ggif: creates animated GIF from PNG images"
    tmpdir=$(mktemp -d)
    # Create minimal 1x1 PNG images using convert
    convert -size 1x1 xc:red  "$tmpdir/frame1.png"  2>/dev/null
    convert -size 1x1 xc:blue "$tmpdir/frame2.png"  2>/dev/null
    (cd "$tmpdir" && "$SCRIPT" "frame*.png" "output.gif" >/dev/null 2>&1)
    assert_file_exists "$tmpdir/output.gif"
    rm -rf "$tmpdir"
fi

print_results "ggif"
