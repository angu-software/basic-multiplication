# frozen_string_literal: true

FactoryBot.define do
  factory :stage do
    name { 'Development Stage' }
    steps  do
      [
        build(:step),
        build(:step, name: 'Build for testing',
                     command: 'xcodebuild build-for-testing -scheme "Basic Multiplication" -testPlan "DevelopmentTests" -destination "platform=iOS Simulator,name=iPhone 16 Pro"'),
        build(:step, name: 'Test without building',
                     command: 'xcodebuild test-without-building -scheme "Basic Multiplication" -testPlan "DevelopmentTests" -destination "platform=iOS Simulator,name=iPhone 16 Pro"')
      ]
    end
  end
end
