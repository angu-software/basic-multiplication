# frozen_string_literal: true

require_relative '../lib/config/stage_env'

shared_examples 'empty hash' do
  it { is_expected.to be_empty }
end

shared_examples 'same hash' do |hash|
  it { is_expected.to eq(hash) }
end

describe StageEnv do
  let(:yaml_env) { { 'HELLO' => 'hello' } }
  let(:process_env) { { 'WORLD' => 'world' } }
  subject { described_class.merge_env(yaml_env, process_env) }

  context 'When no parameter is given' do
    let(:yaml_env) { nil }
    let(:process_env) { nil }

    it_behaves_like 'empty hash'
  end

  context 'When empty parameter is given' do
    let(:yaml_env) { {} }
    let(:process_env) { {} }

    it_behaves_like 'empty hash'
  end

  context 'When yaml_env is given' do
    let(:process_env) { nil }

    it_behaves_like 'same hash', { 'HELLO' => 'hello' }
  end

  context 'When process_env is given' do
    let(:yaml_env) { nil }

    it_behaves_like 'same hash', { 'WORLD' => 'world' }
  end

  context 'When both yaml_env and process_env are given' do
    it 'it merges the two hashes' do
      expect(subject).to eq(yaml_env.merge(process_env))
    end
  end

  context 'When each yaml_env and process_env have the same key' do
    let(:yaml_env) { { 'HELLO' => 'hello' } }
    let(:process_env) { { 'HELLO' => 'world' } }

    it 'it takes the value from the yaml_env' do
      expect(subject).to eq({ 'HELLO' => 'hello' })
    end
  end
end
