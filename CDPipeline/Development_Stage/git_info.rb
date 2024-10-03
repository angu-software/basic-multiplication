# frozen_string_literal: true

GIT_COMMIT_SHA = `git rev-parse HEAD`.strip
GIT_COMMIT_SHA_SHORT = `git rev-parse --short HEAD`.strip

module GitInfo
  GIT_RC_TAG_PREFIX = 'Staged-RC-'
  GIT_RC_TAG_QUERY_COMMAND = "git tag --list '#{GIT_RC_TAG_PREFIX}*'".freeze

  def self.git_commit_sha(short: false)
    short ? GIT_COMMIT_SHA_SHORT : GIT_COMMIT_SHA
  end

  def self.git_tag_rc_build
    build_tag = next_rc_build_tag
    CommandRunner.run("git tag -a #{build_tag} #{git_commit_sha(short: true)}")
    CommandRunner.run("git push origin #{build_tag}")
  end

  def self.next_rc_build_tag
    make_rc_build_tag(build_number: next_rc_build_number)
  end

  def self.next_rc_build_number
    latest_build_number + 1
  end

  def self.latest_build_number
    build_numbers_from_tags(rc_tags).max || 0
  end

  def self.build_numbers_from_tags(tags)
    tags.map { |tag| tag.gsub(GIT_RC_TAG_PREFIX, '').to_i }
  end

  def self.rc_tags
    CommandRunner.run(GIT_RC_TAG_QUERY_COMMAND).split("\n")
  end

  def self.make_rc_build_tag(build_number:)
    "#{GIT_RC_TAG_PREFIX}#{build_number}"
  end
end
