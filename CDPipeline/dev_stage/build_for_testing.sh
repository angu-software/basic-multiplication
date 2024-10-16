#!/bin/bash
set -e

source $1

xcodebuild \
build-for-testing \
-scheme "$XCODEBUILD_SCHEME" \
-destination "$XCODEBUILD_BUILD_DESTINATION" \
-derivedDataPath "$XCODEBUILD_DERIVED_DATA_PATH" \
-testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
-resultBundlePath "$XCODEBUILD_BUILD_RESULT_BUNDLE_PATH" \
-skipUnavailableActions \
CODE_SIGNING_REQUIRED=NO \
CODE_SIGN_IDENTITY='' \
CODE_SIGNING_ALLOWED=NO