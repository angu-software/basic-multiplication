#!/bin/bash
set -e

source $1

# TODO: get the current build tag (build number)
RC_TAG_PREFIX="Staged-RC-"
UNIX_TIMESTAMP=$(date +%s)
GIT_SHA=$(git rev-parse --short HEAD)
ARTIFACT_ARCHIVE="$BUILD_DIR/${RC_TAG_PREFIX}${GIT_SHA}-${UNIX_TIMESTAMP}.zip"

zip -qr "$ARTIFACT_ARCHIVE" "$BUILD_ARTIFACTS_DIR"

echo "$ARTIFACT_ARCHIVE"