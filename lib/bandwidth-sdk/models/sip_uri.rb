require 'date'
require 'time'

module Bandwidth
  class SipUri < ApiModelBase
    # SIP URI destination (e.g. sip:alice@atlanta.example.com)
    attr_accessor :sip_uri

    def self.attribute_map
      { :'sip_uri' => :'sipUri' }
    end

    def self.acceptable_attribute_map
      attribute_map
    end

    def self.acceptable_attributes
      acceptable_attribute_map.values
    end

    def self.openapi_types
      { :'sip_uri' => :'String' }
    end

    def self.openapi_nullable
      Set.new([])
    end

    def initialize(attributes = {})
      raise ArgumentError, "attributes must be a Hash" unless attributes.is_a?(Hash)

      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::SipUri`." unless acceptable_attribute_map.key?(k.to_sym)
        h[k.to_sym] = v
      end

      self.sip_uri = attributes[:'sip_uri'] if attributes.key?(:'sip_uri')
    end

    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        next if attributes[attribute_map[key]].nil?
        transformed_hash[key.to_s] = _deserialize(type, attributes[attribute_map[key]])
      end
      new(transformed_hash)
    end

    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end
  end
end