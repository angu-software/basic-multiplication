#!/bin/zsh
set -e

source $1

LINT_REPORT=$2
LINT_REPORT=${LINT_REPORT:-'emoji'}

# Store benchmarking results in a file --benchmark
$SWIFT_LINT_PATH lint \
'Sources' \
'Tests' \
--progress \
--reporter $LINT_REPORT