# frozen_string_literal: true

require 'open3'
require 'shellwords'

require_relative '../lib/command_runner'

describe CommandRunner do
  let(:command) { 'echo "Hello World"' }
  let(:output) { StringIO.new }
  let(:cmd_success) { false }
  let(:cmd_output) { 'Hello from CMD' }
  let(:stdout) { StringIO.new(cmd_output) }
  let(:cmd) { Shellwords.split(command) }
  let(:stdin) { double('stdin').as_null_object }
  let(:wait_thr) { double('wait_thr') }
  let(:status) { double('status', success?: cmd_success) }

  subject { described_class.new(output).run(command) }

  before do
    allow(wait_thr).to receive(:value).and_return(status)
    allow(Open3).to receive(:popen2e).with(command).and_yield(stdin,
                                                              stdout,
                                                              wait_thr)
  end

  # inject the command as decomposed array using Shellwords.split

  context 'When runing a command' do
    context 'When the command fails' do
      it 'throws an error' do
        expect { subject }.to raise_error(CommandExecError, "Command execution failed: #{command}")
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
