#!/bin/bash
      set -e

      export BUILD_DIR='.xcpipeline'
      export BUILD_ARTIFACTS_DIR="$BUILD_DIR/artifacts"

      # setting xcode version
      export DEVELOPER_DIR='/Applications/Xcode_16.app/Contents/Developer'

      export XCODEBUILD_SCHEME='Basic Multiplication'
      export XCODEBUILD_TEST_PLAN='DevelopmentTests'
      export XCODEBUILD_DESTINATION='platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0'
      export XCODEBUILD_DERIVED_DATA_PATH="$BUILD_DIR/derived_data"
      export XCODEBUILD_TEST_PRODUCTS_PATH="$BUILD_ARTIFACTS_DIR/$XCODEBUILD_TEST_PLAN.xctestproducts"
      export XCODEBUILD_RESULT_BUNDLE_PATH="$BUILD_ARTIFACTS_DIR/$XCODEBUILD_TEST_PLAN.xcresult"

      xcodebuild \
      test \
      -scheme "$XCODEBUILD_SCHEME" \
      -testPlan "$XCODEBUILD_TEST_PLAN" \
      -destination "$XCODEBUILD_DESTINATION" \
      -derivedDataPath "$XCODEBUILD_DERIVED_DATA_PATH" \
      -testProductsPath "$XCODEBUILD_TEST_PRODUCTS_PATH" \
      -resultBundlePath "$XCODEBUILD_RESULT_BUNDLE_PATH" \
      -skipUnavailableActions \
      CODE_SIGNING_REQUIRED=NO \
      CODE_SIGN_IDENTITY='' \
      CODE_SIGNING_ALLOWED=NO
