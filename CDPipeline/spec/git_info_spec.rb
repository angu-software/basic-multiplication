# frozen_string_literal: true

require_relative '../Development_Stage/git_info'

require_relative '../lib/runners/command_runner'

describe GitInfo do
  let(:git_commit_sha) { '123456' }
  let(:command_runner) { CommandRunner }
  let(:tag_query_command) { GitInfo::GIT_RC_TAG_QUERY_COMMAND }
  let(:existing_rc_tags) { '' }
  let(:tag_prefix) { GitInfo::GIT_RC_TAG_PREFIX }

  before do
    allow(GitInfo).to receive(:git_commit_sha).and_return(git_commit_sha)
    allow(command_runner).to receive(:run)
    allow(command_runner).to receive(:run).with(tag_query_command).and_return(existing_rc_tags)

    subject
  end

  context 'when taging a new rc build' do
    subject { GitInfo.git_tag_rc_build }

    it 'obtains all rc build tags' do
      expect(command_runner).to have_received(:run).with(tag_query_command)
    end

    it 'obtains the git commit sha' do
      expect(GitInfo).to have_received(:git_commit_sha).with(short: true)
    end

    context 'when there are no rc build tags' do
      it 'tags the commit as initial rc build tag' do
        expect(command_runner).to have_received(:run).with("git tag -a #{tag_prefix}1 #{git_commit_sha}")
      end
    end

    context 'when there are rc build tags' do
      let(:existing_rc_tags) { "#{tag_prefix}1\n#{tag_prefix}2\n" }

      it 'tags the commit with an increment of the latest rc build tag' do
        expect(command_runner).to have_received(:run).with("git tag -a #{tag_prefix}3 #{git_commit_sha}")
      end
    end

    it 'pushes the tag to the remote' do
      expect(command_runner).to have_received(:run).with("git push origin #{tag_prefix}1")
    end
  end
end
