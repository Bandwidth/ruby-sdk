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
  class ConferencesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Download Conference Recording
    # Downloads the specified recording file.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [File]
    def download_conference_recording(account_id, conference_id, recording_id, opts = {})
      data, _status_code, _headers = download_conference_recording_with_http_info(account_id, conference_id, recording_id, opts)
      data
    end

    # Download Conference Recording
    # Downloads the specified recording file.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def download_conference_recording_with_http_info(account_id, conference_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.download_conference_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.download_conference_recording"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.download_conference_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling ConferencesApi.download_conference_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId}/media'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['audio/vnd.wave', 'audio/mpeg', 'application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.download_conference_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#download_conference_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Conference Information
    # Returns information about the specified conference.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param [Hash] opts the optional parameters
    # @return [Conference]
    def get_conference(account_id, conference_id, opts = {})
      data, _status_code, _headers = get_conference_with_http_info(account_id, conference_id, opts)
      data
    end

    # Get Conference Information
    # Returns information about the specified conference.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Conference, Integer, Hash)>] Conference data, response status code and response headers
    def get_conference_with_http_info(account_id, conference_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.get_conference ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.get_conference"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.get_conference"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s))

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
      return_type = opts[:debug_return_type] || 'Conference'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.get_conference",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#get_conference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Conference Member
    # Returns information about the specified conference member.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param member_id [String] Programmable Voice API Conference Member ID.
    # @param [Hash] opts the optional parameters
    # @return [ConferenceMember]
    def get_conference_member(account_id, conference_id, member_id, opts = {})
      data, _status_code, _headers = get_conference_member_with_http_info(account_id, conference_id, member_id, opts)
      data
    end

    # Get Conference Member
    # Returns information about the specified conference member.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param member_id [String] Programmable Voice API Conference Member ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ConferenceMember, Integer, Hash)>] ConferenceMember data, response status code and response headers
    def get_conference_member_with_http_info(account_id, conference_id, member_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.get_conference_member ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.get_conference_member"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.get_conference_member"
      end
      # verify the required parameter 'member_id' is set
      if @api_client.config.client_side_validation && member_id.nil?
        fail ArgumentError, "Missing the required parameter 'member_id' when calling ConferencesApi.get_conference_member"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/members/{memberId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s)).sub('{' + 'memberId' + '}', CGI.escape(member_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ConferenceMember'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.get_conference_member",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#get_conference_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Conference Recording Information
    # Returns metadata for the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [ConferenceRecordingMetadata]
    def get_conference_recording(account_id, conference_id, recording_id, opts = {})
      data, _status_code, _headers = get_conference_recording_with_http_info(account_id, conference_id, recording_id, opts)
      data
    end

    # Get Conference Recording Information
    # Returns metadata for the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ConferenceRecordingMetadata, Integer, Hash)>] ConferenceRecordingMetadata data, response status code and response headers
    def get_conference_recording_with_http_info(account_id, conference_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.get_conference_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.get_conference_recording"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.get_conference_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling ConferencesApi.get_conference_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ConferenceRecordingMetadata'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.get_conference_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#get_conference_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Conference Recordings
    # Returns a (potentially empty) list of metadata for the recordings that took place during the specified conference.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<ConferenceRecordingMetadata>]
    def list_conference_recordings(account_id, conference_id, opts = {})
      data, _status_code, _headers = list_conference_recordings_with_http_info(account_id, conference_id, opts)
      data
    end

    # Get Conference Recordings
    # Returns a (potentially empty) list of metadata for the recordings that took place during the specified conference.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<ConferenceRecordingMetadata>, Integer, Hash)>] Array<ConferenceRecordingMetadata> data, response status code and response headers
    def list_conference_recordings_with_http_info(account_id, conference_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.list_conference_recordings ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.list_conference_recordings"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.list_conference_recordings"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/recordings'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s))

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
      return_type = opts[:debug_return_type] || 'Array<ConferenceRecordingMetadata>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.list_conference_recordings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#list_conference_recordings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Conferences
    # Returns a max of 1000 conferences, sorted by `createdTime` from oldest to newest.  **NOTE:** If the number of conferences in the account is bigger than `pageSize`, a `Link` header (with format `<{url}>; rel=\"next\"`) will be returned in the response. The url can be used to retrieve the next page of conference records.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name Filter results by the &#x60;name&#x60; field.
    # @option opts [String] :min_created_time Filter results to conferences which have a &#x60;createdTime&#x60; after or at &#x60;minCreatedTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_created_time Filter results to conferences which have a &#x60;createdTime&#x60; before or at &#x60;maxCreatedTime&#x60; (in ISO8601 format).
    # @option opts [Integer] :page_size Specifies the max number of conferences that will be returned. (default to 1000)
    # @option opts [String] :page_token Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description.
    # @return [Array<Conference>]
    def list_conferences(account_id, opts = {})
      data, _status_code, _headers = list_conferences_with_http_info(account_id, opts)
      data
    end

    # Get Conferences
    # Returns a max of 1000 conferences, sorted by &#x60;createdTime&#x60; from oldest to newest.  **NOTE:** If the number of conferences in the account is bigger than &#x60;pageSize&#x60;, a &#x60;Link&#x60; header (with format &#x60;&lt;{url}&gt;; rel&#x3D;\&quot;next\&quot;&#x60;) will be returned in the response. The url can be used to retrieve the next page of conference records.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name Filter results by the &#x60;name&#x60; field.
    # @option opts [String] :min_created_time Filter results to conferences which have a &#x60;createdTime&#x60; after or at &#x60;minCreatedTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_created_time Filter results to conferences which have a &#x60;createdTime&#x60; before or at &#x60;maxCreatedTime&#x60; (in ISO8601 format).
    # @option opts [Integer] :page_size Specifies the max number of conferences that will be returned. (default to 1000)
    # @option opts [String] :page_token Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description.
    # @return [Array<(Array<Conference>, Integer, Hash)>] Array<Conference> data, response status code and response headers
    def list_conferences_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.list_conferences ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.list_conferences"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling ConferencesApi.list_conferences, must be smaller than or equal to 1000.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling ConferencesApi.list_conferences, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/accounts/{accountId}/conferences'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
      query_params[:'minCreatedTime'] = opts[:'min_created_time'] if !opts[:'min_created_time'].nil?
      query_params[:'maxCreatedTime'] = opts[:'max_created_time'] if !opts[:'max_created_time'].nil?
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
      return_type = opts[:debug_return_type] || 'Array<Conference>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.list_conferences",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#list_conferences\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Conference
    # Update the conference state.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param update_conference [UpdateConference] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_conference(account_id, conference_id, update_conference, opts = {})
      update_conference_with_http_info(account_id, conference_id, update_conference, opts)
      nil
    end

    # Update Conference
    # Update the conference state.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param update_conference [UpdateConference] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_conference_with_http_info(account_id, conference_id, update_conference, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.update_conference ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.update_conference"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.update_conference"
      end
      # verify the required parameter 'update_conference' is set
      if @api_client.config.client_side_validation && update_conference.nil?
        fail ArgumentError, "Missing the required parameter 'update_conference' when calling ConferencesApi.update_conference"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_conference)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.update_conference",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#update_conference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Conference BXML
    # Update the conference BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param body [String] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_conference_bxml(account_id, conference_id, body, opts = {})
      update_conference_bxml_with_http_info(account_id, conference_id, body, opts)
      nil
    end

    # Update Conference BXML
    # Update the conference BXML document.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param body [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_conference_bxml_with_http_info(account_id, conference_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.update_conference_bxml ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.update_conference_bxml"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.update_conference_bxml"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling ConferencesApi.update_conference_bxml"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/bxml'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s))

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
        :operation => :"ConferencesApi.update_conference_bxml",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#update_conference_bxml\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Conference Member
    # Updates settings for a particular conference member.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param member_id [String] Programmable Voice API Conference Member ID.
    # @param update_conference_member [UpdateConferenceMember] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_conference_member(account_id, conference_id, member_id, update_conference_member, opts = {})
      update_conference_member_with_http_info(account_id, conference_id, member_id, update_conference_member, opts)
      nil
    end

    # Update Conference Member
    # Updates settings for a particular conference member.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param conference_id [String] Programmable Voice API Conference ID.
    # @param member_id [String] Programmable Voice API Conference Member ID.
    # @param update_conference_member [UpdateConferenceMember] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_conference_member_with_http_info(account_id, conference_id, member_id, update_conference_member, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConferencesApi.update_conference_member ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling ConferencesApi.update_conference_member"
      end
      # verify the required parameter 'conference_id' is set
      if @api_client.config.client_side_validation && conference_id.nil?
        fail ArgumentError, "Missing the required parameter 'conference_id' when calling ConferencesApi.update_conference_member"
      end
      # verify the required parameter 'member_id' is set
      if @api_client.config.client_side_validation && member_id.nil?
        fail ArgumentError, "Missing the required parameter 'member_id' when calling ConferencesApi.update_conference_member"
      end
      # verify the required parameter 'update_conference_member' is set
      if @api_client.config.client_side_validation && update_conference_member.nil?
        fail ArgumentError, "Missing the required parameter 'update_conference_member' when calling ConferencesApi.update_conference_member"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/conferences/{conferenceId}/members/{memberId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'conferenceId' + '}', CGI.escape(conference_id.to_s)).sub('{' + 'memberId' + '}', CGI.escape(member_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_conference_member)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"ConferencesApi.update_conference_member",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConferencesApi#update_conference_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
