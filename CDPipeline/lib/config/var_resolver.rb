# frozen_string_literal: true

# TODO: support Parameter/Variable Expansion format: ${VAR}

class VarResolver
  attr_reader :environment

  def initialize(environment)
    @environment = environment || {}
  end

  def resolve(str)
    env_keys = environment.keys
    return str unless env_keys.any? { |key| str.include?(make_var(key)) }

    environment.each do |key, value|
      str = str.gsub(make_var(key), value)
    end

    resolve(str)
  end

  private

  def make_var(name)
    "$#{name}"
  end
end
