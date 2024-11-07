# frozen_string_literal: true

require_relative '../cd_artifact_paths'

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
            cloned_source_packages_path: testing_paths.cloned_source_packages_path,
            disable_package_automatic_updates: true,
            skip_package_dependencies_resolution: true,
            xcargs: '-quiet',
            skip_detect_devices: true,
            output_style: 'raw',
            skip_build: true,
            step_name: "Testing #{test_plan}")
end
