# frozen_string_literal: true

require_relative 'development_stage'

if __FILE__ == $PROGRAM_NAME
  if ARGV.include?('--tag_rc')
    DevelopmentStage.tag_rc_build
  else
    DevelopmentStage.run
  end
end