=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.4.0

=end

require 'cgi'

module Bandwidth
  class StatisticsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Account Statistics
    # Returns details about the current state of the account.
    # @param account_id [String] Your Bandwidth Account ID
    # @param [Hash] opts the optional parameters
    # @return [AccountStatistics]
    def get_statistics(account_id, opts = {})
      data, _status_code, _headers = get_statistics_with_http_info(account_id, opts)
      data
    end

    # Get Account Statistics
    # Returns details about the current state of the account.
    # @param account_id [String] Your Bandwidth Account ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountStatistics, Integer, Hash)>] AccountStatistics data, response status code and response headers
    def get_statistics_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: StatisticsApi.get_statistics ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling StatisticsApi.get_statistics"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/statistics'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

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
      return_type = opts[:debug_return_type] || 'AccountStatistics'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"StatisticsApi.get_statistics",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: StatisticsApi#get_statistics\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
