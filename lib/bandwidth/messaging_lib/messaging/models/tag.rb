# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # Tag Model.
  class Tag < BaseModel
    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :key

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :value

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['key'] = 'key'
      @_hash['value'] = 'value'
      @_hash
    end

    def initialize(key = nil,
                   value = nil)
      @key = key
      @value = value
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      key = hash['key']
      value = hash['value']

      # Create object from extracted values.
      Tag.new(key,
              value)
    end
  end
end
