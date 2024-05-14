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
  class PhoneNumberLookupApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Lookup
    # Create a Phone Number Lookup Request.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param lookup_request [LookupRequest] Phone number lookup request.
    # @param [Hash] opts the optional parameters
    # @return [CreateLookupResponse]
    def create_lookup(account_id, lookup_request, opts = {})
      data, _status_code, _headers = create_lookup_with_http_info(account_id, lookup_request, opts)
      data
    end

    # Create Lookup
    # Create a Phone Number Lookup Request.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param lookup_request [LookupRequest] Phone number lookup request.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateLookupResponse, Integer, Hash)>] CreateLookupResponse data, response status code and response headers
    def create_lookup_with_http_info(account_id, lookup_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PhoneNumberLookupApi.create_lookup ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling PhoneNumberLookupApi.create_lookup"
      end
      # verify the required parameter 'lookup_request' is set
      if @api_client.config.client_side_validation && lookup_request.nil?
        fail ArgumentError, "Missing the required parameter 'lookup_request' when calling PhoneNumberLookupApi.create_lookup"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tnlookup'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(lookup_request)

      # return_type
      return_type = opts[:debug_return_type] || 'CreateLookupResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"PhoneNumberLookupApi.create_lookup",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PhoneNumberLookupApi#create_lookup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Lookup Request Status
    # Get an existing Phone Number Lookup Request.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param request_id [String] The phone number lookup request ID from Bandwidth.
    # @param [Hash] opts the optional parameters
    # @return [LookupStatus]
    def get_lookup_status(account_id, request_id, opts = {})
      data, _status_code, _headers = get_lookup_status_with_http_info(account_id, request_id, opts)
      data
    end

    # Get Lookup Request Status
    # Get an existing Phone Number Lookup Request.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param request_id [String] The phone number lookup request ID from Bandwidth.
    # @param [Hash] opts the optional parameters
    # @return [Array<(LookupStatus, Integer, Hash)>] LookupStatus data, response status code and response headers
    def get_lookup_status_with_http_info(account_id, request_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PhoneNumberLookupApi.get_lookup_status ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling PhoneNumberLookupApi.get_lookup_status"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling PhoneNumberLookupApi.get_lookup_status"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tnlookup/{requestId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'requestId' + '}', CGI.escape(request_id.to_s))

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
      return_type = opts[:debug_return_type] || 'LookupStatus'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"PhoneNumberLookupApi.get_lookup_status",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PhoneNumberLookupApi#get_lookup_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
