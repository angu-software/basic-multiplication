#!/bin/bash
set -e

source $1

XCODEBUILD_TEST_PLAN="AcceptanceTests"

xcodebuild \
test-without-building \
-testPlan "$XCODEBUILD_TEST_PLAN" \
-destination "$XCODEBUILD_TEST_DESTINATION" \
-testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
-resultBundlePath "$XCODEBUILD_TEST_RESULT_BUNDLE_PATH"