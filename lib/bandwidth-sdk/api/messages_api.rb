=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.1.0

=end

require 'cgi'

module Bandwidth
  class MessagesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Message
    # Endpoint for sending text messages and picture messages using V2 messaging.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param message_request [MessageRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Message]
    def create_message(account_id, message_request, opts = {})
      data, _status_code, _headers = create_message_with_http_info(account_id, message_request, opts)
      data
    end

    # Create Message
    # Endpoint for sending text messages and picture messages using V2 messaging.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param message_request [MessageRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Message, Integer, Hash)>] Message data, response status code and response headers
    def create_message_with_http_info(account_id, message_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MessagesApi.create_message ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling MessagesApi.create_message"
      end
      # verify the required parameter 'message_request' is set
      if @api_client.config.client_side_validation && message_request.nil?
        fail ArgumentError, "Missing the required parameter 'message_request' when calling MessagesApi.create_message"
      end
      # resource path
      local_var_path = '/users/{accountId}/messages'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(message_request)

      # return_type
      return_type = opts[:debug_return_type] || 'Message'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"MessagesApi.create_message",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MessagesApi#create_message\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Messages
    # Returns a list of messages based on query parameters.
    # @param account_id [String] Your Bandwidth Account ID.
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
    # @option opts [String] :campaign_id The campaign ID of the message.
    # @option opts [String] :sort The field and direction to sort by combined with a colon. Direction is either asc or desc.
    # @option opts [String] :page_token A base64 encoded value used for pagination of results.
    # @option opts [Integer] :limit The maximum records requested in search result. Default 100. The sum of limit and after cannot be more than 10000.
    # @option opts [Boolean] :limit_total_count When set to true, the response&#39;s totalCount field will have a maximum value of 10,000. When set to false, or excluded, this will give an accurate totalCount of all messages that match the provided filters. If you are experiencing latency, try using this parameter to limit your results.
    # @return [MessagesList]
    def list_messages(account_id, opts = {})
      data, _status_code, _headers = list_messages_with_http_info(account_id, opts)
      data
    end

    # List Messages
    # Returns a list of messages based on query parameters.
    # @param account_id [String] Your Bandwidth Account ID.
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
    # @option opts [String] :campaign_id The campaign ID of the message.
    # @option opts [String] :sort The field and direction to sort by combined with a colon. Direction is either asc or desc.
    # @option opts [String] :page_token A base64 encoded value used for pagination of results.
    # @option opts [Integer] :limit The maximum records requested in search result. Default 100. The sum of limit and after cannot be more than 10000.
    # @option opts [Boolean] :limit_total_count When set to true, the response&#39;s totalCount field will have a maximum value of 10,000. When set to false, or excluded, this will give an accurate totalCount of all messages that match the provided filters. If you are experiencing latency, try using this parameter to limit your results.
    # @return [Array<(MessagesList, Integer, Hash)>] MessagesList data, response status code and response headers
    def list_messages_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MessagesApi.list_messages ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling MessagesApi.list_messages"
      end
      # resource path
      local_var_path = '/users/{accountId}/messages'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'messageId'] = opts[:'message_id'] if !opts[:'message_id'].nil?
      query_params[:'sourceTn'] = opts[:'source_tn'] if !opts[:'source_tn'].nil?
      query_params[:'destinationTn'] = opts[:'destination_tn'] if !opts[:'destination_tn'].nil?
      query_params[:'messageStatus'] = opts[:'message_status'] if !opts[:'message_status'].nil?
      query_params[:'messageDirection'] = opts[:'message_direction'] if !opts[:'message_direction'].nil?
      query_params[:'carrierName'] = opts[:'carrier_name'] if !opts[:'carrier_name'].nil?
      query_params[:'messageType'] = opts[:'message_type'] if !opts[:'message_type'].nil?
      query_params[:'errorCode'] = opts[:'error_code'] if !opts[:'error_code'].nil?
      query_params[:'fromDateTime'] = opts[:'from_date_time'] if !opts[:'from_date_time'].nil?
      query_params[:'toDateTime'] = opts[:'to_date_time'] if !opts[:'to_date_time'].nil?
      query_params[:'campaignId'] = opts[:'campaign_id'] if !opts[:'campaign_id'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?
      query_params[:'pageToken'] = opts[:'page_token'] if !opts[:'page_token'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'limitTotalCount'] = opts[:'limit_total_count'] if !opts[:'limit_total_count'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'MessagesList'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"MessagesApi.list_messages",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MessagesApi#list_messages\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
