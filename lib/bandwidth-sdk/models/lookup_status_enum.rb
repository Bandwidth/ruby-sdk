=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.6.0

=end

require 'date'
require 'time'

module Bandwidth
  class LookupStatusEnum
    IN_PROGRESS = "IN_PROGRESS".freeze
    COMPLETE = "COMPLETE".freeze
    PARTIAL_COMPLETE = "PARTIAL_COMPLETE".freeze
    FAILED = "FAILED".freeze

    def self.all_vars
      @all_vars ||= [IN_PROGRESS, COMPLETE, PARTIAL_COMPLETE, FAILED].freeze
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
      return value if LookupStatusEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #LookupStatusEnum"
    end
  end
end