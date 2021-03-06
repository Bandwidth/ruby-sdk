# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # Result Model.
  class Result < BaseModel
    # Our vendor's response code.
    # @return [Integer]
    attr_accessor :response_code

    # Message associated with the response code.
    # @return [String]
    attr_accessor :message

    # The telephone number in E.164 format.
    # @return [String]
    attr_accessor :e_164_format

    # The formatted version of the telephone number.
    # @return [String]
    attr_accessor :formatted

    # The country of the telephone number.
    # @return [String]
    attr_accessor :country

    # The line type of the telephone number.
    # @return [String]
    attr_accessor :line_type

    # The service provider of the telephone number.
    # @return [String]
    attr_accessor :line_provider

    # The first half of the Home Network Identity (HNI).
    # @return [String]
    attr_accessor :mobile_country_code

    # The second half of the HNI.
    # @return [String]
    attr_accessor :mobile_network_code

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['response_code'] = 'Response Code'
      @_hash['message'] = 'Message'
      @_hash['e_164_format'] = 'E.164 Format'
      @_hash['formatted'] = 'Formatted'
      @_hash['country'] = 'Country'
      @_hash['line_type'] = 'Line Type'
      @_hash['line_provider'] = 'Line Provider'
      @_hash['mobile_country_code'] = 'Mobile Country Code'
      @_hash['mobile_network_code'] = 'Mobile Network Code'
      @_hash
    end

    def initialize(response_code = nil,
                   message = nil,
                   e_164_format = nil,
                   formatted = nil,
                   country = nil,
                   line_type = nil,
                   line_provider = nil,
                   mobile_country_code = nil,
                   mobile_network_code = nil)
      @response_code = response_code
      @message = message
      @e_164_format = e_164_format
      @formatted = formatted
      @country = country
      @line_type = line_type
      @line_provider = line_provider
      @mobile_country_code = mobile_country_code
      @mobile_network_code = mobile_network_code
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      response_code = hash['Response Code']
      message = hash['Message']
      e_164_format = hash['E.164 Format']
      formatted = hash['Formatted']
      country = hash['Country']
      line_type = hash['Line Type']
      line_provider = hash['Line Provider']
      mobile_country_code = hash['Mobile Country Code']
      mobile_network_code = hash['Mobile Network Code']

      # Create object from extracted values.
      Result.new(response_code,
                 message,
                 e_164_format,
                 formatted,
                 country,
                 line_type,
                 line_provider,
                 mobile_country_code,
                 mobile_network_code)
    end
  end
end
