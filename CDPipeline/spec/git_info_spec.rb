# frozen_string_literal: true

require_relative '../Development_Stage/development_stage'
require_relative '../lib/runners/command_runner'

describe GitInfo do
  let(:git_commit_sha) { '123456' }
  let(:command_runner) { CommandRunner }
  let(:tag_query_command) { GitInfo::Commands.rc_tag_query(prefix: tag_prefix) }
  let(:existing_rc_tags) { '' }
  let(:tag_prefix) { 'Staged-RC-' }

  let(:git_tags) { %w[Staged-RC-1 Staged-RC-2].join("\n") }

  before do
    allow(GitInfo).to receive(:git_commit_sha).and_return(git_commit_sha)

    allow(command_runner).to receive(:run_and_return_output).with(tag_query_command).and_return(git_tags)
    allow(command_runner).to receive(:run).with(tag_query_command).and_return(existing_rc_tags)

    subject
  end

  describe '.rc_tags' do
    subject { GitInfo.rc_tags(prefix: tag_prefix) }
    it 'fetches all rc tags' do
      expect(subject).to eq(git_tags.split("\n"))

      expect(command_runner).to have_received(:run_and_return_output).with("git tag --list '#{tag_prefix}*'")
    end
  end

  describe '.next_rc_build_tag' do
    subject { GitInfo.next_rc_build_tag(prefix: tag_prefix) }

    it 'returns the next rc build tag' do
      expect(subject).to eq("#{tag_prefix}3")
    end

    context 'when there are no existing rc tags' do
      let(:git_tags) { '' }

      it 'returns the first rc build tag' do
        expect(subject).to eq("#{tag_prefix}1")
      end
    end
  end
end
