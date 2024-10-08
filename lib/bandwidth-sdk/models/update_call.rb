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
  class UpdateCall
    attr_accessor :state

    # The URL to send the [Redirect](/docs/voice/bxml/redirect) event to which will provide new BXML.  Required if `state` is `active`.  Not allowed if `state` is `completed`.
    attr_accessor :redirect_url

    attr_accessor :redirect_method

    # Basic auth username.
    attr_accessor :username

    # Basic auth password.
    attr_accessor :password

    # A fallback url which, if provided, will be used to retry the redirect callback delivery in case `redirectUrl` fails to respond.
    attr_accessor :redirect_fallback_url

    attr_accessor :redirect_fallback_method

    # Basic auth username.
    attr_accessor :fallback_username

    # Basic auth password.
    attr_accessor :fallback_password

    # A custom string that will be sent with this and all future callbacks unless overwritten by a future `tag` attribute or [`<Tag>`](/docs/voice/bxml/tag) verb, or cleared.  May be cleared by setting `tag=\"\"`.  Max length 256 characters.  Not allowed if `state` is `completed`.
    attr_accessor :tag

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'state' => :'state',
        :'redirect_url' => :'redirectUrl',
        :'redirect_method' => :'redirectMethod',
        :'username' => :'username',
        :'password' => :'password',
        :'redirect_fallback_url' => :'redirectFallbackUrl',
        :'redirect_fallback_method' => :'redirectFallbackMethod',
        :'fallback_username' => :'fallbackUsername',
        :'fallback_password' => :'fallbackPassword',
        :'tag' => :'tag'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'state' => :'CallStateEnum',
        :'redirect_url' => :'String',
        :'redirect_method' => :'RedirectMethodEnum',
        :'username' => :'String',
        :'password' => :'String',
        :'redirect_fallback_url' => :'String',
        :'redirect_fallback_method' => :'RedirectMethodEnum',
        :'fallback_username' => :'String',
        :'fallback_password' => :'String',
        :'tag' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'state',
        :'redirect_url',
        :'redirect_method',
        :'username',
        :'password',
        :'redirect_fallback_url',
        :'redirect_fallback_method',
        :'fallback_username',
        :'fallback_password',
        :'tag'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::UpdateCall` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::UpdateCall`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      else
        self.state = 'active'
      end

      if attributes.key?(:'redirect_url')
        self.redirect_url = attributes[:'redirect_url']
      end

      if attributes.key?(:'redirect_method')
        self.redirect_method = attributes[:'redirect_method']
      else
        self.redirect_method = 'POST'
      end

      if attributes.key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'redirect_fallback_url')
        self.redirect_fallback_url = attributes[:'redirect_fallback_url']
      end

      if attributes.key?(:'redirect_fallback_method')
        self.redirect_fallback_method = attributes[:'redirect_fallback_method']
      else
        self.redirect_fallback_method = 'POST'
      end

      if attributes.key?(:'fallback_username')
        self.fallback_username = attributes[:'fallback_username']
      end

      if attributes.key?(:'fallback_password')
        self.fallback_password = attributes[:'fallback_password']
      end

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@username.nil? && @username.to_s.length > 1024
        invalid_properties.push('invalid value for "username", the character length must be smaller than or equal to 1024.')
      end

      if !@password.nil? && @password.to_s.length > 1024
        invalid_properties.push('invalid value for "password", the character length must be smaller than or equal to 1024.')
      end

      if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
        invalid_properties.push('invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
      end

      if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
        invalid_properties.push('invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
      end

      if !@tag.nil? && @tag.to_s.length > 256
        invalid_properties.push('invalid value for "tag", the character length must be smaller than or equal to 256.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@username.nil? && @username.to_s.length > 1024
      return false if !@password.nil? && @password.to_s.length > 1024
      return false if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
      return false if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
      return false if !@tag.nil? && @tag.to_s.length > 256
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] username Value to be assigned
    def username=(username)
      if !username.nil? && username.to_s.length > 1024
        fail ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.'
      end

      @username = username
    end

    # Custom attribute writer method with validation
    # @param [Object] password Value to be assigned
    def password=(password)
      if !password.nil? && password.to_s.length > 1024
        fail ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.'
      end

      @password = password
    end

    # Custom attribute writer method with validation
    # @param [Object] fallback_username Value to be assigned
    def fallback_username=(fallback_username)
      if !fallback_username.nil? && fallback_username.to_s.length > 1024
        fail ArgumentError, 'invalid value for "fallback_username", the character length must be smaller than or equal to 1024.'
      end

      @fallback_username = fallback_username
    end

    # Custom attribute writer method with validation
    # @param [Object] fallback_password Value to be assigned
    def fallback_password=(fallback_password)
      if !fallback_password.nil? && fallback_password.to_s.length > 1024
        fail ArgumentError, 'invalid value for "fallback_password", the character length must be smaller than or equal to 1024.'
      end

      @fallback_password = fallback_password
    end

    # Custom attribute writer method with validation
    # @param [Object] tag Value to be assigned
    def tag=(tag)
      if !tag.nil? && tag.to_s.length > 256
        fail ArgumentError, 'invalid value for "tag", the character length must be smaller than or equal to 256.'
      end

      @tag = tag
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          state == o.state &&
          redirect_url == o.redirect_url &&
          redirect_method == o.redirect_method &&
          username == o.username &&
          password == o.password &&
          redirect_fallback_url == o.redirect_fallback_url &&
          redirect_fallback_method == o.redirect_fallback_method &&
          fallback_username == o.fallback_username &&
          fallback_password == o.fallback_password &&
          tag == o.tag
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [state, redirect_url, redirect_method, username, password, redirect_fallback_url, redirect_fallback_method, fallback_username, fallback_password, tag].hash
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
