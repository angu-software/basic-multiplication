# frozen_string_literal: true

require_relative '../lib/runners/command_runner'

module GitInfo
  module Commands
    def self.tag_rc_build(tag:, commit_sha:)
      "git tag -a '#{tag}' -m '#{tag}' #{commit_sha}"
    end

    def self.push_tag(tag:)
      "git push origin '#{tag}'"
    end
  end

  GIT_RC_TAG_PREFIX = 'Staged-RC-' # TODO: move to config
  GIT_RC_TAG_QUERY_COMMAND = "git tag --list '#{GIT_RC_TAG_PREFIX}*'".freeze
  GIT_COMMIT_SHA_COMMAND = 'git rev-parse HEAD'
  GIT_COMMIT_SHA_SHORT_COMMAND = 'git rev-parse --short HEAD'

  def self.git_commit_sha(short: false)
    command = short ? GIT_COMMIT_SHA_SHORT_COMMAND : GIT_COMMIT_SHA_COMMAND
    CommandRunner.run_and_return_output(command)
  end

  def self.next_rc_build_tag
    make_rc_build_tag(build_number: next_rc_build_number)
  end

  def self.rc_tags
    output = CommandRunner.run_and_return_output(GIT_RC_TAG_QUERY_COMMAND)
    output.split("\n")
  end

  private_class_method def self.next_rc_build_number
    latest_build_number + 1
  end

  private_class_method def self.latest_build_number
    build_numbers_from_tags(rc_tags).max || 0
  end

  private_class_method def self.build_numbers_from_tags(tags)
    tags.map { |tag| tag.gsub(GIT_RC_TAG_PREFIX, '').to_i }
  end

  private_class_method def self.make_rc_build_tag(build_number:)
    "#{GIT_RC_TAG_PREFIX}#{build_number}"
  end
end
