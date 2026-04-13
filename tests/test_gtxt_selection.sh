#!/usr/bin/env bash
#
# gsh - Tests for gtxt-selection
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gtxt-selection"
SAMPLE="$TESTS_DIR/resources/sample.txt"

CURRENT_TEST="gtxt-selection: wrong number of args shows usage"
out=$("$SCRIPT" 2>&1)
assert_contains "USAGE" "$out"

CURRENT_TEST="gtxt-selection: non-existent file shows usage"
out2=$("$SCRIPT" START END /nonexistent_file.txt 2>&1)
assert_contains "USAGE" "$out2"

CURRENT_TEST="gtxt-selection: extracts lines between markers"
out3=$("$SCRIPT" SECTION_START SECTION_END "$SAMPLE" 2>&1)
assert_exit_ok $?
assert_contains "SECTION_START" "$out3"

CURRENT_TEST="gtxt-selection: extracted output contains first inside line"
assert_contains "First line inside the section" "$out3"

CURRENT_TEST="gtxt-selection: extracted output does not contain lines after end marker"
if [[ "$out3" != *"Line after the section"* ]]; then pass; else fail "output contains text after end marker"; fi

CURRENT_TEST="gtxt-selection: extracted output does not contain lines before start marker"
if [[ "$out3" != *"Line before the section"* ]]; then pass; else fail "output contains text before start marker"; fi

print_results "gtxt-selection"
