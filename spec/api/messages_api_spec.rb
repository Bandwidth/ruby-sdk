=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.0

=end

require 'spec_helper'
require 'json'

# Unit tests for Bandwidth::MessagesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'MessagesApi' do
  before do
    # run before each test
    @api_instance = Bandwidth::MessagesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MessagesApi' do
    it 'should create an instance of MessagesApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::MessagesApi)
    end
  end

  # unit tests for create_message
  # Create Message
  # Endpoint for sending text messages and picture messages using V2 messaging.
  # @param account_id Your Bandwidth Account ID.
  # @param message_request 
  # @param [Hash] opts the optional parameters
  # @return [Message]
  describe 'create_message test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_messages
  # List Messages
  # Returns a list of messages based on query parameters.
  # @param account_id Your Bandwidth Account ID.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :message_id The ID of the message to search for. Special characters need to be encoded using URL encoding. Message IDs could come in different formats, e.g., 9e0df4ca-b18d-40d7-a59f-82fcdf5ae8e6 and 1589228074636lm4k2je7j7jklbn2 are valid message ID formats. Note that you must include at least one query parameter.
  # @option opts [String] :source_tn The phone number that sent the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. &#39;%2B1919&#39;).
  # @option opts [String] :destination_tn The phone number that received the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. &#39;%2B1919&#39;).
  # @option opts [MessageStatusEnum] :message_status The status of the message. One of RECEIVED QUEUED SENDING SENT FAILED DELIVERED ACCEPTED UNDELIVERED.
  # @option opts [ListMessageDirectionEnum] :message_direction The direction of the message. One of INBOUND OUTBOUND.
  # @option opts [String] :carrier_name The name of the carrier used for this message. Possible values include but are not limited to Verizon and TMobile. Special characters need to be encoded using URL encoding (i.e. AT&amp;T should be passed as AT%26T).
  # @option opts [MessageTypeEnum] :message_type The type of message. Either sms or mms.
  # @option opts [Integer] :error_code The error code of the message.
  # @option opts [String] :from_date_time The start of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days.
  # @option opts [String] :to_date_time The end of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days.
  # @option opts [String] :sort The field and direction to sort by combined with a colon. Direction is either asc or desc.
  # @option opts [String] :page_token A base64 encoded value used for pagination of results.
  # @option opts [Integer] :limit The maximum records requested in search result. Default 100. The sum of limit and after cannot be more than 10000.
  # @return [MessagesList]
  describe 'list_messages test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
