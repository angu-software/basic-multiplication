# frozen_string_literal: true

require_relative 'build_for_testing'

def capture_store_screenshots(devices:,
                              languages:,
                              scheme:,
                              test_plan:,
                              output_directory:,
                              clear_previous_screenshots:)
  stage = 'store_snapshot'

  build_for_testing(stage: stage,
                    scheme: scheme)

  testing_build_paths = CDArtifactPaths.new(stage, 'store_snapshot_result')

  capture_screenshots(devices: devices,
                      languages: languages,
                      scheme: scheme,
                      testplan: test_plan,
                      test_without_building: true,
                      clear_previous_screenshots: clear_previous_screenshots,
                      override_status_bar: true,
                      override_status_bar_arguments: status_bar_settings,
                      disable_package_automatic_updates: true,
                      skip_package_dependencies_resolution: true,
                      xcargs: '-quiet',
                      output_directory: output_directory,
                      derived_data_path: testing_build_paths.derived_data_path,
                      cloned_source_packages_path: testing_build_paths.cloned_source_packages_path,
                      buildlog_path: testing_build_paths.buildlog_path,
                      result_bundle: true,
                      namespace_log_files: true,
                      headless: true,
                      concurrent_simulators: false,
                      stop_after_first_error: true,
                      skip_open_summary: true)
end

def status_bar_settings
  time = Time.new(2007, 1, 9, 9, 41, 0)
  iso_time = time.iso8601(1)
  [
    '--dataNetwork wifi',
    '--wifiMode active',
    '--wifiBars 3',
    '--cellularMode active',
    "--operatorName ''",
    '--cellularBars 4',
    '--batteryState charged',
    '--batteryLevel 100',
    "--time #{iso_time}"
  ].join(' ')
end
