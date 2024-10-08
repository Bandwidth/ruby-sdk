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
  class CodeRequest
    # The phone number to send the mfa code to.
    attr_accessor :to

    # The application phone number, the sender of the mfa code.
    attr_accessor :from

    # The application unique ID, obtained from Bandwidth.
    attr_accessor :application_id

    # An optional field to denote what scope or action the mfa code is addressing.  If not supplied, defaults to \"2FA\".
    attr_accessor :scope

    # The message format of the mfa code.  There are three values that the system will replace \"{CODE}\", \"{NAME}\", \"{SCOPE}\".  The \"{SCOPE}\" and \"{NAME} value template are optional, while \"{CODE}\" must be supplied.  As the name would suggest, code will be replace with the actual mfa code.  Name is replaced with the application name, configured during provisioning of mfa.  The scope value is the same value sent during the call and partitioned by the server.
    attr_accessor :message

    # The number of digits for your mfa code.  The valid number ranges from 2 to 8, inclusively.
    attr_accessor :digits

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'to' => :'to',
        :'from' => :'from',
        :'application_id' => :'applicationId',
        :'scope' => :'scope',
        :'message' => :'message',
        :'digits' => :'digits'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'to' => :'String',
        :'from' => :'String',
        :'application_id' => :'String',
        :'scope' => :'String',
        :'message' => :'String',
        :'digits' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::CodeRequest` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::CodeRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      else
        self.to = nil
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      else
        self.from = nil
      end

      if attributes.key?(:'application_id')
        self.application_id = attributes[:'application_id']
      else
        self.application_id = nil
      end

      if attributes.key?(:'scope')
        self.scope = attributes[:'scope']
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      else
        self.message = nil
      end

      if attributes.key?(:'digits')
        self.digits = attributes[:'digits']
      else
        self.digits = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @to.nil?
        invalid_properties.push('invalid value for "to", to cannot be nil.')
      end

      pattern = Regexp.new(/^\+[1-9]\d{1,14}$/)
      if @to !~ pattern
        invalid_properties.push("invalid value for \"to\", must conform to the pattern #{pattern}.")
      end

      if @from.nil?
        invalid_properties.push('invalid value for "from", from cannot be nil.')
      end

      if @from.to_s.length > 32
        invalid_properties.push('invalid value for "from", the character length must be smaller than or equal to 32.')
      end

      pattern = Regexp.new(/^\+[1-9]\d{1,14}$/)
      if @from !~ pattern
        invalid_properties.push("invalid value for \"from\", must conform to the pattern #{pattern}.")
      end

      if @application_id.nil?
        invalid_properties.push('invalid value for "application_id", application_id cannot be nil.')
      end

      if @application_id.to_s.length > 50
        invalid_properties.push('invalid value for "application_id", the character length must be smaller than or equal to 50.')
      end

      if !@scope.nil? && @scope.to_s.length > 25
        invalid_properties.push('invalid value for "scope", the character length must be smaller than or equal to 25.')
      end

      if @message.nil?
        invalid_properties.push('invalid value for "message", message cannot be nil.')
      end

      if @message.to_s.length > 2048
        invalid_properties.push('invalid value for "message", the character length must be smaller than or equal to 2048.')
      end

      if @digits.nil?
        invalid_properties.push('invalid value for "digits", digits cannot be nil.')
      end

      if @digits > 8
        invalid_properties.push('invalid value for "digits", must be smaller than or equal to 8.')
      end

      if @digits < 4
        invalid_properties.push('invalid value for "digits", must be greater than or equal to 4.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @to.nil?
      return false if @to !~ Regexp.new(/^\+[1-9]\d{1,14}$/)
      return false if @from.nil?
      return false if @from.to_s.length > 32
      return false if @from !~ Regexp.new(/^\+[1-9]\d{1,14}$/)
      return false if @application_id.nil?
      return false if @application_id.to_s.length > 50
      return false if !@scope.nil? && @scope.to_s.length > 25
      return false if @message.nil?
      return false if @message.to_s.length > 2048
      return false if @digits.nil?
      return false if @digits > 8
      return false if @digits < 4
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] to Value to be assigned
    def to=(to)
      if to.nil?
        fail ArgumentError, 'to cannot be nil'
      end

      pattern = Regexp.new(/^\+[1-9]\d{1,14}$/)
      if to !~ pattern
        fail ArgumentError, "invalid value for \"to\", must conform to the pattern #{pattern}."
      end

      @to = to
    end

    # Custom attribute writer method with validation
    # @param [Object] from Value to be assigned
    def from=(from)
      if from.nil?
        fail ArgumentError, 'from cannot be nil'
      end

      if from.to_s.length > 32
        fail ArgumentError, 'invalid value for "from", the character length must be smaller than or equal to 32.'
      end

      pattern = Regexp.new(/^\+[1-9]\d{1,14}$/)
      if from !~ pattern
        fail ArgumentError, "invalid value for \"from\", must conform to the pattern #{pattern}."
      end

      @from = from
    end

    # Custom attribute writer method with validation
    # @param [Object] application_id Value to be assigned
    def application_id=(application_id)
      if application_id.nil?
        fail ArgumentError, 'application_id cannot be nil'
      end

      if application_id.to_s.length > 50
        fail ArgumentError, 'invalid value for "application_id", the character length must be smaller than or equal to 50.'
      end

      @application_id = application_id
    end

    # Custom attribute writer method with validation
    # @param [Object] scope Value to be assigned
    def scope=(scope)
      if scope.nil?
        fail ArgumentError, 'scope cannot be nil'
      end

      if scope.to_s.length > 25
        fail ArgumentError, 'invalid value for "scope", the character length must be smaller than or equal to 25.'
      end

      @scope = scope
    end

    # Custom attribute writer method with validation
    # @param [Object] message Value to be assigned
    def message=(message)
      if message.nil?
        fail ArgumentError, 'message cannot be nil'
      end

      if message.to_s.length > 2048
        fail ArgumentError, 'invalid value for "message", the character length must be smaller than or equal to 2048.'
      end

      @message = message
    end

    # Custom attribute writer method with validation
    # @param [Object] digits Value to be assigned
    def digits=(digits)
      if digits.nil?
        fail ArgumentError, 'digits cannot be nil'
      end

      if digits > 8
        fail ArgumentError, 'invalid value for "digits", must be smaller than or equal to 8.'
      end

      if digits < 4
        fail ArgumentError, 'invalid value for "digits", must be greater than or equal to 4.'
      end

      @digits = digits
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          to == o.to &&
          from == o.from &&
          application_id == o.application_id &&
          scope == o.scope &&
          message == o.message &&
          digits == o.digits
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [to, from, application_id, scope, message, digits].hash
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
