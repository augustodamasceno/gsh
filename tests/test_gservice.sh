#!/usr/bin/env bash
#
# gsh - Tests for gservice
TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$TESTS_DIR/framework.sh"
SCRIPT="$TESTS_DIR/../scripts/gservice"

tmpdir=$(mktemp -d)

CURRENT_TEST="gservice: creates a .service unit file"
(cd "$tmpdir" && timeout 3 "$SCRIPT" mysvc </dev/null 2>/dev/null; true)
assert_file_exists "$tmpdir/mysvc.service"

CURRENT_TEST="gservice: unit file contains correct ExecStart path"
content=$(cat "$tmpdir/mysvc.service" 2>/dev/null)
assert_contains "ExecStart=/usr/sbin/mysvc" "$content"

CURRENT_TEST="gservice: unit file contains [Unit] section"
assert_contains "[Unit]" "$content"

CURRENT_TEST="gservice: unit file contains [Service] section"
assert_contains "[Service]" "$content"

CURRENT_TEST="gservice: unit file contains [Install] section"
assert_contains "[Install]" "$content"

CURRENT_TEST="gservice: unit file contains WantedBy=multi-user.target"
assert_contains "WantedBy=multi-user.target" "$content"

rm -rf "$tmpdir"
print_results "gservice"
