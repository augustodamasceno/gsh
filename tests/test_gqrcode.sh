#!/usr/bin/env bash
#
# gsh - Tests for qrcode
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gqrcode"
SAMPLE="$TESTS_DIR/resources/sample.txt"

CURRENT_TEST="qrcode: requires qrencode (dependency check)"
if ! command -v qrencode >/dev/null 2>&1; then
    skip "qrencode not installed — full test skipped"
else
    CURRENT_TEST="qrcode: generates a PNG output file"
    tmpdir=$(mktemp -d)
    out_img="$tmpdir/test_qr.png"
    "$SCRIPT" "$SAMPLE" "$out_img" >/dev/null 2>&1
    assert_exit_ok $?
    assert_file_exists "$out_img"

    CURRENT_TEST="qrcode: output file is non-empty"
    size=$(stat -c%s "$out_img" 2>/dev/null)
    if [[ ${size:-0} -gt 0 ]]; then pass; else fail "output PNG is empty"; fi

    CURRENT_TEST="qrcode: output file is a valid PNG (magic bytes)"
    magic=$(xxd -l 4 "$out_img" 2>/dev/null | awk '{print $2$3}')
    if [[ "$magic" == "89504e47" ]]; then pass; else
        if file "$out_img" 2>/dev/null | grep -q "PNG"; then pass; else fail "output is not a valid PNG"; fi
    fi

    rm -rf "$tmpdir"
fi

print_results "gqrcode"
