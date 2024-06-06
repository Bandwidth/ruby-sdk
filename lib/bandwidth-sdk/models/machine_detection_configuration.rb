=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.0

=end

require 'date'
require 'time'

module Bandwidth
  # The machine detection request used to perform <a href='/docs/voice/guides/machineDetection'>machine detection</a> on the call. Currently, there is an issue where decimal values are not getting processed correctly. Please use whole number values. We are working to resolve this issue. Please contact Bandwidth Support if you need more information.
  class MachineDetectionConfiguration
    attr_accessor :mode

    # The timeout used for the whole operation, in seconds. If no result is determined in this period, a callback with a `timeout` result is sent.
    attr_accessor :detection_timeout

    # If no speech is detected in this period, a callback with a 'silence' result is sent.
    attr_accessor :silence_timeout

    # When speech has ended and a result couldn't be determined based on the audio content itself, this value is used to determine if the speaker is a machine based on the speech duration. If the length of the speech detected is greater than or equal to this threshold, the result will be 'answering-machine'. If the length of speech detected is below this threshold, the result will be 'human'.
    attr_accessor :speech_threshold

    # Amount of silence (in seconds) before assuming the callee has finished speaking.
    attr_accessor :speech_end_threshold

    # When an answering machine is detected, the amount of silence (in seconds) before assuming the message has finished playing.  If not provided it will default to the speechEndThreshold value.
    attr_accessor :machine_speech_end_threshold

    # If set to 'true' and if an answering machine is detected, the 'answering-machine' callback will be delayed until the machine is done speaking, or an end of message tone is detected, or until the 'detectionTimeout' is exceeded. If false, the 'answering-machine' result is sent immediately.
    attr_accessor :delay_result

    # The URL to send the 'machineDetectionComplete' webhook when the detection is completed. Only for 'async' mode.
    attr_accessor :callback_url

    attr_accessor :callback_method

    # Basic auth username.
    attr_accessor :username

    # Basic auth password.
    attr_accessor :password

    # A fallback URL which, if provided, will be used to retry the machine detection complete webhook delivery in case `callbackUrl` fails to respond
    attr_accessor :fallback_url

    attr_accessor :fallback_method

    # Basic auth username.
    attr_accessor :fallback_username

    # Basic auth password.
    attr_accessor :fallback_password

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
        :'mode' => :'mode',
        :'detection_timeout' => :'detectionTimeout',
        :'silence_timeout' => :'silenceTimeout',
        :'speech_threshold' => :'speechThreshold',
        :'speech_end_threshold' => :'speechEndThreshold',
        :'machine_speech_end_threshold' => :'machineSpeechEndThreshold',
        :'delay_result' => :'delayResult',
        :'callback_url' => :'callbackUrl',
        :'callback_method' => :'callbackMethod',
        :'username' => :'username',
        :'password' => :'password',
        :'fallback_url' => :'fallbackUrl',
        :'fallback_method' => :'fallbackMethod',
        :'fallback_username' => :'fallbackUsername',
        :'fallback_password' => :'fallbackPassword'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'mode' => :'MachineDetectionModeEnum',
        :'detection_timeout' => :'Float',
        :'silence_timeout' => :'Float',
        :'speech_threshold' => :'Float',
        :'speech_end_threshold' => :'Float',
        :'machine_speech_end_threshold' => :'Float',
        :'delay_result' => :'Boolean',
        :'callback_url' => :'String',
        :'callback_method' => :'CallbackMethodEnum',
        :'username' => :'String',
        :'password' => :'String',
        :'fallback_url' => :'String',
        :'fallback_method' => :'CallbackMethodEnum',
        :'fallback_username' => :'String',
        :'fallback_password' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'detection_timeout',
        :'silence_timeout',
        :'speech_threshold',
        :'speech_end_threshold',
        :'machine_speech_end_threshold',
        :'delay_result',
        :'callback_url',
        :'callback_method',
        :'username',
        :'password',
        :'fallback_url',
        :'fallback_method',
        :'fallback_username',
        :'fallback_password'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::MachineDetectionConfiguration` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::MachineDetectionConfiguration`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'mode')
        self.mode = attributes[:'mode']
      else
        self.mode = 'async'
      end

      if attributes.key?(:'detection_timeout')
        self.detection_timeout = attributes[:'detection_timeout']
      else
        self.detection_timeout = 15
      end

      if attributes.key?(:'silence_timeout')
        self.silence_timeout = attributes[:'silence_timeout']
      else
        self.silence_timeout = 10
      end

      if attributes.key?(:'speech_threshold')
        self.speech_threshold = attributes[:'speech_threshold']
      else
        self.speech_threshold = 10
      end

      if attributes.key?(:'speech_end_threshold')
        self.speech_end_threshold = attributes[:'speech_end_threshold']
      else
        self.speech_end_threshold = 5
      end

      if attributes.key?(:'machine_speech_end_threshold')
        self.machine_speech_end_threshold = attributes[:'machine_speech_end_threshold']
      end

      if attributes.key?(:'delay_result')
        self.delay_result = attributes[:'delay_result']
      else
        self.delay_result = false
      end

      if attributes.key?(:'callback_url')
        self.callback_url = attributes[:'callback_url']
      end

      if attributes.key?(:'callback_method')
        self.callback_method = attributes[:'callback_method']
      else
        self.callback_method = 'POST'
      end

      if attributes.key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'fallback_url')
        self.fallback_url = attributes[:'fallback_url']
      end

      if attributes.key?(:'fallback_method')
        self.fallback_method = attributes[:'fallback_method']
      else
        self.fallback_method = 'POST'
      end

      if attributes.key?(:'fallback_username')
        self.fallback_username = attributes[:'fallback_username']
      end

      if attributes.key?(:'fallback_password')
        self.fallback_password = attributes[:'fallback_password']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@callback_url.nil? && @callback_url.to_s.length > 2048
        invalid_properties.push('invalid value for "callback_url", the character length must be smaller than or equal to 2048.')
      end

      if !@username.nil? && @username.to_s.length > 1024
        invalid_properties.push('invalid value for "username", the character length must be smaller than or equal to 1024.')
      end

      if !@password.nil? && @password.to_s.length > 1024
        invalid_properties.push('invalid value for "password", the character length must be smaller than or equal to 1024.')
      end

      if !@fallback_url.nil? && @fallback_url.to_s.length > 2048
        invalid_properties.push('invalid value for "fallback_url", the character length must be smaller than or equal to 2048.')
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
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@callback_url.nil? && @callback_url.to_s.length > 2048
      return false if !@username.nil? && @username.to_s.length > 1024
      return false if !@password.nil? && @password.to_s.length > 1024
      return false if !@fallback_url.nil? && @fallback_url.to_s.length > 2048
      return false if !@fallback_username.nil? && @fallback_username.to_s.length > 1024
      return false if !@fallback_password.nil? && @fallback_password.to_s.length > 1024
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] callback_url Value to be assigned
    def callback_url=(callback_url)
      if !callback_url.nil? && callback_url.to_s.length > 2048
        fail ArgumentError, 'invalid value for "callback_url", the character length must be smaller than or equal to 2048.'
      end

      @callback_url = callback_url
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
    # @param [Object] fallback_url Value to be assigned
    def fallback_url=(fallback_url)
      if !fallback_url.nil? && fallback_url.to_s.length > 2048
        fail ArgumentError, 'invalid value for "fallback_url", the character length must be smaller than or equal to 2048.'
      end

      @fallback_url = fallback_url
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
          mode == o.mode &&
          detection_timeout == o.detection_timeout &&
          silence_timeout == o.silence_timeout &&
          speech_threshold == o.speech_threshold &&
          speech_end_threshold == o.speech_end_threshold &&
          machine_speech_end_threshold == o.machine_speech_end_threshold &&
          delay_result == o.delay_result &&
          callback_url == o.callback_url &&
          callback_method == o.callback_method &&
          username == o.username &&
          password == o.password &&
          fallback_url == o.fallback_url &&
          fallback_method == o.fallback_method &&
          fallback_username == o.fallback_username &&
          fallback_password == o.fallback_password
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [mode, detection_timeout, silence_timeout, speech_threshold, speech_end_threshold, machine_speech_end_threshold, delay_result, callback_url, callback_method, username, password, fallback_url, fallback_method, fallback_username, fallback_password].hash
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
