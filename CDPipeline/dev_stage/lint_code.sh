#!/bin/bash
set -e

LINT_REPORT=$1
LINT_REPORT=${LINT_REPORT:-'emoji'}

# Store benchmarking results in a file --benchmark
swiftlint lint \
'Sources' \
'Tests' \
--progress \
--reporter $LINT_REPORT