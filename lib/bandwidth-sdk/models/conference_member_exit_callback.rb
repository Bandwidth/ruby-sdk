=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.0

=end

require 'date'
require 'time'

module Bandwidth
  # The Conference Member Exit event is fired whenever a caller exits a conference that specified a callbackUrl. The response may be either empty or a BXML document. Only the following verbs are valid for conferences: PlayAudio, SpeakSentence, StartRecording, StopRecording, PauseRecording, ResumeRecording. Audio verbs will be heard by all members of the conference. Recordings capture audio from all members who are not muted or on hold, as well as any audio verbs that are played into the conference.
  class ConferenceMemberExitCallback
    # The event type, value can be one of the following: answer, bridgeComplete, bridgeTargetComplete, conferenceCreated, conferenceRedirect, conferenceMemberJoin, conferenceMemberExit, conferenceCompleted, conferenceRecordingAvailable, disconnect, dtmf, gather, initiate, machineDetectionComplete, recordingComplete, recordingAvailable, redirect, transcriptionAvailable, transferAnswer, transferComplete, transferDisconnect.
    attr_accessor :event_type

    # The approximate UTC date and time when the event was generated by the Bandwidth server, in ISO 8601 format. This may not be exactly the time of event execution.
    attr_accessor :event_time

    # The unique, Bandwidth-generated ID of the conference that was recorded
    attr_accessor :conference_id

    # The user-specified name of the conference that was recorded
    attr_accessor :name

    # The provided identifier of the caller: can be a phone number in E.164 format (e.g. +15555555555) or one of Private, Restricted, Unavailable, or Anonymous.
    attr_accessor :from

    # The phone number that received the call, in E.164 format (e.g. +15555555555).
    attr_accessor :to

    # The call id associated with the event.
    attr_accessor :call_id

    # (optional) The tag specified on call creation. If no tag was specified or it was previously cleared, this field will not be present.
    attr_accessor :tag

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'event_type' => :'eventType',
        :'event_time' => :'eventTime',
        :'conference_id' => :'conferenceId',
        :'name' => :'name',
        :'from' => :'from',
        :'to' => :'to',
        :'call_id' => :'callId',
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
        :'event_time' => :'String',
        :'conference_id' => :'String',
        :'name' => :'String',
        :'from' => :'String',
        :'to' => :'String',
        :'call_id' => :'String',
        :'tag' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'tag'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Bandwidth::ConferenceMemberExitCallback` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::ConferenceMemberExitCallback`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'event_type')
        self.event_type = attributes[:'event_type']
      end

      if attributes.key?(:'event_time')
        self.event_time = attributes[:'event_time']
      end

      if attributes.key?(:'conference_id')
        self.conference_id = attributes[:'conference_id']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
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

      if attributes.key?(:'tag')
        self.tag = attributes[:'tag']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          event_type == o.event_type &&
          event_time == o.event_time &&
          conference_id == o.conference_id &&
          name == o.name &&
          from == o.from &&
          to == o.to &&
          call_id == o.call_id &&
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
      [event_type, event_time, conference_id, name, from, to, call_id, tag].hash
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
