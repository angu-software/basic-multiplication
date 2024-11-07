# frozen_string_literal: true

require_relative '../cd_stages'
require_relative '../cd_artifact_paths'

def dev_stage_paths(results_dir_name)
  CDArtifactPaths.new(CD_STAGES[:DEV], results_dir_name)
end

def testing_build_paths
  dev_stage_paths('build_result')
end

def testing_paths
  dev_stage_paths('test_result')
end

def set_xcode_version
  ENV['DEVELOPER_DIR'] = '/Applications/Xcode_16.app/Contents/Developer'
end

def build_for_testing(scheme:)
  ENV['DISABLE_CODE_LINT'] = 'true'

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
            result_bundle_path: testing_build_paths.result_bundle_path('testing_build'),
            output_directory: testing_build_paths.output_directory,
            buildlog_path: testing_build_paths.buildlog_path,
            xcargs: xcargs,
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true,
            clean: true)
end

def test_without_building(scheme:, test_plan:)
  run_tests(scheme: scheme,
            test_without_building: true,
            testplan: test_plan,
            destination: 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.0',
            derived_data_path: testing_paths.derived_data_path,
            result_bundle_path: testing_paths.result_bundle_path('dev_tests'),
            output_directory: testing_paths.output_directory,
            buildlog_path: testing_paths.buildlog_path,
            xcargs: '-quiet',
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true)
end