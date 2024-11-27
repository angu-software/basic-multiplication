# frozen_string_literal: true

require 'open3'
require 'shellwords'

require_relative '../../lib/runners/command_runner'

describe CommandRunner do
  let(:command) { "echo #{cmd_output}" }
  let(:output) { StringIO.new }
  let(:cmd_success) { true }
  let(:cmd_output) { 'Hello from CMD' }
  let(:stdout) { StringIO.new(cmd_output) }
  let(:cmd) { Shellwords.split(command) }
  let(:stdin) { double('stdin').as_null_object }
  let(:wait_thr) { double('wait_thr') }
  let(:status) { double('status', success?: cmd_success) }

  subject { described_class.new(output).run(command) }

  before do
    allow(wait_thr).to receive(:value).and_return(status)
    allow(Open3).to receive(:popen2e).and_yield(stdin,
                                                stdout,
                                                wait_thr)
  end

  describe '.run_and_return_output' do
    subject { described_class.run_and_return_output(command) }

    it 'runs the command' do
      subject
      expect(Open3).to have_received(:popen2e).with(*cmd)
    end

    it 'returns the commands output' do
      expect(subject).to eq(cmd_output) # TODO: multiline
    end

    context 'When the command fails' do
      let(:cmd_output) { 'Something went wrong' }
      let(:cmd_success) { false }

      it 'throws an error with the error output' do
        expect do
          subject
        end.to error_raise(CommandExecError, "Command '#{command}' failed with '#{cmd_output}'")
      end
    end
  end

  context 'When runing a command' do
    it 'it splits the command by parameters to avoid shell injection attacs' do
      # https://knowledge-base.secureflag.com/vulnerabilities/code_injection/os_command_injection_ruby.html
      # https://www.honeybadger.io/blog/capturing-stdout-stderr-from-shell-commands-via-ruby/
      subject

      expect(Open3).to have_received(:popen2e).with(*cmd)
    end

    context 'When the command fails' do
      let(:cmd_success) { false }

      it 'throws an error' do
        expect { subject }.to error_raise(CommandExecError, "Command '#{command}' failed")
      end

      it 'prints the commands error' do
        begin
          subject
        rescue StandardError
          nil
        end
        expect(output.string).to eq("#{cmd_output}\n")
      end
    end

    context 'When the command succeeds' do
      let(:cmd_success) { true }

      it 'it prints the commands output' do
        subject
        expect(output.string).to eq("#{cmd_output}\n")
      end
    end
  end
end
