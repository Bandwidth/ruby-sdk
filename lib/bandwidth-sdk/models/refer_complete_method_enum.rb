require 'date'
require 'time'

module Bandwidth
  class ReferCompleteMethodEnum
    GET = "GET".freeze
    POST = "POST".freeze

    def self.all_vars
      @all_vars ||= [GET, POST].freeze
    end

    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    def build_from_hash(value)
      return value if ReferCompleteMethodEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ReferCompleteMethodEnum"
    end
  end
end