# frozen_string_literal: true

class VarResolver
  def self.resolve(str, env_vars)
    return str if env_vars.nil?
  
    env_keys = env_vars.map(&:keys).flatten
    return str unless env_keys.any? { |key| str.include?("$#{key}") }

    env_vars.each do |env|
      env.each do |key, value|
        #str = str.gsub("${#{key}}", value)
        str = str.gsub("$#{key}", value)
      end
    end

    resolve(str, env_vars)
  end
end