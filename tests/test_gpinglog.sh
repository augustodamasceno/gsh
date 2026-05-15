#!/usr/bin/env bash
#
# gsh - Tests for gpinglog
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gpinglog"

# Ensure the script is executable
chmod +x "$SCRIPT"

# Cleanup any csv files created during tests
CSVFILES=()
cleanup_csvs() {
    for f in "${CSVFILES[@]}"; do
        rm -f "$f"
    done
}
trap cleanup_csvs EXIT

CURRENT_TEST="gpinglog: no args shows usage and exits with error"
out=$("$SCRIPT" 2>&1)
rc=$?
assert_exit_fail $rc
assert_contains "Usage" "$out"
assert_contains "DESTINATION" "$out"

CURRENT_TEST="gpinglog: creates csv file on startup"
# Run in background, let it write the header line, then kill it
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
csvfile=$(ls gpinglog-*.csv 2>/dev/null | head -1)
if [[ -n "$csvfile" && -f "$csvfile" ]]; then pass; else fail "csv file not created in $tmpdir"; fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: csv file contains header row"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
csvfile=$(ls gpinglog-*.csv 2>/dev/null | head -1)
if [[ -n "$csvfile" ]]; then
    assert_contains "time,ip,size,rtt" "$(head -1 "$csvfile")"
else
    fail "csv file not found"
fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: graceful stop message printed to stdout on INT"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 > stdout.txt 2>&1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
if grep -q "stopped" stdout.txt 2>/dev/null; then pass; else fail "stop message not found in stdout"; fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: csv data lines contain time,ip,size,rtt columns"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 &
PID=$!
sleep 2
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
csvfile=$(ls gpinglog-*.csv 2>/dev/null | head -1)
if [[ -n "$csvfile" ]]; then
    dataline=$(grep -v 'TIMEOUT\|^time' "$csvfile" | head -1)
    cols=$(echo "$dataline" | awk -F',' '{print NF}')
    if [[ "$cols" -eq 4 ]]; then pass; else fail "expected 4 columns (time,ip,size,rtt), got: $dataline"; fi
else
    fail "csv file not found"
fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: custom packet size appears in csv data"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 128 &
PID=$!
sleep 2
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
csvfile=$(ls gpinglog-*.csv 2>/dev/null | head -1)
if [[ -n "$csvfile" ]]; then
    assert_contains "128" "$(cat "$csvfile")"
else
    fail "csv file not found"
fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: csv filename matches expected pattern gpinglog-TIMESTAMP.csv"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
csvfile=$(ls gpinglog-*.csv 2>/dev/null | head -1)
if echo "$csvfile" | grep -qE '^gpinglog-[0-9]{8}-[0-9]{6}\.csv$'; then pass; else fail "unexpected filename: $csvfile"; fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: custom interval appears in stdout header"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 56 5 > stdout.txt 2>&1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
if grep -q "5s" stdout.txt 2>/dev/null; then pass; else fail "interval not found in stdout"; fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: default interval appears in stdout header"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 > stdout.txt 2>&1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
if grep -q "interval: 2s" stdout.txt 2>/dev/null; then pass; else fail "default interval not found in stdout"; fi
popd > /dev/null
rm -rf "$tmpdir"

CURRENT_TEST="gpinglog: prints gnuplot snippet on exit"
tmpdir=$(mktemp -d)
pushd "$tmpdir" > /dev/null
"$SCRIPT" 127.0.0.1 > stdout.txt 2>&1 &
PID=$!
sleep 1
kill -INT $PID 2>/dev/null
wait $PID 2>/dev/null
if grep -q "set terminal" stdout.txt 2>/dev/null; then pass; else fail "gnuplot snippet not found in output"; fi
popd > /dev/null
rm -rf "$tmpdir"

print_results "gpinglog"
