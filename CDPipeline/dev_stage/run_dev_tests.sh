#!/bin/bash
      set -e

      # Task: Execute Dev Tests
      export DEVELOPER_DIR='/Applications/Xcode_16.app/Contents/Developer'

      xcodebuild \
      test \
      -scheme 'Basic Multiplication' \
      -testPlan 'DevelopmentTests' \
      -destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0' \
      -derivedDataPath ".xcpipeline/derived_data" \
      -testProductsPath ".xcpipeline/artifacts/BasicMultiplication.xctestproducts" \
      -resultBundlePath ".xcpipeline/artifacts/BasicMultiplication.xcresult" \
      -skipUnavailableActions \
      CODE_SIGNING_REQUIRED=NO \
      CODE_SIGN_IDENTITY='' \
      CODE_SIGNING_ALLOWED=NO

      unset DEVELOPER_DIR
