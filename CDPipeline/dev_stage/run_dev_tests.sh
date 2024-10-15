#!/bin/bash
set -e

source ./CDPipeline/dev_stage/.env

xcodebuild \
build-for-testing \
-scheme "$XCODEBUILD_SCHEME" \
-destination "$XCODEBUILD_DESTINATION" \
-derivedDataPath "$XCODEBUILD_DERIVED_DATA_PATH" \
-testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
-resultBundlePath "$XCODEBUILD_BUILD_RESULT_BUNDLE_PATH" \
-skipUnavailableActions \
CODE_SIGNING_REQUIRED=NO \
CODE_SIGN_IDENTITY='' \
CODE_SIGNING_ALLOWED=NO

xcodebuild \
test-without-building \
-testPlan "$XCODEBUILD_TEST_PLAN" \
-destination "$XCODEBUILD_DESTINATION" \
-testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
-resultBundlePath "$XCODEBUILD_TEST_RESULT_BUNDLE_PATH"
