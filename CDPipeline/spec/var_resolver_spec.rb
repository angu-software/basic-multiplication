# frozen_string_literal: true

require_relative '../lib/config/var_resolver'

RSpec.shared_examples 'return original' do
  it 'it returns the original string' do
    expect(subject).to eq(string)
  end
end

describe VarResolver do
  let(:yaml_env) { { 'HELLO' => 'hello world' } }
  let(:string) { 'echo $HELLO' }
  subject { described_class.new(yaml_env).resolve(string) }

  describe 'When resolving known variable values in a string' do
    context 'When no variable parameter is given' do
      let(:yaml_env) { nil }

      include_examples 'return original'
    end

    context 'When variable parameter is empty' do
      let(:yaml_env) { {} }

      include_examples 'return original'
    end

    context 'When string contains no variable' do
      let(:string) { 'echo hello' }

      include_examples 'return original'
    end

    context 'When string contains a variable' do
      context 'when the variable is not in the string' do
        let(:string) { 'echo $WORLD' }

        include_examples 'return original'
      end

      context 'When the variable is in the string' do
        it 'it returns the resolved string' do
          expect(subject).to eq('echo hello world')
        end
      end

      context 'When variables value contains another variable' do
        let(:yaml_env) do
          {
            'WORLD' => 'world',
            'HELLO' => 'hello $WORLD$STOP',
            'STOP' => '!'
          }
        end
        it 'it resolves the variable recursively in the string' do
          expect(subject).to eq('echo hello world!')
        end
      end
    end
  end
end

# TODO:
# var value contains itself -> original string
# same vars with different values -> bottom value
# yaml env vs system ENV. inject both. ENV is has default value -> yaml value
