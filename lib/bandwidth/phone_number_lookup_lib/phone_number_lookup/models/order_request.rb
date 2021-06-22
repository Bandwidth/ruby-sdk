# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # Create TN Lookup Request
  class OrderRequest < BaseModel
    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :tns

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['tns'] = 'tns'
      @_hash
    end

    def initialize(tns = nil)
      @tns = tns
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      tns = hash['tns']

      # Create object from extracted values.
      OrderRequest.new(tns)
    end
  end
end
