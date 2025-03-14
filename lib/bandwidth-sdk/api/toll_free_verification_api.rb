=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

require 'cgi'

module Bandwidth
  class TollFreeVerificationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Webhook Subscription
    # Create a new webhook subscription (this webhook will be called for every update on every submission). In addition to a `callbackUrl`, this subscription can provide optional HTTP basic authentication credentials (a username and a password). The returned subscription object will contain an ID that can be used to modify or delete the subscription at a later time.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param webhook_subscription_request_schema [WebhookSubscriptionRequestSchema] Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.
    # @param [Hash] opts the optional parameters
    # @return [WebhookSubscription]
    def create_webhook_subscription(account_id, webhook_subscription_request_schema, opts = {})
      data, _status_code, _headers = create_webhook_subscription_with_http_info(account_id, webhook_subscription_request_schema, opts)
      data
    end

    # Create Webhook Subscription
    # Create a new webhook subscription (this webhook will be called for every update on every submission). In addition to a &#x60;callbackUrl&#x60;, this subscription can provide optional HTTP basic authentication credentials (a username and a password). The returned subscription object will contain an ID that can be used to modify or delete the subscription at a later time.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param webhook_subscription_request_schema [WebhookSubscriptionRequestSchema] Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.
    # @param [Hash] opts the optional parameters
    # @return [Array<(WebhookSubscription, Integer, Hash)>] WebhookSubscription data, response status code and response headers
    def create_webhook_subscription_with_http_info(account_id, webhook_subscription_request_schema, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.create_webhook_subscription ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.create_webhook_subscription"
      end
      # verify the required parameter 'webhook_subscription_request_schema' is set
      if @api_client.config.client_side_validation && webhook_subscription_request_schema.nil?
        fail ArgumentError, "Missing the required parameter 'webhook_subscription_request_schema' when calling TollFreeVerificationApi.create_webhook_subscription"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tollFreeVerification/webhooks/subscriptions'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(webhook_subscription_request_schema)

      # return_type
      return_type = opts[:debug_return_type] || 'WebhookSubscription'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.create_webhook_subscription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#create_webhook_subscription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Webhook Subscription
    # Delete a webhook subscription by ID.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param id [String] Webhook subscription ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_webhook_subscription(account_id, id, opts = {})
      delete_webhook_subscription_with_http_info(account_id, id, opts)
      nil
    end

    # Delete Webhook Subscription
    # Delete a webhook subscription by ID.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param id [String] Webhook subscription ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_webhook_subscription_with_http_info(account_id, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.delete_webhook_subscription ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.delete_webhook_subscription"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TollFreeVerificationApi.delete_webhook_subscription"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tollFreeVerification/webhooks/subscriptions/{id}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.delete_webhook_subscription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#delete_webhook_subscription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Toll-Free Verification Status
    # Gets the verification status for a phone number that is provisioned to your account. Submission information will be appended to the response if it is available.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param phone_number [String] Valid Toll-Free telephone number in E.164 format.
    # @param [Hash] opts the optional parameters
    # @return [TfvStatus]
    def get_toll_free_verification_status(account_id, phone_number, opts = {})
      data, _status_code, _headers = get_toll_free_verification_status_with_http_info(account_id, phone_number, opts)
      data
    end

    # Get Toll-Free Verification Status
    # Gets the verification status for a phone number that is provisioned to your account. Submission information will be appended to the response if it is available.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param phone_number [String] Valid Toll-Free telephone number in E.164 format.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TfvStatus, Integer, Hash)>] TfvStatus data, response status code and response headers
    def get_toll_free_verification_status_with_http_info(account_id, phone_number, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.get_toll_free_verification_status ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.get_toll_free_verification_status"
      end
      # verify the required parameter 'phone_number' is set
      if @api_client.config.client_side_validation && phone_number.nil?
        fail ArgumentError, "Missing the required parameter 'phone_number' when calling TollFreeVerificationApi.get_toll_free_verification_status"
      end
      if @api_client.config.client_side_validation && phone_number.to_s.length > 12
        fail ArgumentError, 'invalid value for "phone_number" when calling TollFreeVerificationApi.get_toll_free_verification_status, the character length must be smaller than or equal to 12.'
      end

      if @api_client.config.client_side_validation && phone_number.to_s.length < 12
        fail ArgumentError, 'invalid value for "phone_number" when calling TollFreeVerificationApi.get_toll_free_verification_status, the character length must be great than or equal to 12.'
      end

      pattern = Regexp.new(/^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$/)
      if @api_client.config.client_side_validation && phone_number !~ pattern
        fail ArgumentError, "invalid value for 'phone_number' when calling TollFreeVerificationApi.get_toll_free_verification_status, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/accounts/{accountId}/phoneNumbers/{phoneNumber}/tollFreeVerification'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'phoneNumber' + '}', CGI.escape(phone_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TfvStatus'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.get_toll_free_verification_status",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#get_toll_free_verification_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Toll-Free Use Cases
    # Lists valid toll-free use cases.
    # @param [Hash] opts the optional parameters
    # @return [Array<String>]
    def list_toll_free_use_cases(opts = {})
      data, _status_code, _headers = list_toll_free_use_cases_with_http_info(opts)
      data
    end

    # List Toll-Free Use Cases
    # Lists valid toll-free use cases.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<String>, Integer, Hash)>] Array<String> data, response status code and response headers
    def list_toll_free_use_cases_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.list_toll_free_use_cases ...'
      end
      # resource path
      local_var_path = '/tollFreeVerification/useCases'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<String>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.list_toll_free_use_cases",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#list_toll_free_use_cases\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Webhook Subscriptions
    # Lists all webhook subscriptions that are registered to receive status updates for the toll-free verification requests submitted under this account (password will not be returned through this API If `basicAuthentication` is defined, the `password` property of that object will be null).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @return [WebhookSubscriptionsListBody]
    def list_webhook_subscriptions(account_id, opts = {})
      data, _status_code, _headers = list_webhook_subscriptions_with_http_info(account_id, opts)
      data
    end

    # List Webhook Subscriptions
    # Lists all webhook subscriptions that are registered to receive status updates for the toll-free verification requests submitted under this account (password will not be returned through this API If &#x60;basicAuthentication&#x60; is defined, the &#x60;password&#x60; property of that object will be null).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(WebhookSubscriptionsListBody, Integer, Hash)>] WebhookSubscriptionsListBody data, response status code and response headers
    def list_webhook_subscriptions_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.list_webhook_subscriptions ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.list_webhook_subscriptions"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tollFreeVerification/webhooks/subscriptions'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'WebhookSubscriptionsListBody'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.list_webhook_subscriptions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#list_webhook_subscriptions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Request Toll-Free Verification
    # Submit a request for verification of a toll-free phone number.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param verification_request [VerificationRequest] Request for verification of a toll-free phone number.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def request_toll_free_verification(account_id, verification_request, opts = {})
      request_toll_free_verification_with_http_info(account_id, verification_request, opts)
      nil
    end

    # Request Toll-Free Verification
    # Submit a request for verification of a toll-free phone number.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param verification_request [VerificationRequest] Request for verification of a toll-free phone number.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def request_toll_free_verification_with_http_info(account_id, verification_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.request_toll_free_verification ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.request_toll_free_verification"
      end
      # verify the required parameter 'verification_request' is set
      if @api_client.config.client_side_validation && verification_request.nil?
        fail ArgumentError, "Missing the required parameter 'verification_request' when calling TollFreeVerificationApi.request_toll_free_verification"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tollFreeVerification'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(verification_request)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.request_toll_free_verification",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#request_toll_free_verification\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Toll-Free Verification Request
    # Updates a toll-free verification request. Submissions are only eligible for resubmission for 7 days within being processed and if resubmission is allowed (resubmitAllowed field is true).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param phone_number [String] Valid Toll-Free telephone number in E.164 format.
    # @param tfv_submission_wrapper [TfvSubmissionWrapper] Update a request for verification of a toll-free phone number.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_toll_free_verification_request(account_id, phone_number, tfv_submission_wrapper, opts = {})
      update_toll_free_verification_request_with_http_info(account_id, phone_number, tfv_submission_wrapper, opts)
      nil
    end

    # Update Toll-Free Verification Request
    # Updates a toll-free verification request. Submissions are only eligible for resubmission for 7 days within being processed and if resubmission is allowed (resubmitAllowed field is true).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param phone_number [String] Valid Toll-Free telephone number in E.164 format.
    # @param tfv_submission_wrapper [TfvSubmissionWrapper] Update a request for verification of a toll-free phone number.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_toll_free_verification_request_with_http_info(account_id, phone_number, tfv_submission_wrapper, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.update_toll_free_verification_request ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.update_toll_free_verification_request"
      end
      # verify the required parameter 'phone_number' is set
      if @api_client.config.client_side_validation && phone_number.nil?
        fail ArgumentError, "Missing the required parameter 'phone_number' when calling TollFreeVerificationApi.update_toll_free_verification_request"
      end
      if @api_client.config.client_side_validation && phone_number.to_s.length > 12
        fail ArgumentError, 'invalid value for "phone_number" when calling TollFreeVerificationApi.update_toll_free_verification_request, the character length must be smaller than or equal to 12.'
      end

      if @api_client.config.client_side_validation && phone_number.to_s.length < 12
        fail ArgumentError, 'invalid value for "phone_number" when calling TollFreeVerificationApi.update_toll_free_verification_request, the character length must be great than or equal to 12.'
      end

      pattern = Regexp.new(/^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$/)
      if @api_client.config.client_side_validation && phone_number !~ pattern
        fail ArgumentError, "invalid value for 'phone_number' when calling TollFreeVerificationApi.update_toll_free_verification_request, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'tfv_submission_wrapper' is set
      if @api_client.config.client_side_validation && tfv_submission_wrapper.nil?
        fail ArgumentError, "Missing the required parameter 'tfv_submission_wrapper' when calling TollFreeVerificationApi.update_toll_free_verification_request"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/phoneNumbers/{phoneNumber}/tollFreeVerification'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'phoneNumber' + '}', CGI.escape(phone_number.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tfv_submission_wrapper)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.update_toll_free_verification_request",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#update_toll_free_verification_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Webhook Subscription
    # Update an existing webhook subscription (`callbackUrl` and `basicAuthentication` can be updated).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param id [String] Webhook subscription ID
    # @param webhook_subscription_request_schema [WebhookSubscriptionRequestSchema] Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.
    # @param [Hash] opts the optional parameters
    # @return [WebhookSubscription]
    def update_webhook_subscription(account_id, id, webhook_subscription_request_schema, opts = {})
      data, _status_code, _headers = update_webhook_subscription_with_http_info(account_id, id, webhook_subscription_request_schema, opts)
      data
    end

    # Update Webhook Subscription
    # Update an existing webhook subscription (&#x60;callbackUrl&#x60; and &#x60;basicAuthentication&#x60; can be updated).
    # @param account_id [String] Your Bandwidth Account ID.
    # @param id [String] Webhook subscription ID
    # @param webhook_subscription_request_schema [WebhookSubscriptionRequestSchema] Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.
    # @param [Hash] opts the optional parameters
    # @return [Array<(WebhookSubscription, Integer, Hash)>] WebhookSubscription data, response status code and response headers
    def update_webhook_subscription_with_http_info(account_id, id, webhook_subscription_request_schema, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TollFreeVerificationApi.update_webhook_subscription ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TollFreeVerificationApi.update_webhook_subscription"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TollFreeVerificationApi.update_webhook_subscription"
      end
      # verify the required parameter 'webhook_subscription_request_schema' is set
      if @api_client.config.client_side_validation && webhook_subscription_request_schema.nil?
        fail ArgumentError, "Missing the required parameter 'webhook_subscription_request_schema' when calling TollFreeVerificationApi.update_webhook_subscription"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/tollFreeVerification/webhooks/subscriptions/{id}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
        header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(webhook_subscription_request_schema)

      # return_type
      return_type = opts[:debug_return_type] || 'WebhookSubscription'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"TollFreeVerificationApi.update_webhook_subscription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TollFreeVerificationApi#update_webhook_subscription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
