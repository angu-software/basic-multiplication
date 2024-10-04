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

    def self.rc_tag_query(prefix:)
      "git tag --list '#{prefix}*'"
    end
  end

  GIT_COMMIT_SHA_COMMAND = 'git rev-parse HEAD'
  GIT_COMMIT_SHA_SHORT_COMMAND = 'git rev-parse --short HEAD'

  def self.git_commit_sha(short: false)
    command = short ? GIT_COMMIT_SHA_SHORT_COMMAND : GIT_COMMIT_SHA_COMMAND
    CommandRunner.run_and_return_output(command)
  end

  def self.next_rc_build_tag(prefix:)
    make_rc_build_tag(prefix:, build_number: next_rc_build_number(tag_prefix: prefix))
  end

  def self.rc_tags(prefix:)
    output = CommandRunner.run_and_return_output(Commands.rc_tag_query(prefix:))
    output.split("\n")
  end

  private_class_method def self.next_rc_build_number(tag_prefix:)
    latest_build_number(tag_prefix:) + 1
  end

  private_class_method def self.latest_build_number(tag_prefix:)
    build_numbers_from_tags(rc_tags(prefix: tag_prefix), prefix: tag_prefix).max || 0
  end

  private_class_method def self.build_numbers_from_tags(tags, prefix:)
    tags.map { |tag| tag.gsub(prefix, '').to_i }
  end

  private_class_method def self.make_rc_build_tag(build_number:, prefix:)
    "#{prefix}#{build_number}"
  end
end
