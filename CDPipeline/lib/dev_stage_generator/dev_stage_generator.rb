# frozen_string_literal: true

class DevStageGenerator
  def self.generate
    <<~GHA_YML_CONFIG
      name: 'Development Stage'

      on:
        push:
          branches: [ "main" ]
        pull_request:
          branches: [ "main" ]

      jobs:
        development-tests:
          name: Development Tests (Simple)
          runs-on: macos-latest
          env:
            DEVELOPER_DIR: /Applications/Xcode_16.app/Contents/Developer
          steps:
          - uses: actions/checkout@v3
          - name: Run development tests
            run: >
              xcodebuild
              test
              -scheme 'Basic Multiplication'
              -testPlan 'DevelopmentTests'
              -destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0'
              -derivedDataPath '.xcpipeline/${{ github.sha }}/derived_data'
              -testProductsPath '.xcpipeline/${{ github.sha }}/artifacts/BasicMultiplication.xctestproducts'
              -resultBundlePath '.xcpipeline/${{ github.sha }}/artifacts/BasicMultiplication.xcresult'
              -skipUnavailableActions
              CODE_SIGNING_REQUIRED=NO
              CODE_SIGN_IDENTITY=''
              CODE_SIGNING_ALLOWED=NO
    GHA_YML_CONFIG
  end

  def self.generate_bash
    <<~LOCAL_SCRIPT
      #!/bin/bash
      set -e

      # Task: Execute Dev Tests
      export DEVELOPER_DIR='/Applications/Xcode_16.app/Contents/Developer'
      GIT_SHA=`git rev-parse --short HEAD`

      xcodebuild \
      test \
      -scheme 'Basic Multiplication' \
      -testPlan 'DevelopmentTests' \
      -destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0' \
      -derivedDataPath ".xcpipeline/$GIT_SHA/derived_data" \
      -testProductsPath ".xcpipeline/$GIT_SHA/artifacts/BasicMultiplication.xctestproducts" \
      -resultBundlePath ".xcpipeline/$GIT_SHA/artifacts/BasicMultiplication.xcresult" \
      -skipUnavailableActions \
      CODE_SIGNING_REQUIRED=NO \
      CODE_SIGN_IDENTITY='' \
      CODE_SIGNING_ALLOWED=NO

      # Task: Create Staged RC
      git fetch --tags
      ruby ./CDPipeline/Development_Stage/run.rb --tag_rc

      unset DEVELOPER_DIR
    LOCAL_SCRIPT
  end
end
