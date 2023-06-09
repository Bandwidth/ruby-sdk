=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.6.0

=end

require 'date'
require 'time'

module Bandwidth
  class ListMessageItem
    # The message id
    attr_accessor :message_id

    # The account id associated with this message.
    attr_accessor :account_id

    # The source phone number of the message.
    attr_accessor :source_tn

    # The recipient phone number of the message.
    attr_accessor :destination_tn

    attr_accessor :message_status

    attr_accessor :message_direction

    attr_accessor :message_type

    # The number of segments the message was sent as.
    attr_accessor :segment_count

    # The numeric error code of the message.
    attr_accessor :error_code

    # The ISO 8601 datetime of the message.
    attr_accessor :receive_time

    # The name of the carrier. Not currently supported for MMS coming soon.
    attr_accessor :carrier_name

    # The size of the message including message content and headers.
    attr_accessor :message_size

    # The length of the message content.
    attr_accessor :message_length

    # The number of attachments the message has.
    attr_accessor :attachment_count

    # The number of recipients the message has.
    attr_accessor :recipient_count

    # The campaign class of the message if it has one.
    attr_accessor :campaign_class

    # The campaign ID of the message if it has one.
    attr_accessor :campaign_id

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
        :'message_id' => :'messageId',
        :'account_id' => :'accountId',
        :'source_tn' => :'sourceTn',
        :'destination_tn' => :'destinationTn',
        :'message_status' => :'messageStatus',
        :'message_direction' => :'messageDirection',
        :'message_type' => :'messageType',
        :'segment_count' => :'segmentCount',
        :'error_code' => :'errorCode',
        :'receive_time' => :'receiveTime',
        :'carrier_name' => :'carrierName',
        :'message_size' => :'messageSize',
        :'message_length' => :'messageLength',
        :'attachment_count' => :'attachmentCount',
        :'recipient_count' => :'recipientCount',
        :'campaign_class' => :'campaignClass',
        :'campaign_id' => :'campaignId'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'message_id' => :'String',
        :'account_id' => :'String',
        :'source_tn' => :'String',
        :'destination_tn' => :'String',
        :'message_status' => :'MessageStatusEnum',
        :'message_direction' => :'ListMessageDirectionEnum',
        :'message_type' => :'MessageTypeEnum',
        :'segment_count' => :'Integer',
        :'error_code' => :'Integer',
        :'receive_time' => :'String',
        :'carrier_name' => :'String',
        :'message_size' => :'Integer',
        :'message_length' => :'Integer',
        :'attachment_count' => :'Integer',
        :'recipient_count' => :'Integer',
        :'campaign_class' => :'String',
        :'campaign_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'carrier_name',
        :'message_size',
        :'attachment_count',
        :'recipient_count',
        :'campaign_class',
        :'campaign_id'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Bandwidth::ListMessageItem` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Bandwidth::ListMessageItem`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'message_id')
        self.message_id = attributes[:'message_id']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'source_tn')
        self.source_tn = attributes[:'source_tn']
      end

      if attributes.key?(:'destination_tn')
        self.destination_tn = attributes[:'destination_tn']
      end

      if attributes.key?(:'message_status')
        self.message_status = attributes[:'message_status']
      end

      if attributes.key?(:'message_direction')
        self.message_direction = attributes[:'message_direction']
      end

      if attributes.key?(:'message_type')
        self.message_type = attributes[:'message_type']
      end

      if attributes.key?(:'segment_count')
        self.segment_count = attributes[:'segment_count']
      end

      if attributes.key?(:'error_code')
        self.error_code = attributes[:'error_code']
      end

      if attributes.key?(:'receive_time')
        self.receive_time = attributes[:'receive_time']
      end

      if attributes.key?(:'carrier_name')
        self.carrier_name = attributes[:'carrier_name']
      end

      if attributes.key?(:'message_size')
        self.message_size = attributes[:'message_size']
      end

      if attributes.key?(:'message_length')
        self.message_length = attributes[:'message_length']
      end

      if attributes.key?(:'attachment_count')
        self.attachment_count = attributes[:'attachment_count']
      end

      if attributes.key?(:'recipient_count')
        self.recipient_count = attributes[:'recipient_count']
      end

      if attributes.key?(:'campaign_class')
        self.campaign_class = attributes[:'campaign_class']
      end

      if attributes.key?(:'campaign_id')
        self.campaign_id = attributes[:'campaign_id']
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
          message_id == o.message_id &&
          account_id == o.account_id &&
          source_tn == o.source_tn &&
          destination_tn == o.destination_tn &&
          message_status == o.message_status &&
          message_direction == o.message_direction &&
          message_type == o.message_type &&
          segment_count == o.segment_count &&
          error_code == o.error_code &&
          receive_time == o.receive_time &&
          carrier_name == o.carrier_name &&
          message_size == o.message_size &&
          message_length == o.message_length &&
          attachment_count == o.attachment_count &&
          recipient_count == o.recipient_count &&
          campaign_class == o.campaign_class &&
          campaign_id == o.campaign_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [message_id, account_id, source_tn, destination_tn, message_status, message_direction, message_type, segment_count, error_code, receive_time, carrier_name, message_size, message_length, attachment_count, recipient_count, campaign_class, campaign_id].hash
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
