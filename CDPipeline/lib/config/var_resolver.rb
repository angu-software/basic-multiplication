# frozen_string_literal: true

class VarResolver
  attr_reader :environment

  def initialize(environment)
    @environment = environment || {}
  end

  def resolve(str)
    env_keys = environment.keys
    return str unless env_keys.any? { |key| str.include?("$#{key}") }

    environment.each do |key, value|
      # str = str.gsub("${#{key}}", value)
      str = str.gsub("$#{key}", value)
    end

    resolve(str)
  end
end
