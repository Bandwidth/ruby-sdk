=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

require 'date'
require 'time'

module Bandwidth
  class TfvStatusEnum
    VERIFIED = 'VERIFIED'.freeze
    UNVERIFIED = 'UNVERIFIED'.freeze
    PENDING = 'PENDING'.freeze

    def self.all_vars
      @all_vars ||= [VERIFIED, UNVERIFIED, PENDING].freeze
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
      return value if TfvStatusEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #TfvStatusEnum"
    end
  end
end
