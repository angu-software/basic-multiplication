#!/bin/bash
set -e

source ./CDPipeline/dev_stage/.env

zip -qr "$ARTIFACT_ARCHIVE" "$BUILD_ARTIFACTS_DIR"