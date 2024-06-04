=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.0

=end

require 'cgi'

module Bandwidth
  class CallsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Call
    # Creates an outbound phone call.  All calls are initially queued. Your outbound calls will initiated at a specific dequeueing rate, enabling your application to \"fire and forget\" when creating calls. Queued calls may not be modified until they are dequeued and placed, but may be removed from your queue on demand.  <b>Please note:</b> Calls submitted to your queue will be placed approximately in order, but exact ordering is not guaranteed.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param create_call [CreateCall] JSON object containing information to create an outbound call
    # @param [Hash] opts the optional parameters
    # @return [CreateCallResponse]
    def create_call(account_id, create_call, opts = {})
      data, _status_code, _headers = create_call_with_http_info(account_id, create_call, opts)
      data
    end

    # Create Call
    # Creates an outbound phone call.  All calls are initially queued. Your outbound calls will initiated at a specific dequeueing rate, enabling your application to \&quot;fire and forget\&quot; when creating calls. Queued calls may not be modified until they are dequeued and placed, but may be removed from your queue on demand.  &lt;b&gt;Please note:&lt;/b&gt; Calls submitted to your queue will be placed approximately in order, but exact ordering is not guaranteed.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param create_call [CreateCall] JSON object containing information to create an outbound call
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateCallResponse, Integer, Hash)>] CreateCallResponse data, response status code and response headers
    def create_call_with_http_info(account_id, create_call, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CallsApi.create_call ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling CallsApi.create_call"
      end
      # verify the required parameter 'create_call' is set
      if @api_client.config.client_side_validation && create_call.nil?
        fail ArgumentError, "Missing the required parameter 'create_call' when calling CallsApi.create_call"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(create_call)

      # return_type
      return_type = opts[:debug_return_type] || 'CreateCallResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"CallsApi.create_call",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CallsApi#create_call\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Call State Information
    # Retrieve the current state of a specific call. This information is near-realtime, so it may take a few minutes for your call to be accessible using this endpoint.  **Note**: Call information is kept for 7 days after the calls are hung up. If you attempt to retrieve information for a call that is older than 7 days, you will get an HTTP 404 response.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param [Hash] opts the optional parameters
    # @return [CallState]
    def get_call_state(account_id, call_id, opts = {})
      data, _status_code, _headers = get_call_state_with_http_info(account_id, call_id, opts)
      data
    end

    # Get Call State Information
    # Retrieve the current state of a specific call. This information is near-realtime, so it may take a few minutes for your call to be accessible using this endpoint.  **Note**: Call information is kept for 7 days after the calls are hung up. If you attempt to retrieve information for a call that is older than 7 days, you will get an HTTP 404 response.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CallState, Integer, Hash)>] CallState data, response status code and response headers
    def get_call_state_with_http_info(account_id, call_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CallsApi.get_call_state ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling CallsApi.get_call_state"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling CallsApi.get_call_state"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CallState'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"CallsApi.get_call_state",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CallsApi#get_call_state\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Calls
    # Returns a max of 10000 calls, sorted by `createdTime` from oldest to newest.  **NOTE:** If the number of calls in the account is bigger than `pageSize`, a `Link` header (with format `<{url}>; rel=\"next\"`) will be returned in the response. The url can be used to retrieve the next page of call records. Also, call information is kept for 7 days after the calls are hung up. If you attempt to retrieve information for a call that is older than 7 days, you will get an empty array [] in response.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :to Filter results by the &#x60;to&#x60; field.
    # @option opts [String] :from Filter results by the &#x60;from&#x60; field.
    # @option opts [String] :min_start_time Filter results to calls which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_start_time Filter results to calls which have a &#x60;startTime&#x60; before or including &#x60;maxStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :disconnect_cause Filter results to calls with specified call Disconnect Cause.
    # @option opts [Integer] :page_size Specifies the max number of calls that will be returned. (default to 1000)
    # @option opts [String] :page_token Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description.
    # @return [Array<CallState>]
    def list_calls(account_id, opts = {})
      data, _status_code, _headers = list_calls_with_http_info(account_id, opts)
      data
    end

    # Get Calls
    # Returns a max of 10000 calls, sorted by &#x60;createdTime&#x60; from oldest to newest.  **NOTE:** If the number of calls in the account is bigger than &#x60;pageSize&#x60;, a &#x60;Link&#x60; header (with format &#x60;&lt;{url}&gt;; rel&#x3D;\&quot;next\&quot;&#x60;) will be returned in the response. The url can be used to retrieve the next page of call records. Also, call information is kept for 7 days after the calls are hung up. If you attempt to retrieve information for a call that is older than 7 days, you will get an empty array [] in response.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :to Filter results by the &#x60;to&#x60; field.
    # @option opts [String] :from Filter results by the &#x60;from&#x60; field.
    # @option opts [String] :min_start_time Filter results to calls which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_start_time Filter results to calls which have a &#x60;startTime&#x60; before or including &#x60;maxStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :disconnect_cause Filter results to calls with specified call Disconnect Cause.
    # @option opts [Integer] :page_size Specifies the max number of calls that will be returned. (default to 1000)
    # @option opts [String] :page_token Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description.
    # @return [Array<(Array<CallState>, Integer, Hash)>] Array<CallState> data, response status code and response headers
    def list_calls_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CallsApi.list_calls ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling CallsApi.list_calls"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 10000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling CallsApi.list_calls, must be smaller than or equal to 10000.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling CallsApi.list_calls, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/accounts/{accountId}/calls'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'minStartTime'] = opts[:'min_start_time'] if !opts[:'min_start_time'].nil?
      query_params[:'maxStartTime'] = opts[:'max_start_time'] if !opts[:'max_start_time'].nil?
      query_params[:'disconnectCause'] = opts[:'disconnect_cause'] if !opts[:'disconnect_cause'].nil?
      query_params[:'pageSize'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'pageToken'] = opts[:'page_token'] if !opts[:'page_token'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<CallState>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"CallsApi.list_calls",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CallsApi#list_calls\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Call
    # Interrupts and redirects a call to a different URL that should return a BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param update_call [UpdateCall] JSON object containing information to redirect an existing call to a new BXML document
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_call(account_id, call_id, update_call, opts = {})
      update_call_with_http_info(account_id, call_id, update_call, opts)
      nil
    end

    # Update Call
    # Interrupts and redirects a call to a different URL that should return a BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param update_call [UpdateCall] JSON object containing information to redirect an existing call to a new BXML document
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_call_with_http_info(account_id, call_id, update_call, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CallsApi.update_call ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling CallsApi.update_call"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling CallsApi.update_call"
      end
      # verify the required parameter 'update_call' is set
      if @api_client.config.client_side_validation && update_call.nil?
        fail ArgumentError, "Missing the required parameter 'update_call' when calling CallsApi.update_call"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_call)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"CallsApi.update_call",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CallsApi#update_call\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Call BXML
    # Interrupts and replaces an active call's BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param body [String] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_call_bxml(account_id, call_id, body, opts = {})
      update_call_bxml_with_http_info(account_id, call_id, body, opts)
      nil
    end

    # Update Call BXML
    # Interrupts and replaces an active call&#39;s BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param body [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_call_bxml_with_http_info(account_id, call_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CallsApi.update_call_bxml ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling CallsApi.update_call_bxml"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling CallsApi.update_call_bxml"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CallsApi.update_call_bxml"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/bxml'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/xml'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"CallsApi.update_call_bxml",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CallsApi#update_call_bxml\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
