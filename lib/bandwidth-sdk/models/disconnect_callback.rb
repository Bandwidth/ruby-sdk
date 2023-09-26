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
  # The Disconnect event is fired when a call ends, for any reason.
  class DisconnectCallback
    # The event type, value can be one of the following: answer, bridgeComplete, bridgeTargetComplete, conferenceCreated, conferenceRedirect, conferenceMemberJoin, conferenceMemberExit, conferenceCompleted, conferenceRecordingAvailable, disconnect, dtmf, gather, initiate, machineDetectionComplete, recordingComplete, recordingAvailable, redirect, transcriptionAvailable, transferAnswer, transferComplete, transferDisconnect.
    attr_accessor :event_type

    # The approximate UTC date and time when the event was generated by the Bandwidth server, in ISO 8601 format. This may not be exactly the time of event execution.
    attr_accessor :event_time

    # The user account associated with the call.
    attr_accessor :account_id

    # The id of the application associated with the call.
    attr_accessor :application_id

    # The provided identifier of the caller: can be a phone number in E.164 format (e.g. +15555555555) or one of Private, Restricted, Unavailable, or Anonymous.
    attr_accessor :from

    # The phone number that received the call, in E.164 format (e.g. +15555555555).
    attr_accessor :to

    # The call id associated with the event.
    attr_accessor :call_id

    attr_accessor :direction

    # The URL of the call associated with the event.
    attr_accessor :call_url

    # (optional) If call queueing is enabled and this is an outbound call, time the call was queued, in ISO 8601 format.
    attr_accessor :enqueued_time

    # Time the call was started, in ISO 8601 format.
    attr_accessor :start_time

    # Time the call was answered, in ISO 8601 format.
    attr_accessor :answer_time

    # The time that the recording ended in ISO-8601 format
    attr_accessor :end_time

    # Reason the call failed - hangup, busy, timeout, cancel, rejected, callback-error, invalid-bxml, application-error, account-limit, node-capacity-exceeded, error, or unknown.
    attr_accessor :cause

    # Text explaining the reason that caused the call to fail in case of errors.
    attr_accessor :error_message

    # Bandwidth's internal id that references the error event.
    attr_accessor :error_id

    # (optional) The tag specified on call creation. If no tag was specified or it was previously cleared, this field will not be present.
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
        :'event_type' => :'eventType',
        :'event_time' => :'eventTime',
        :'account_id' => :'accountId',
        :'application_id' => :'applicationId',
        :'from' => :'from',
        :'to' => :'to',
        :'call_id' => :'callId',
        :'direction' => :'direction',
        :'call_url' => :'callUrl',
        :'enqueued_time' => :'enqueuedTime',
        :'start_time' => :'startTime',
        :'answer_time' => :'answerTime',
        :'end_time' => :'endTime',
        :'cause' => :'cause',
        :'error_message' => :'errorMessage',
        :'error_id' => :'errorId',
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
        :'event_type' => :'String',
        :'event_time' => :'Time',
        :'account_id' => :'String',
        :'application_id' => :'String',
        :'from' => :'String',
        :'to' => :'String',
        :'call_id' => :'String',
        :'direction' => :'CallDirectionEnum',
        :'call_url' => :'String',
        :'enqueued_time' => :'Time',
        :'start_time' => :'Time',
        :'answer_time' => :'Time',
        :'end_time' => :'Time',
        :'cause' => :'String',
        :'error_message' => :'String',
        :'error_id' => :'String',
        :'tag' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'enqueued_time',
        :'answer_time',
        :'error_message',
        :'error_id',
        :'tag'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::DisconnectCallback` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::DisconnectCallback`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'event_type')
        self.event_type = attributes[:'event_type']
      end

      if attributes.key?(:'event_time')
        self.event_time = attributes[:'event_time']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'application_id')
        self.application_id = attributes[:'application_id']
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      end

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      end

      if attributes.key?(:'call_id')
        self.call_id = attributes[:'call_id']
      end

      if attributes.key?(:'direction')
        self.direction = attributes[:'direction']
      end

      if attributes.key?(:'call_url')
        self.call_url = attributes[:'call_url']
      end

      if attributes.key?(:'enqueued_time')
        self.enqueued_time = attributes[:'enqueued_time']
      end

      if attributes.key?(:'start_time')
        self.start_time = attributes[:'start_time']
      end

      if attributes.key?(:'answer_time')
        self.answer_time = attributes[:'answer_time']
      end

      if attributes.key?(:'end_time')
        self.end_time = attributes[:'end_time']
      end

      if attributes.key?(:'cause')
        self.cause = attributes[:'cause']
      end

      if attributes.key?(:'error_message')
        self.error_message = attributes[:'error_message']
      end

      if attributes.key?(:'error_id')
        self.error_id = attributes[:'error_id']
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
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          event_type == o.event_type &&
          event_time == o.event_time &&
          account_id == o.account_id &&
          application_id == o.application_id &&
          from == o.from &&
          to == o.to &&
          call_id == o.call_id &&
          direction == o.direction &&
          call_url == o.call_url &&
          enqueued_time == o.enqueued_time &&
          start_time == o.start_time &&
          answer_time == o.answer_time &&
          end_time == o.end_time &&
          cause == o.cause &&
          error_message == o.error_message &&
          error_id == o.error_id &&
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
      [event_type, event_time, account_id, application_id, from, to, call_id, direction, call_url, enqueued_time, start_time, answer_time, end_time, cause, error_message, error_id, tag].hash
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
