# frozen_string_literal: true

require_relative 'config'
require_relative 'commands'
require_relative '../lib/runners/command_runner'

module DevelopmentStage
  def self.run
    select_xcode
    build_for_testing
    test_without_building
    tag_rc_build
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def self.select_xcode
    # TODO: check if already set
    puts "Select Xcode: #{XCODE_PATH}"
    run_command("sudo xcode-select -s #{XCODE_PATH}")
  end

  def self.build_for_testing
    puts "Build for testing: #{BUILD_DESTINATION}"
    run_command(Commands::BUILD_FOR_TESTING_COMMAND)
  end

  def self.test_without_building
    puts "Test without building: #{TEST_DESTINATION}"
    run_command(Commands::TEST_WITHOUT_BUILDING_COMMAND)
  end

  def self.tag_rc_build
    build_tag = GitInfo.next_rc_build_tag

    puts "Tagging RC commit: #{build_tag}"
    CommandRunner.run("git tag -a '#{build_tag}' -m '#{build_tag}' #{GitInfo.git_commit_sha(short: true)}")
    CommandRunner.run("git push origin '#{build_tag}'")
  end

  def self.run_command(command)
    CommandRunner.run(command)
  end
end
