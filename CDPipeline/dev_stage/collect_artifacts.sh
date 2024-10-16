#!/bin/bash
set -e

source $1

zip -qr "$ARTIFACT_ARCHIVE" "$BUILD_ARTIFACTS_DIR"