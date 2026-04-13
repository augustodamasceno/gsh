#!/usr/bin/env bash
#
# gsh - Tests for gpdf
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gpdf"

CURRENT_TEST="gpdf: invalid option shows error"
out=$("$SCRIPT" -z output.pdf 2>&1)
assert_contains "no option" "$out"

CURRENT_TEST="gpdf: requires pdftk for merge (dependency check)"
if ! command -v pdftk >/dev/null 2>&1; then
    skip "pdftk not installed — PDF merge test skipped"
else
    CURRENT_TEST="gpdf: merges PDFs in current directory"
    tmpdir=$(mktemp -d)
    if command -v convert >/dev/null 2>&1; then
        convert xc:white -page A4 "$tmpdir/doc1.pdf" 2>/dev/null
        convert xc:white -page A4 "$tmpdir/doc2.pdf" 2>/dev/null
        (cd "$tmpdir" && "$SCRIPT" -m merged.pdf >/dev/null 2>&1)
        assert_file_exists "$tmpdir/merged.pdf"
    else
        skip "ImageMagick not installed — cannot create test PDFs"
    fi
    rm -rf "$tmpdir"
fi

CURRENT_TEST="gpdf: requires ImageMagick for PNG-to-PDF conversion (dependency check)"
if ! command -v convert >/dev/null 2>&1; then
    skip "ImageMagick not installed — image conversion test skipped"
else
    CURRENT_TEST="gpdf: converts PNG images to PDF"
    tmpdir=$(mktemp -d)
    convert -size 100x100 xc:white "$tmpdir/img1.png" 2>/dev/null
    convert -size 100x100 xc:white "$tmpdir/img2.png" 2>/dev/null
    (cd "$tmpdir" && "$SCRIPT" -cp output.pdf >/dev/null 2>&1)
    assert_file_exists "$tmpdir/output.pdf"
    rm -rf "$tmpdir"
fi

print_results "gpdf"
