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
  class WebhookSubscriptionRequestSchema
    attr_accessor :basic_authentication

    # Callback URL to receive status updates from Bandwidth. When a webhook subscription is registered with Bandwidth under a given account ID, it will be used to send status updates for all requests submitted under that account ID.
    attr_accessor :callback_url

    # An ASCII string submitted by the user as a shared secret key for generating an HMAC header for callbacks.
    attr_accessor :shared_secret_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'basic_authentication' => :'basicAuthentication',
        :'callback_url' => :'callbackUrl',
        :'shared_secret_key' => :'sharedSecretKey'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'basic_authentication' => :'TfvBasicAuthentication',
        :'callback_url' => :'String',
        :'shared_secret_key' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'callback_url',
        :'shared_secret_key'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::WebhookSubscriptionRequestSchema` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::WebhookSubscriptionRequestSchema`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'basic_authentication')
        self.basic_authentication = attributes[:'basic_authentication']
      end

      if attributes.key?(:'callback_url')
        self.callback_url = attributes[:'callback_url']
      else
        self.callback_url = nil
      end

      if attributes.key?(:'shared_secret_key')
        self.shared_secret_key = attributes[:'shared_secret_key']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @callback_url.to_s.length > 2000
        invalid_properties.push('invalid value for "callback_url", the character length must be smaller than or equal to 2000.')
      end

      if @callback_url.to_s.length < 0
        invalid_properties.push('invalid value for "callback_url", the character length must be great than or equal to 0.')
      end

      pattern = Regexp.new(/^$|(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,253}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#()?&\/\/=]*)/)
      if @callback_url !~ pattern
        invalid_properties.push("invalid value for \"callback_url\", must conform to the pattern #{pattern}.")
      end

      if !@shared_secret_key.nil? && @shared_secret_key.to_s.length > 64
        invalid_properties.push('invalid value for "shared_secret_key", the character length must be smaller than or equal to 64.')
      end

      if !@shared_secret_key.nil? && @shared_secret_key.to_s.length < 16
        invalid_properties.push('invalid value for "shared_secret_key", the character length must be great than or equal to 16.')
      end

      pattern = Regexp.new(/^[ -~]{16,64}$/)
      if !@shared_secret_key.nil? && @shared_secret_key !~ pattern
        invalid_properties.push("invalid value for \"shared_secret_key\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @callback_url.to_s.length > 2000
      return false if @callback_url.to_s.length < 0
      return false if @callback_url !~ Regexp.new(/^$|(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,253}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#()?&\/\/=]*)/)
      return false if !@shared_secret_key.nil? && @shared_secret_key.to_s.length > 64
      return false if !@shared_secret_key.nil? && @shared_secret_key.to_s.length < 16
      return false if !@shared_secret_key.nil? && @shared_secret_key !~ Regexp.new(/^[ -~]{16,64}$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] callback_url Value to be assigned
    def callback_url=(callback_url)
      if !callback_url.nil? && callback_url.to_s.length > 2000
        fail ArgumentError, 'invalid value for "callback_url", the character length must be smaller than or equal to 2000.'
      end

      if !callback_url.nil? && callback_url.to_s.length < 0
        fail ArgumentError, 'invalid value for "callback_url", the character length must be great than or equal to 0.'
      end

      pattern = Regexp.new(/^$|(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,253}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#()?&\/\/=]*)/)
      if !callback_url.nil? && callback_url !~ pattern
        fail ArgumentError, "invalid value for \"callback_url\", must conform to the pattern #{pattern}."
      end

      @callback_url = callback_url
    end

    # Custom attribute writer method with validation
    # @param [Object] shared_secret_key Value to be assigned
    def shared_secret_key=(shared_secret_key)
      if !shared_secret_key.nil? && shared_secret_key.to_s.length > 64
        fail ArgumentError, 'invalid value for "shared_secret_key", the character length must be smaller than or equal to 64.'
      end

      if !shared_secret_key.nil? && shared_secret_key.to_s.length < 16
        fail ArgumentError, 'invalid value for "shared_secret_key", the character length must be great than or equal to 16.'
      end

      pattern = Regexp.new(/^[ -~]{16,64}$/)
      if !shared_secret_key.nil? && shared_secret_key !~ pattern
        fail ArgumentError, "invalid value for \"shared_secret_key\", must conform to the pattern #{pattern}."
      end

      @shared_secret_key = shared_secret_key
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          basic_authentication == o.basic_authentication &&
          callback_url == o.callback_url &&
          shared_secret_key == o.shared_secret_key
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [basic_authentication, callback_url, shared_secret_key].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Bandwidth.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
