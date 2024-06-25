=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'date'
require 'time'

module Bandwidth
  class MessageTypeEnum
    SMS = "sms".freeze
    MMS = "mms".freeze

    def self.all_vars
      @all_vars ||= [SMS, MMS].freeze
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
      return value if MessageTypeEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #MessageTypeEnum"
    end
  end
end
