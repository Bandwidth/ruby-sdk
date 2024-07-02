=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.7.0

=end

require 'date'
require 'time'

module Bandwidth
  class ConferenceStateEnum
    ACTIVE = "active".freeze
    COMPLETED = "completed".freeze

    def self.all_vars
      @all_vars ||= [ACTIVE, COMPLETED].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if ConferenceStateEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ConferenceStateEnum"
    end
  end
end
