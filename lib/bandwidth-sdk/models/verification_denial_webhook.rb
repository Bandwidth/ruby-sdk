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
  class VerificationDenialWebhook
    # User's account ID.
    attr_accessor :account_id

    # An optional list of denial reasons in addition to declineReasonDescription when multiple reasons apply.
    attr_accessor :additional_denial_reasons

    # Explanation for why a verification request was declined.
    attr_accessor :decline_reason_description

    # Reason code for denial.
    attr_accessor :denial_status_code

    # Unique identifier (UUID) generated by Bandwidth to assist in tracking the verification status of a toll-free number.
    attr_accessor :internal_ticket_number

    # Toll-free telephone number in E.164 format.
    attr_accessor :phone_number

    # Whether a Toll-Free Verification request qualifies for resubmission via PUT.
    attr_accessor :resubmit_allowed

    attr_accessor :status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'accountId',
        :'additional_denial_reasons' => :'additionalDenialReasons',
        :'decline_reason_description' => :'declineReasonDescription',
        :'denial_status_code' => :'denialStatusCode',
        :'internal_ticket_number' => :'internalTicketNumber',
        :'phone_number' => :'phoneNumber',
        :'resubmit_allowed' => :'resubmitAllowed',
        :'status' => :'status'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'account_id' => :'String',
        :'additional_denial_reasons' => :'Array<AdditionalDenialReason>',
        :'decline_reason_description' => :'String',
        :'denial_status_code' => :'Integer',
        :'internal_ticket_number' => :'String',
        :'phone_number' => :'String',
        :'resubmit_allowed' => :'Boolean',
        :'status' => :'String'
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
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::VerificationDenialWebhook` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::VerificationDenialWebhook`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'additional_denial_reasons')
        if (value = attributes[:'additional_denial_reasons']).is_a?(Array)
          self.additional_denial_reasons = value
        end
      end

      if attributes.key?(:'decline_reason_description')
        self.decline_reason_description = attributes[:'decline_reason_description']
      end

      if attributes.key?(:'denial_status_code')
        self.denial_status_code = attributes[:'denial_status_code']
      end

      if attributes.key?(:'internal_ticket_number')
        self.internal_ticket_number = attributes[:'internal_ticket_number']
      end

      if attributes.key?(:'phone_number')
        self.phone_number = attributes[:'phone_number']
      end

      if attributes.key?(:'resubmit_allowed')
        self.resubmit_allowed = attributes[:'resubmit_allowed']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      else
        self.status = 'UNVERIFIED'
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@phone_number.nil? && @phone_number.to_s.length > 12
        invalid_properties.push('invalid value for "phone_number", the character length must be smaller than or equal to 12.')
      end

      if !@phone_number.nil? && @phone_number.to_s.length < 12
        invalid_properties.push('invalid value for "phone_number", the character length must be great than or equal to 12.')
      end

      pattern = Regexp.new(/^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$/)
      if !@phone_number.nil? && @phone_number !~ pattern
        invalid_properties.push("invalid value for \"phone_number\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@phone_number.nil? && @phone_number.to_s.length > 12
      return false if !@phone_number.nil? && @phone_number.to_s.length < 12
      return false if !@phone_number.nil? && @phone_number !~ Regexp.new(/^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] phone_number Value to be assigned
    def phone_number=(phone_number)
      if phone_number.nil?
        fail ArgumentError, 'phone_number cannot be nil'
      end

      if phone_number.to_s.length > 12
        fail ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.'
      end

      if phone_number.to_s.length < 12
        fail ArgumentError, 'invalid value for "phone_number", the character length must be great than or equal to 12.'
      end

      pattern = Regexp.new(/^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$/)
      if phone_number !~ pattern
        fail ArgumentError, "invalid value for \"phone_number\", must conform to the pattern #{pattern}."
      end

      @phone_number = phone_number
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          additional_denial_reasons == o.additional_denial_reasons &&
          decline_reason_description == o.decline_reason_description &&
          denial_status_code == o.denial_status_code &&
          internal_ticket_number == o.internal_ticket_number &&
          phone_number == o.phone_number &&
          resubmit_allowed == o.resubmit_allowed &&
          status == o.status
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [account_id, additional_denial_reasons, decline_reason_description, denial_status_code, internal_ticket_number, phone_number, resubmit_allowed, status].hash
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
