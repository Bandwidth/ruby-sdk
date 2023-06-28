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
  class CreateCall
    # The destination to call (must be an E.164 formatted number (e.g. `+15555551212`) or a SIP URI (e.g. `sip:user@server.example`)).
    attr_accessor :to

    # A Bandwidth phone number on your account the call should come from (must be in E.164 format, like `+15555551212`, or be one of the following strings: `Restricted`, `Anonymous`, `Private`, or `Unavailable`).
    attr_accessor :from

    # A comma-separated list of 'User-To-User' headers to be sent in the INVITE when calling a SIP URI. Each value must end with an 'encoding' parameter as described in <a href='https://tools.ietf.org/html/rfc7433'>RFC 7433</a>. Only 'jwt' and 'base64' encodings are allowed. The entire value cannot exceed 350 characters, including parameters and separators.
    attr_accessor :uui

    # The id of the application associated with the `from` number.
    attr_accessor :application_id

    # The full URL to send the <a href='/docs/voice/webhooks/answer'>Answer</a> event to when the called party answers. This endpoint should return the first <a href='/docs/voice/bxml'>BXML document</a> to be executed in the call.  Must use `https` if specifying `username` and `password`.
    attr_accessor :answer_url

    attr_accessor :answer_method

    # Basic auth username.
    attr_accessor :username

    # Basic auth password.
    attr_accessor :password

    # A fallback url which, if provided, will be used to retry the `answer` webhook delivery in case `answerUrl` fails to respond  Must use `https` if specifying `fallbackUsername` and `fallbackPassword`.
    attr_accessor :answer_fallback_url

    attr_accessor :answer_fallback_method

    # Basic auth username.
    attr_accessor :fallback_username

    # Basic auth password.
    attr_accessor :fallback_password

    # The URL to send the <a href='/docs/voice/webhooks/disconnect'>Disconnect</a> event to when the call ends. This event does not expect a BXML response.
    attr_accessor :disconnect_url

    attr_accessor :disconnect_method

    # The timeout (in seconds) for the callee to answer the call after it starts ringing. If the call does not start ringing within 30s, the call will be cancelled regardless of this value.  Can be any numeric value (including decimals) between 1 and 300.
    attr_accessor :call_timeout

    # This is the timeout (in seconds) to use when delivering webhooks for the call. Can be any numeric value (including decimals) between 1 and 25.
    attr_accessor :callback_timeout

    attr_accessor :machine_detection

    # The priority of this call over other calls from your account. For example, if during a call your application needs to place a new call and bridge it with the current call, you might want to create the call with priority 1 so that it will be the next call picked off your queue, ahead of other less time sensitive calls. A lower value means higher priority, so a priority 1 call takes precedence over a priority 2 call.
    attr_accessor :priority

    # A custom string that will be sent with all webhooks for this call unless overwritten by a future <a href='/docs/voice/bxml/tag'>`<Tag>`</a> verb or `tag` attribute on another verb, or cleared.  May be cleared by setting `tag=\"\"`  Max length 256 characters.
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
        :'to' => :'to',
        :'from' => :'from',
        :'uui' => :'uui',
        :'application_id' => :'applicationId',
        :'answer_url' => :'answerUrl',
        :'answer_method' => :'answerMethod',
        :'username' => :'username',
        :'password' => :'password',
        :'answer_fallback_url' => :'answerFallbackUrl',
        :'answer_fallback_method' => :'answerFallbackMethod',
        :'fallback_username' => :'fallbackUsername',
        :'fallback_password' => :'fallbackPassword',
        :'disconnect_url' => :'disconnectUrl',
        :'disconnect_method' => :'disconnectMethod',
        :'call_timeout' => :'callTimeout',
        :'callback_timeout' => :'callbackTimeout',
        :'machine_detection' => :'machineDetection',
        :'priority' => :'priority',
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
        :'to' => :'String',
        :'from' => :'String',
        :'uui' => :'String',
        :'application_id' => :'String',
        :'answer_url' => :'String',
        :'answer_method' => :'CallbackMethodEnum',
        :'username' => :'String',
        :'password' => :'String',
        :'answer_fallback_url' => :'String',
        :'answer_fallback_method' => :'CallbackMethodEnum',
        :'fallback_username' => :'String',
        :'fallback_password' => :'String',
        :'disconnect_url' => :'String',
        :'disconnect_method' => :'CallbackMethodEnum',
        :'call_timeout' => :'Float',
        :'callback_timeout' => :'Float',
        :'machine_detection' => :'MachineDetectionConfiguration',
        :'priority' => :'Integer',
        :'tag' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'uui',
        :'answer_method',
        :'username',
        :'password',
        :'answer_fallback_url',
        :'answer_fallback_method',
        :'fallback_username',
        :'fallback_password',
        :'disconnect_url',
        :'disconnect_method',
        :'call_timeout',
        :'callback_timeout',
        :'priority',
        :'tag'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::CreateCall` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::CreateCall`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      end

      if attributes.key?(:'uui')
        self.uui = attributes[:'uui']
      end

      if attributes.key?(:'application_id')
        self.application_id = attributes[:'application_id']
      end

      if attributes.key?(:'answer_url')
        self.answer_url = attributes[:'answer_url']
      end

      if attributes.key?(:'answer_method')
        self.answer_method = attributes[:'answer_method']
      else
        self.answer_method = 'POST'
      end

      if attributes.key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'answer_fallback_url')
        self.answer_fallback_url = attributes[:'answer_fallback_url']
      end

      if attributes.key?(:'answer_fallback_method')
        self.answer_fallback_method = attributes[:'answer_fallback_method']
      else
        self.answer_fallback_method = 'POST'
      end

      if attributes.key?(:'fallback_username')
        self.fallback_username = attributes[:'fallback_username']
      end

      if attributes.key?(:'fallback_password')
        self.fallback_password = attributes[:'fallback_password']
      end

      if attributes.key?(:'disconnect_url')
        self.disconnect_url = attributes[:'disconnect_url']
      end

      if attributes.key?(:'disconnect_method')
        self.disconnect_method = attributes[:'disconnect_method']
      else
        self.disconnect_method = 'POST'
      end

      if attributes.key?(:'call_timeout')
        self.call_timeout = attributes[:'call_timeout']
      else
        self.call_timeout = 30
      end

      if attributes.key?(:'callback_timeout')
        self.callback_timeout = attributes[:'callback_timeout']
      else
        self.callback_timeout = 15
      end

      if attributes.key?(:'machine_detection')
        self.machine_detection = attributes[:'machine_detection']
      end

      if attributes.key?(:'priority')
        self.priority = attributes[:'priority']
      else
        self.priority = 5
      end

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @to.nil?
        invalid_properties.push('invalid value for "to", to cannot be nil.')
      end

      if @from.nil?
        invalid_properties.push('invalid value for "from", from cannot be nil.')
      end

      if @application_id.nil?
        invalid_properties.push('invalid value for "application_id", application_id cannot be nil.')
      end

      if @answer_url.nil?
        invalid_properties.push('invalid value for "answer_url", answer_url cannot be nil.')
      end

      if @answer_url.to_s.length > 2048
        invalid_properties.push('invalid value for "answer_url", the character length must be smaller than or equal to 2048.')
      end

      if !@username.nil? && @username.to_s.length > 1024
        invalid_properties.push('invalid value for "username", the character length must be smaller than or equal to 1024.')
      end

      if !@password.nil? && @password.to_s.length > 1024
        invalid_properties.push('invalid value for "password", the character length must be smaller than or equal to 1024.')
      end

      if !@answer_fallback_url.nil? && @answer_fallback_url.to_s.length > 2048
        invalid_properties.push('invalid value for "answer_fallback_url", the character length must be smaller than or equal to 2048.')
      end

      if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
        invalid_properties.push('invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
      end

      if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
        invalid_properties.push('invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
      end

      if !@disconnect_url.nil? && @disconnect_url.to_s.length > 2048
        invalid_properties.push('invalid value for "disconnect_url", the character length must be smaller than or equal to 2048.')
      end

      if !@call_timeout.nil? && @call_timeout > 300
        invalid_properties.push('invalid value for "call_timeout", must be smaller than or equal to 300.')
      end

      if !@call_timeout.nil? && @call_timeout < 1
        invalid_properties.push('invalid value for "call_timeout", must be greater than or equal to 1.')
      end

      if !@callback_timeout.nil? && @callback_timeout > 25
        invalid_properties.push('invalid value for "callback_timeout", must be smaller than or equal to 25.')
      end

      if !@callback_timeout.nil? && @callback_timeout < 1
        invalid_properties.push('invalid value for "callback_timeout", must be greater than or equal to 1.')
      end

      if !@priority.nil? && @priority > 5
        invalid_properties.push('invalid value for "priority", must be smaller than or equal to 5.')
      end

      if !@priority.nil? && @priority < 1
        invalid_properties.push('invalid value for "priority", must be greater than or equal to 1.')
      end

      if !@tag.nil? && @tag.to_s.length > 256
        invalid_properties.push('invalid value for "tag", the character length must be smaller than or equal to 256.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @to.nil?
      return false if @from.nil?
      return false if @application_id.nil?
      return false if @answer_url.nil?
      return false if @answer_url.to_s.length > 2048
      return false if !@username.nil? && @username.to_s.length > 1024
      return false if !@password.nil? && @password.to_s.length > 1024
      return false if !@answer_fallback_url.nil? && @answer_fallback_url.to_s.length > 2048
      return false if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
      return false if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
      return false if !@disconnect_url.nil? && @disconnect_url.to_s.length > 2048
      return false if !@call_timeout.nil? && @call_timeout > 300
      return false if !@call_timeout.nil? && @call_timeout < 1
      return false if !@callback_timeout.nil? && @callback_timeout > 25
      return false if !@callback_timeout.nil? && @callback_timeout < 1
      return false if !@priority.nil? && @priority > 5
      return false if !@priority.nil? && @priority < 1
      return false if !@tag.nil? && @tag.to_s.length > 256
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] answer_url Value to be assigned
    def answer_url=(answer_url)
      if answer_url.nil?
        fail ArgumentError, 'answer_url cannot be nil'
      end

      if answer_url.to_s.length > 2048
        fail ArgumentError, 'invalid value for "answer_url", the character length must be smaller than or equal to 2048.'
      end

      @answer_url = answer_url
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
    # @param [Object] answer_fallback_url Value to be assigned
    def answer_fallback_url=(answer_fallback_url)
      if !answer_fallback_url.nil? && answer_fallback_url.to_s.length > 2048
        fail ArgumentError, 'invalid value for "answer_fallback_url", the character length must be smaller than or equal to 2048.'
      end

      @answer_fallback_url = answer_fallback_url
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
    # @param [Object] disconnect_url Value to be assigned
    def disconnect_url=(disconnect_url)
      if !disconnect_url.nil? && disconnect_url.to_s.length > 2048
        fail ArgumentError, 'invalid value for "disconnect_url", the character length must be smaller than or equal to 2048.'
      end

      @disconnect_url = disconnect_url
    end

    # Custom attribute writer method with validation
    # @param [Object] call_timeout Value to be assigned
    def call_timeout=(call_timeout)
      if !call_timeout.nil? && call_timeout > 300
        fail ArgumentError, 'invalid value for "call_timeout", must be smaller than or equal to 300.'
      end

      if !call_timeout.nil? && call_timeout < 1
        fail ArgumentError, 'invalid value for "call_timeout", must be greater than or equal to 1.'
      end

      @call_timeout = call_timeout
    end

    # Custom attribute writer method with validation
    # @param [Object] callback_timeout Value to be assigned
    def callback_timeout=(callback_timeout)
      if !callback_timeout.nil? && callback_timeout > 25
        fail ArgumentError, 'invalid value for "callback_timeout", must be smaller than or equal to 25.'
      end

      if !callback_timeout.nil? && callback_timeout < 1
        fail ArgumentError, 'invalid value for "callback_timeout", must be greater than or equal to 1.'
      end

      @callback_timeout = callback_timeout
    end

    # Custom attribute writer method with validation
    # @param [Object] priority Value to be assigned
    def priority=(priority)
      if !priority.nil? && priority > 5
        fail ArgumentError, 'invalid value for "priority", must be smaller than or equal to 5.'
      end

      if !priority.nil? && priority < 1
        fail ArgumentError, 'invalid value for "priority", must be greater than or equal to 1.'
      end

      @priority = priority
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
          to == o.to &&
          from == o.from &&
          uui == o.uui &&
          application_id == o.application_id &&
          answer_url == o.answer_url &&
          answer_method == o.answer_method &&
          username == o.username &&
          password == o.password &&
          answer_fallback_url == o.answer_fallback_url &&
          answer_fallback_method == o.answer_fallback_method &&
          fallback_username == o.fallback_username &&
          fallback_password == o.fallback_password &&
          disconnect_url == o.disconnect_url &&
          disconnect_method == o.disconnect_method &&
          call_timeout == o.call_timeout &&
          callback_timeout == o.callback_timeout &&
          machine_detection == o.machine_detection &&
          priority == o.priority &&
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
      [to, from, uui, application_id, answer_url, answer_method, username, password, answer_fallback_url, answer_fallback_method, fallback_username, fallback_password, disconnect_url, disconnect_method, call_timeout, callback_timeout, machine_detection, priority, tag].hash
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
