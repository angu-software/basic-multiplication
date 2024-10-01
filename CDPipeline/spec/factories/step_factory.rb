# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    name { 'Select Xcode version' }
    command { 'sudo xcode-select -s /Applications/Xcode_16.app' }
  end
end
