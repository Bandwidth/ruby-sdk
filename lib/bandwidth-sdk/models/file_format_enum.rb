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
  class FileFormatEnum
    MP3 = "mp3".freeze
    WAV = "wav".freeze

    def self.all_vars
      @all_vars ||= [MP3, WAV].freeze
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
      return value if FileFormatEnum.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #FileFormatEnum"
    end
  end
end
