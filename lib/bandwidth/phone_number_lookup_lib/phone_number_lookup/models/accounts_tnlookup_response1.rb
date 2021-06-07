# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # AccountsTnlookupResponse1 Model.
  class AccountsTnlookupResponse1 < BaseModel
    # The requestId.
    # @return [String]
    attr_accessor :request_id

    # The status of the request (IN_PROGRESS, COMPLETE, PARTIAL_COMPLETE, or
    # FAILED).
    # @return [String]
    attr_accessor :status

    # The telephone numbers whose lookup failed
    # @return [List of String]
    attr_accessor :failed_telephone_numbers

    # The carrier information results for the specified telephone number.
    # @return [List of Result]
    attr_accessor :result

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['request_id'] = 'requestId'
      @_hash['status'] = 'status'
      @_hash['failed_telephone_numbers'] = 'failedTelephoneNumbers'
      @_hash['result'] = 'result'
      @_hash
    end

    def initialize(request_id = nil,
                   status = nil,
                   failed_telephone_numbers = nil,
                   result = nil)
      @request_id = request_id
      @status = status
      @failed_telephone_numbers = failed_telephone_numbers
      @result = result
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      request_id = hash['requestId']
      status = hash['status']
      failed_telephone_numbers = hash['failedTelephoneNumbers']
      # Parameter is an array, so we need to iterate through it
      result = nil
      unless hash['result'].nil?
        result = []
        hash['result'].each do |structure|
          result << (Result.from_hash(structure) if structure)
        end
      end

      # Create object from extracted values.
      AccountsTnlookupResponse1.new(request_id,
                                    status,
                                    failed_telephone_numbers,
                                    result)
    end
  end
end
