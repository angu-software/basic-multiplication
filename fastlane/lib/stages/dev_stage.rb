# frozen_string_literal: true

require_relative '../cd_stages'
require_relative '../cd_artifact_paths'

def set_xcode_version
  ENV['DEVELOPER_DIR'] = '/Applications/Xcode_16.app/Contents/Developer'
end

def build_for_testing(stage:, scheme:)
  ENV['DISABLE_CODE_LINT'] = 'true'

  testing_build_paths = CDArtifactPaths.new(stage, 'build_result')

  xcargs = [
    '-quiet',
    '-skipUnavailableActions',
    'CODE_SIGNING_REQUIRED=NO',
    "CODE_SIGN_IDENTITY=''",
    'CODE_SIGNING_ALLOWED=NO'
  ].join(' ')

  run_tests(scheme: scheme,
            build_for_testing: true,
            destination: 'generic/platform=iOS Simulator',
            derived_data_path: testing_build_paths.derived_data_path,
            result_bundle_path: testing_build_paths.result_bundle_path('testing_build_result'),
            output_directory: testing_build_paths.output_directory,
            buildlog_path: testing_build_paths.buildlog_path,
            xcargs: xcargs,
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true,
            clean: true,
            step_name: 'Build for Testing')
end

def test_without_building(stage:, scheme:, test_plan:)
  testing_paths = CDArtifactPaths.new(stage, 'testing_result')

  run_tests(scheme: scheme,
            test_without_building: true,
            testplan: test_plan,
            destination: 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0',
            derived_data_path: testing_paths.derived_data_path,
            result_bundle_path: testing_paths.result_bundle_path('testing_result'),
            output_directory: testing_paths.output_directory,
            buildlog_path: testing_paths.buildlog_path,
            xcargs: '-quiet',
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true,
            step_name: "Testing #{test_plan}")
end
