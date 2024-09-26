# frozen_string_literal: true

require_relative '../lib/config/var_resolver'

describe 'VarResolver' do
  let(:env_vars) { [{ "HELLO" => "hello world"}] }
  let(:string) { 'echo $HELLO' }
  subject { VarResolver.resolve(string, env_vars) }
  
  context 'When there are no environment variables' do
    # TODO also check for empty array
    let(:env_vars) { nil }

    it 'it returns the original string' do
      expect(subject).to eq(string)
    end
  end

  context 'When there are variables to resolve' do
    let(:string) { 'echo hello' }

    it 'it returns the original string' do
      expect(subject).to eq(string)
    end
  end

  context 'When there are variables to resolve' do
    let(:env_vars) { [{ "HELLO" => "hello world"}] }

    context 'when the variable is not in the string' do
      let(:string) { 'echo $WORLD' }
      it 'it returns the original string' do
        expect(subject).to eq(string)
      end
    end

    context 'When the variable is in the string' do
      it 'it returns the resolved string' do
        expect(subject).to eq('echo hello world')
      end
    end

    context 'When variables value contains another variable' do
      let(:env_vars) { [{ "WORLD" => "world"},
                        { "HELLO" => "hello $WORLD" }] }
      it 'it resolves the variable recursively in the string' do
        expect(subject).to eq('echo hello world')
      end
    end

  end
end

# TODO:
# inject merged hash map instead of array of hashes
# var value contains itself
# same vars with different values
# yaml env vs system ENV. inject both. ENV is has default value