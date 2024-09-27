# frozen_string_literal: true

class StageEnv < Hash
  def self.merge_env(yaml_env, process_env = ENV.to_h)
    hash = process_env || {}
    return hash if yaml_env.nil?

    hash.merge(yaml_env)
  end
end
