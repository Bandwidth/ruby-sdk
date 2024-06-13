=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'date'
require 'time'

module Bandwidth
  class CallState
    # The application id associated with the call.
    attr_accessor :application_id

    # The account id associated with the call.
    attr_accessor :account_id

    # The programmable voice API call ID.
    attr_accessor :call_id

    # The A-leg call id, set only if this call is the B-leg of a [`<Transfer>`](/docs/voice/bxml/transfer).
    attr_accessor :parent_call_id

    # The phone number that received the call, in E.164 format (e.g. +15555555555), or if the call was to a SIP URI, the SIP URI.
    attr_accessor :to

    # The phone number that made the call, in E.164 format (e.g. +15555555555).
    attr_accessor :from

    attr_accessor :direction

    # The current state of the call. Current possible values are `queued`, `initiated`, `answered` and `disconnected`. Additional states may be added in the future, so your application must be tolerant of unknown values.
    attr_accessor :state

    # For inbound calls, the Bandwidth STIR/SHAKEN implementation will verify the information provided in the inbound invite request `Identity` header. The verification status is stored in the call state `stirShaken` property as follows.  | Property          | Description | |:------------------|:------------| | verstat | (optional) The verification status indicating whether the verification was successful or not. Possible values are `TN-Verification-Passed` or `TN-Verification-Failed`. | | attestationIndicator | (optional) The attestation level verified by Bandwidth. Possible values are `A` (full), `B` (partial) or `C` (gateway). | | originatingId | (optional) A unique origination identifier. |  Note that these are common properties but that the `stirShaken` object is free form and can contain other key-value pairs.  More information: [Understanding STIR/SHAKEN](https://www.bandwidth.com/regulations/stir-shaken).
    attr_accessor :stir_shaken

    # The value of the `Identity` header from the inbound invite request. Only present for inbound calls and if the account is configured to forward this header.
    attr_accessor :identity

    # The time this call was placed in queue.
    attr_accessor :enqueued_time

    # The time the call was initiated, in ISO 8601 format. `null` if the call is still in your queue.
    attr_accessor :start_time

    # Populated once the call has been answered, with the time in ISO 8601 format.
    attr_accessor :answer_time

    # Populated once the call has ended, with the time in ISO 8601 format.
    attr_accessor :end_time

    # | Cause | Description | |:------|:------------| | `hangup`| One party hung up the call, a [`<Hangup>`](../../bxml/verbs/hangup.md) verb was executed, or there was no more BXML to execute; it indicates that the call ended normally. | | `busy` | Callee was busy. | | `timeout` | Call wasn't answered before the `callTimeout` was reached. | | `cancel` | Call was cancelled by its originator while it was ringing. | | `rejected` | Call was rejected by the callee. | | `callback-error` | BXML callback couldn't be delivered to your callback server. | | `invalid-bxml` | Invalid BXML was returned in response to a callback. | | `application-error` | An unsupported action was tried on the call, e.g. trying to play a .ogg audio. | | `account-limit` | Account rate limits were reached. | | `node-capacity-exceeded` | System maximum capacity was reached. | | `error` | Some error not described in any of the other causes happened on the call. | | `unknown` | Unknown error happened on the call. |  Note: This list is not exhaustive and other values can appear in the future.
    attr_accessor :disconnect_cause

    # Populated only if the call ended with an error, with text explaining the reason.
    attr_accessor :error_message

    # Populated only if the call ended with an error, with a Bandwidth internal id that references the error event.
    attr_accessor :error_id

    # The last time the call had a state update, in ISO 8601 format.
    attr_accessor :last_update

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
        :'to' => :'to',
        :'from' => :'from',
        :'direction' => :'direction',
        :'state' => :'state',
        :'stir_shaken' => :'stirShaken',
        :'identity' => :'identity',
        :'enqueued_time' => :'enqueuedTime',
        :'start_time' => :'startTime',
        :'answer_time' => :'answerTime',
        :'end_time' => :'endTime',
        :'disconnect_cause' => :'disconnectCause',
        :'error_message' => :'errorMessage',
        :'error_id' => :'errorId',
        :'last_update' => :'lastUpdate'
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
        :'to' => :'String',
        :'from' => :'String',
        :'direction' => :'CallDirectionEnum',
        :'state' => :'String',
        :'stir_shaken' => :'Hash<String, String>',
        :'identity' => :'String',
        :'enqueued_time' => :'Time',
        :'start_time' => :'Time',
        :'answer_time' => :'Time',
        :'end_time' => :'Time',
        :'disconnect_cause' => :'String',
        :'error_message' => :'String',
        :'error_id' => :'String',
        :'last_update' => :'Time'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'parent_call_id',
        :'stir_shaken',
        :'identity',
        :'enqueued_time',
        :'start_time',
        :'answer_time',
        :'end_time',
        :'disconnect_cause',
        :'error_message',
        :'error_id',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, 'The input argument (attributes) must be a hash in `Bandwidth::CallState` initialize method'
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::CallState`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
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

      if attributes.key?(:'to')
        self.to = attributes[:'to']
      end

      if attributes.key?(:'from')
        self.from = attributes[:'from']
      end

      if attributes.key?(:'direction')
        self.direction = attributes[:'direction']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'stir_shaken')
        if (value = attributes[:'stir_shaken']).is_a?(Hash)
          self.stir_shaken = value
        end
      end

      if attributes.key?(:'identity')
        self.identity = attributes[:'identity']
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

      if attributes.key?(:'disconnect_cause')
        self.disconnect_cause = attributes[:'disconnect_cause']
      end

      if attributes.key?(:'error_message')
        self.error_message = attributes[:'error_message']
      end

      if attributes.key?(:'error_id')
        self.error_id = attributes[:'error_id']
      end

      if attributes.key?(:'last_update')
        self.last_update = attributes[:'last_update']
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
          to == o.to &&
          from == o.from &&
          direction == o.direction &&
          state == o.state &&
          stir_shaken == o.stir_shaken &&
          identity == o.identity &&
          enqueued_time == o.enqueued_time &&
          start_time == o.start_time &&
          answer_time == o.answer_time &&
          end_time == o.end_time &&
          disconnect_cause == o.disconnect_cause &&
          error_message == o.error_message &&
          error_id == o.error_id &&
          last_update == o.last_update
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [application_id, account_id, call_id, parent_call_id, to, from, direction, state, stir_shaken, identity, enqueued_time, start_time, answer_time, end_time, disconnect_cause, error_message, error_id, last_update].hash
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
