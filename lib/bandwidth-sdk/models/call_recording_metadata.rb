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
  class CallRecordingMetadata
    # The id of the application associated with the call.
    attr_accessor :application_id

    # The user account associated with the call.
    attr_accessor :account_id

    # The call id associated with the event.
    attr_accessor :call_id

    # (optional) If the event is related to the B leg of a <Transfer>, the call id of the original call leg that executed the <Transfer>. Otherwise, this field will not be present.
    attr_accessor :parent_call_id

    # The unique ID of this recording
    attr_accessor :recording_id

    # The phone number that received the call, in E.164 format (e.g. +15555555555).
    attr_accessor :to

    # The provided identifier of the caller: can be a phone number in E.164 format (e.g. +15555555555) or one of Private, Restricted, Unavailable, or Anonymous.
    attr_accessor :from

    # The phone number used as the from field of the B-leg call, in E.164 format (e.g. +15555555555) or one of Restricted, Anonymous, Private, or Unavailable.
    attr_accessor :transfer_caller_id

    # The phone number used as the to field of the B-leg call, in E.164 format (e.g. +15555555555).
    attr_accessor :transfer_to

    # The duration of the recording in ISO-8601 format
    attr_accessor :duration

    attr_accessor :direction

    # Always `1` for conference recordings; multi-channel recordings are not supported on conferences.
    attr_accessor :channels

    # Time the call was started, in ISO 8601 format.
    attr_accessor :start_time

    # The time that the recording ended in ISO-8601 format
    attr_accessor :end_time

    attr_accessor :file_format

    # The current status of the process. For recording, current possible values are 'processing', 'partial', 'complete', 'deleted', and 'error'. For transcriptions, current possible values are 'none', 'processing', 'available', 'error', 'timeout', 'file-size-too-big', and 'file-size-too-small'. Additional states may be added in the future, so your application must be tolerant of unknown values.
    attr_accessor :status

    # The URL that can be used to download the recording. Only present if the recording is finished and may be downloaded.
    attr_accessor :media_url

    attr_accessor :transcription

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
        :'parent_call_id' => :'parentCallId',
        :'recording_id' => :'recordingId',
        :'to' => :'to',
        :'from' => :'from',
        :'transfer_caller_id' => :'transferCallerId',
        :'transfer_to' => :'transferTo',
        :'duration' => :'duration',
        :'direction' => :'direction',
        :'channels' => :'channels',
        :'start_time' => :'startTime',
        :'end_time' => :'endTime',
        :'file_format' => :'fileFormat',
        :'status' => :'status',
        :'media_url' => :'mediaUrl',
        :'transcription' => :'transcription'
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
        :'parent_call_id' => :'String',
        :'recording_id' => :'String',
        :'to' => :'String',
        :'from' => :'String',
        :'transfer_caller_id' => :'String',
        :'transfer_to' => :'String',
        :'duration' => :'String',
        :'direction' => :'CallDirectionEnum',
        :'channels' => :'Integer',
        :'start_time' => :'Time',
        :'end_time' => :'Time',
        :'file_format' => :'FileFormatEnum',
        :'status' => :'String',
        :'media_url' => :'String',
        :'transcription' => :'RecordingTranscriptionMetadata'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'media_url',
        :'transcription'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::CallRecordingMetadata` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::CallRecordingMetadata`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
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

      if attributes.key?(:'parent_call_id')
        self.parent_call_id = attributes[:'parent_call_id']
      end

      if attributes.key?(:'recording_id')
        self.recording_id = attributes[:'recording_id']
      end

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      end

      if attributes.key?(:'transfer_caller_id')
        self.transfer_caller_id = attributes[:'transfer_caller_id']
      end

      if attributes.key?(:'transfer_to')
        self.transfer_to = attributes[:'transfer_to']
      end

      if attributes.key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.key?(:'direction')
        self.direction = attributes[:'direction']
      end

      if attributes.key?(:'channels')
        self.channels = attributes[:'channels']
      end

      if attributes.key?(:'start_time')
        self.start_time = attributes[:'start_time']
      end

      if attributes.key?(:'end_time')
        self.end_time = attributes[:'end_time']
      end

      if attributes.key?(:'file_format')
        self.file_format = attributes[:'file_format']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'media_url')
        self.media_url = attributes[:'media_url']
      end

      if attributes.key?(:'transcription')
        self.transcription = attributes[:'transcription']
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
          application_id == o.application_id &&
          account_id == o.account_id &&
          call_id == o.call_id &&
          parent_call_id == o.parent_call_id &&
          recording_id == o.recording_id &&
          to == o.to &&
          from == o.from &&
          transfer_caller_id == o.transfer_caller_id &&
          transfer_to == o.transfer_to &&
          duration == o.duration &&
          direction == o.direction &&
          channels == o.channels &&
          start_time == o.start_time &&
          end_time == o.end_time &&
          file_format == o.file_format &&
          status == o.status &&
          media_url == o.media_url &&
          transcription == o.transcription
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [application_id, account_id, call_id, parent_call_id, recording_id, to, from, transfer_caller_id, transfer_to, duration, direction, channels, start_time, end_time, file_format, status, media_url, transcription].hash
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
