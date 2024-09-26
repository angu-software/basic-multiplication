# frozen_string_literal: true

class VarResolver
  attr_reader :environment

  def initialize(yaml_environment)
    @environment = convert_to_hash(yaml_environment)
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

  private

  def convert_to_hash(env_vars)
    return {} if env_vars.nil?

    env_vars.each_with_object({}) { |env, hash| hash.merge!(env) }
  end
end
