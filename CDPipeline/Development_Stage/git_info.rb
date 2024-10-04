# frozen_string_literal: true

# TDOO: remove as them are duplicate
GIT_COMMIT_SHA = `git rev-parse HEAD`.strip
GIT_COMMIT_SHA_SHORT = `git rev-parse --short HEAD`.strip

module GitInfo
  GIT_RC_TAG_PREFIX = 'Staged-RC-' # TODO: move to config
  GIT_RC_TAG_QUERY_COMMAND = "git tag --list '#{GIT_RC_TAG_PREFIX}*'".freeze
  GIT_COMMIT_SHA_COMMAND = 'git rev-parse HEAD'
  GIT_COMMIT_SHA_SHORT_COMMAND = 'git rev-parse --short HEAD'

  def self.git_commit_sha(short: false)
    short ? GIT_COMMIT_SHA_SHORT : GIT_COMMIT_SHA
  end

  def self.git_tag_rc_build # TODO: remove. Its duplicate
    build_tag = next_rc_build_tag
    CommandRunner.run("git tag -a #{build_tag} #{git_commit_sha(short: true)}")
    CommandRunner.run("git push origin #{build_tag}")
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
