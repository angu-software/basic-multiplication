# frozen_string_literal: true

require_relative 'config'
require_relative 'commands'
require_relative '../lib/runners/command_runner'

module DevelopmentStage
  def self.run
    select_xcode
    build_for_testing
    test_without_building
    archive
    tag_rc_build
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def self.select_xcode
    # TODO: check if already set
    path = Config::XCODE_PATH
    puts "Select Xcode: #{path}"
    run_command(Commands.select_xcode(path:))
  end

  def self.build_for_testing
    puts "Build for testing: #{Config::TEST_BUILD_DESTINATION}"
    run_command(Commands.build_for_testing)
  end

  def self.test_without_building
    puts "Test without building: #{Config::TEST_DESTINATION}"
    run_command(Commands.test_without_building)
  end

  def self.archive
    puts "Archiving: #{GitInfo.next_rc_build_tag(prefix: Config::RC_TAG_PREFIX)}"
    run_command(Commands.archive)
  end

  def self.tag_rc_build
    tag = GitInfo.next_rc_build_tag(prefix: Config::RC_TAG_PREFIX)

    puts "Tagging RC commit: #{tag}"
    CommandRunner.run(GitInfo::Commands.tag_rc_build(tag:, commit_sha: GitInfo.git_commit_sha(short: true)))
    CommandRunner.run(GitInfo::Commands.push_tag(tag:))
  end

  def self.run_command(command)
    CommandRunner.run(command)
  end
end
