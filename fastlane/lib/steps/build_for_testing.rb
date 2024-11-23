# frozen_string_literal: true

require_relative '../cd_artifact_paths'

def testing_build_paths(stage:)
  CDArtifactPaths.new(stage, 'build_result')
end

def build_for_testing(stage:, scheme:)
  ENV['DISABLE_CODE_LINT'] = 'true'

  testing_build_paths = testing_build_paths(stage: stage)

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
            cloned_source_packages_path: testing_build_paths.cloned_source_packages_path,
            disable_package_automatic_updates: true,
            skip_package_dependencies_resolution: ENV['HAS_SPM_PACKAGES_CACHE_HIT'],
            xcargs: xcargs,
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true,
            clean: true,
            step_name: 'Build for Testing')
end
