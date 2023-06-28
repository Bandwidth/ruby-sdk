=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0

=end

require 'date'
require 'time'

module Bandwidth
  class CreateCallResponse
    # The id of the application associated with the `from` number.
    attr_accessor :application_id

    # The bandwidth account ID associated with the call.
    attr_accessor :account_id

    # Programmable Voice API Call ID.
    attr_accessor :call_id

    # Recipient of the outgoing call.
    attr_accessor :to

    # Phone number that created the outbound call.
    attr_accessor :from

    # The time at which the call was accepted into the queue.
    attr_accessor :enqueued_time

    # The URL to update this call's state.
    attr_accessor :call_url

    # The timeout (in seconds) for the callee to answer the call after it starts ringing.
    attr_accessor :call_timeout

    # This is the timeout (in seconds) to use when delivering webhooks for the call.
    attr_accessor :callback_timeout

    # Custom tag value.
    attr_accessor :tag

    attr_accessor :answer_method

    # URL to deliver the `answer` event webhook.
    attr_accessor :answer_url

    attr_accessor :answer_fallback_method

    # Fallback URL to deliver the `answer` event webhook.
    attr_accessor :answer_fallback_url

    attr_accessor :disconnect_method

    # URL to deliver the `disconnect` event webhook.
    attr_accessor :disconnect_url

    # Basic auth username.
    attr_accessor :username

    # Basic auth password.
    attr_accessor :password

    # Basic auth username.
    attr_accessor :fallback_username

    # Basic auth password.
    attr_accessor :fallback_password

    # The priority of this call over other calls from your account.
    attr_accessor :priority

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
        :'application_id' => :'applicationId',
        :'account_id' => :'accountId',
        :'call_id' => :'callId',
        :'to' => :'to',
        :'from' => :'from',
        :'enqueued_time' => :'enqueuedTime',
        :'call_url' => :'callUrl',
        :'call_timeout' => :'callTimeout',
        :'callback_timeout' => :'callbackTimeout',
        :'tag' => :'tag',
        :'answer_method' => :'answerMethod',
        :'answer_url' => :'answerUrl',
        :'answer_fallback_method' => :'answerFallbackMethod',
        :'answer_fallback_url' => :'answerFallbackUrl',
        :'disconnect_method' => :'disconnectMethod',
        :'disconnect_url' => :'disconnectUrl',
        :'username' => :'username',
        :'password' => :'password',
        :'fallback_username' => :'fallbackUsername',
        :'fallback_password' => :'fallbackPassword',
        :'priority' => :'priority'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'application_id' => :'String',
        :'account_id' => :'String',
        :'call_id' => :'String',
        :'to' => :'String',
        :'from' => :'String',
        :'enqueued_time' => :'Time',
        :'call_url' => :'String',
        :'call_timeout' => :'Float',
        :'callback_timeout' => :'Float',
        :'tag' => :'String',
        :'answer_method' => :'CallbackMethodEnum',
        :'answer_url' => :'String',
        :'answer_fallback_method' => :'CallbackMethodEnum',
        :'answer_fallback_url' => :'String',
        :'disconnect_method' => :'CallbackMethodEnum',
        :'disconnect_url' => :'String',
        :'username' => :'String',
        :'password' => :'String',
        :'fallback_username' => :'String',
        :'fallback_password' => :'String',
        :'priority' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'enqueued_time',
        :'tag',
        :'answer_method',
        :'answer_fallback_method',
        :'answer_fallback_url',
        :'disconnect_method',
        :'disconnect_url',
        :'username',
        :'password',
        :'fallback_username',
        :'fallback_password',
        :'priority'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::CreateCallResponse` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::CreateCallResponse`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'application_id')
        self.application_id = attributes[:'application_id']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'call_id')
        self.call_id = attributes[:'call_id']
      end

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      end

      if attributes.key?(:'enqueued_time')
        self.enqueued_time = attributes[:'enqueued_time']
      end

      if attributes.key?(:'call_url')
        self.call_url = attributes[:'call_url']
      end

      if attributes.key?(:'call_timeout')
        self.call_timeout = attributes[:'call_timeout']
      end

      if attributes.key?(:'callback_timeout')
        self.callback_timeout = attributes[:'callback_timeout']
      end

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end

      if attributes.key?(:'answer_method')
        self.answer_method = attributes[:'answer_method']
      else
        self.answer_method = 'POST'
      end

      if attributes.key?(:'answer_url')
        self.answer_url = attributes[:'answer_url']
      end

      if attributes.key?(:'answer_fallback_method')
        self.answer_fallback_method = attributes[:'answer_fallback_method']
      else
        self.answer_fallback_method = 'POST'
      end

      if attributes.key?(:'answer_fallback_url')
        self.answer_fallback_url = attributes[:'answer_fallback_url']
      end

      if attributes.key?(:'disconnect_method')
        self.disconnect_method = attributes[:'disconnect_method']
      else
        self.disconnect_method = 'POST'
      end

      if attributes.key?(:'disconnect_url')
        self.disconnect_url = attributes[:'disconnect_url']
      end

      if attributes.key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'fallback_username')
        self.fallback_username = attributes[:'fallback_username']
      end

      if attributes.key?(:'fallback_password')
        self.fallback_password = attributes[:'fallback_password']
      end

      if attributes.key?(:'priority')
        self.priority = attributes[:'priority']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @application_id.nil?
        invalid_properties.push('invalid value for "application_id", application_id cannot be nil.')
      end

      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @call_id.nil?
        invalid_properties.push('invalid value for "call_id", call_id cannot be nil.')
      end

      if @to.nil?
        invalid_properties.push('invalid value for "to", to cannot be nil.')
      end

      if @from.nil?
        invalid_properties.push('invalid value for "from", from cannot be nil.')
      end

      if @call_url.nil?
        invalid_properties.push('invalid value for "call_url", call_url cannot be nil.')
      end

      if @answer_url.nil?
        invalid_properties.push('invalid value for "answer_url", answer_url cannot be nil.')
      end

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

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @application_id.nil?
      return false if @account_id.nil?
      return false if @call_id.nil?
      return false if @to.nil?
      return false if @from.nil?
      return false if @call_url.nil?
      return false if @answer_url.nil?
      return false if !@username.nil? && @username.to_s.length > 1024
      return false if !@password.nil? && @password.to_s.length > 1024
      return false if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
      return false if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
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

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          application_id == o.application_id &&
          account_id == o.account_id &&
          call_id == o.call_id &&
          to == o.to &&
          from == o.from &&
          enqueued_time == o.enqueued_time &&
          call_url == o.call_url &&
          call_timeout == o.call_timeout &&
          callback_timeout == o.callback_timeout &&
          tag == o.tag &&
          answer_method == o.answer_method &&
          answer_url == o.answer_url &&
          answer_fallback_method == o.answer_fallback_method &&
          answer_fallback_url == o.answer_fallback_url &&
          disconnect_method == o.disconnect_method &&
          disconnect_url == o.disconnect_url &&
          username == o.username &&
          password == o.password &&
          fallback_username == o.fallback_username &&
          fallback_password == o.fallback_password &&
          priority == o.priority
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [application_id, account_id, call_id, to, from, enqueued_time, call_url, call_timeout, callback_timeout, tag, answer_method, answer_url, answer_fallback_method, answer_fallback_url, disconnect_method, disconnect_url, username, password, fallback_username, fallback_password, priority].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
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
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
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
