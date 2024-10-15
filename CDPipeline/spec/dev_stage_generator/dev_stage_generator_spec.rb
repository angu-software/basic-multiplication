# frozen_string_literal: true

require_relative '../../lib/dev_stage_generator/dev_stage_generator'

describe DevStageGenerator do
  subject(:dev_stage_generator) { DevStageGenerator.generate }
  it 'generates a dev stage github action ymal content' do
    expect(subject).to eq(<<~CONFIG
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
    CONFIG
                         )
  end
end
