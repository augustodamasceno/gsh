#!/usr/bin/env bash
#
# gsh - Tests for ikill
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gikill"

CURRENT_TEST="ikill: no args shows error message"
out=$("$SCRIPT" 2>&1)
assert_contains "No argument" "$out"

CURRENT_TEST="ikill: non-existent process name shows no-process message"
out2=$("$SCRIPT" "gsh_nonexistent_proc_xyz_$$" 2>&1)
assert_contains "No process" "$out2"

CURRENT_TEST="ikill: interactively kills selected process"
(exec -a gsh_ikill_target_$$ sleep 999) &
target_pid=$!
sleep 0.2
echo "1" | "$SCRIPT" "gsh_ikill_target_$$" >/dev/null 2>&1
sleep 0.2
if ! kill -0 "$target_pid" 2>/dev/null; then
    pass
else
    kill "$target_pid" 2>/dev/null
    fail "process $target_pid was not terminated"
fi

CURRENT_TEST="ikill: invalid selection number shows error"
(exec -a gsh_ikill_target2_$$ sleep 999) &
target_pid2=$!
sleep 0.2
out3=$(echo "999" | "$SCRIPT" "gsh_ikill_target2_$$" 2>&1)
kill "$target_pid2" 2>/dev/null
assert_contains "no option" "$out3"

print_results "gikill"
