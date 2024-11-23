# frozen_string_literal: true

def clean_build_artifacts(stage:)
  build_paths = testing_build_paths(stage: stage)
  clean_path = build_paths.stage_dir

  change_dir = Dir.pwd.end_with?('/fastlane') ? '..' : '.'
  Dir.chdir(change_dir) do
    if File.exist?(clean_path)
      puts "Cleaning build artifacts in #{clean_path}/ ..."
      FileUtils.rm_rf(clean_path)
    end
  end
end
