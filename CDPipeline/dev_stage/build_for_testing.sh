#!/bin/bash
set -e

source $1

# TODO the -skipPackagePluginValidation and -skipMacroValidation settings remove once we use swiftlint cli instead of plugin

xcodebuild \
build-for-testing \
-scheme "$XCODEBUILD_SCHEME" \
-destination "$XCODEBUILD_BUILD_DESTINATION" \
-derivedDataPath "$XCODEBUILD_DERIVED_DATA_PATH" \
-testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
-resultBundlePath "$XCODEBUILD_BUILD_RESULT_BUNDLE_PATH" \
-skipPackagePluginValidation \
-skipMacroValidation \
-quiet \
-skipUnavailableActions \
CODE_SIGNING_REQUIRED=NO \
CODE_SIGN_IDENTITY='' \
CODE_SIGNING_ALLOWED=NO