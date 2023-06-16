=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0

=end

require 'cgi'

module Bandwidth
  class MFAApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Messaging Authentication Code
    # Send an MFA code via text message (SMS).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param code_request [CodeRequest] MFA code request body.
    # @param [Hash] opts the optional parameters
    # @return [MessagingCodeResponse]
    def generate_messaging_code(account_id, code_request, opts = {})
      data, _status_code, _headers = generate_messaging_code_with_http_info(account_id, code_request, opts)
      data
    end

    # Messaging Authentication Code
    # Send an MFA code via text message (SMS).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param code_request [CodeRequest] MFA code request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(MessagingCodeResponse, Integer, Hash)>] MessagingCodeResponse data, response status code and response headers
    def generate_messaging_code_with_http_info(account_id, code_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MFAApi.generate_messaging_code ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling MFAApi.generate_messaging_code"
      end
      # verify the required parameter 'code_request' is set
      if @api_client.config.client_side_validation && code_request.nil?
        fail ArgumentError, "Missing the required parameter 'code_request' when calling MFAApi.generate_messaging_code"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/code/messaging'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(code_request)

      # return_type
      return_type = opts[:debug_return_type] || 'MessagingCodeResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"MFAApi.generate_messaging_code",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MFAApi#generate_messaging_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Voice Authentication Code
    # Send an MFA Code via a phone call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param code_request [CodeRequest] MFA code request body.
    # @param [Hash] opts the optional parameters
    # @return [VoiceCodeResponse]
    def generate_voice_code(account_id, code_request, opts = {})
      data, _status_code, _headers = generate_voice_code_with_http_info(account_id, code_request, opts)
      data
    end

    # Voice Authentication Code
    # Send an MFA Code via a phone call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param code_request [CodeRequest] MFA code request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(VoiceCodeResponse, Integer, Hash)>] VoiceCodeResponse data, response status code and response headers
    def generate_voice_code_with_http_info(account_id, code_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MFAApi.generate_voice_code ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling MFAApi.generate_voice_code"
      end
      # verify the required parameter 'code_request' is set
      if @api_client.config.client_side_validation && code_request.nil?
        fail ArgumentError, "Missing the required parameter 'code_request' when calling MFAApi.generate_voice_code"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/code/voice'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(code_request)

      # return_type
      return_type = opts[:debug_return_type] || 'VoiceCodeResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"MFAApi.generate_voice_code",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MFAApi#generate_voice_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Verify Authentication Code
    # Verify a previously sent MFA code.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param verify_code_request [VerifyCodeRequest] MFA code verify request body.
    # @param [Hash] opts the optional parameters
    # @return [VerifyCodeResponse]
    def verify_code(account_id, verify_code_request, opts = {})
      data, _status_code, _headers = verify_code_with_http_info(account_id, verify_code_request, opts)
      data
    end

    # Verify Authentication Code
    # Verify a previously sent MFA code.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param verify_code_request [VerifyCodeRequest] MFA code verify request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(VerifyCodeResponse, Integer, Hash)>] VerifyCodeResponse data, response status code and response headers
    def verify_code_with_http_info(account_id, verify_code_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MFAApi.verify_code ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling MFAApi.verify_code"
      end
      # verify the required parameter 'verify_code_request' is set
      if @api_client.config.client_side_validation && verify_code_request.nil?
        fail ArgumentError, "Missing the required parameter 'verify_code_request' when calling MFAApi.verify_code"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/code/verify'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(verify_code_request)

      # return_type
      return_type = opts[:debug_return_type] || 'VerifyCodeResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"MFAApi.verify_code",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MFAApi#verify_code\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
