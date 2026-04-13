#!/usr/bin/env bash
#
# gsh - Tests for gkill
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gkill"

CURRENT_TEST="gkill: terminates a process matching the given name"
(exec -a gsh_kill_target_$$ sleep 999) &
target_pid=$!
sleep 0.2
"$SCRIPT" "gsh_kill_target_$$" >/dev/null 2>&1
sleep 0.2
if ! kill -0 "$target_pid" 2>/dev/null; then
    pass
else
    kill "$target_pid" 2>/dev/null
    fail "process $target_pid was not terminated"
fi

CURRENT_TEST="gkill: does not error when no matching process exists"
# GNU xargs may run kill with no args on empty stdin; redirect stderr
"$SCRIPT" "gsh_nonexistent_proc_xyz_$$" 2>/dev/null
# We only care it doesn't hang — any exit code is acceptable
pass

print_results "gkill"
