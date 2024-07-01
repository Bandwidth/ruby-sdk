=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
Generator version: 7.7.0-SNAPSHOT

=end

require 'cgi'

module Bandwidth
  class RecordingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete Recording
    # Delete the recording information, media and transcription.  Note: After the deletion is requested and a `204` is returned, neither the recording metadata nor the actual media nor its transcription will be accessible anymore. However, the media of the specified recording is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_recording(account_id, call_id, recording_id, opts = {})
      delete_recording_with_http_info(account_id, call_id, recording_id, opts)
      nil
    end

    # Delete Recording
    # Delete the recording information, media and transcription.  Note: After the deletion is requested and a &#x60;204&#x60; is returned, neither the recording metadata nor the actual media nor its transcription will be accessible anymore. However, the media of the specified recording is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_recording_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.delete_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.delete_recording"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.delete_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.delete_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.delete_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#delete_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Recording Media
    # Deletes the specified recording's media.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_recording_media(account_id, call_id, recording_id, opts = {})
      delete_recording_media_with_http_info(account_id, call_id, recording_id, opts)
      nil
    end

    # Delete Recording Media
    # Deletes the specified recording&#39;s media.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_recording_media_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.delete_recording_media ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.delete_recording_media"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.delete_recording_media"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.delete_recording_media"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.delete_recording_media",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#delete_recording_media\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Transcription
    # Deletes the specified recording's transcription.  Note: After the deletion is requested and a `204` is returned, the transcription will not be accessible anymore. However, it is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_recording_transcription(account_id, call_id, recording_id, opts = {})
      delete_recording_transcription_with_http_info(account_id, call_id, recording_id, opts)
      nil
    end

    # Delete Transcription
    # Deletes the specified recording&#39;s transcription.  Note: After the deletion is requested and a &#x60;204&#x60; is returned, the transcription will not be accessible anymore. However, it is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_recording_transcription_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.delete_recording_transcription ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.delete_recording_transcription"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.delete_recording_transcription"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.delete_recording_transcription"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.delete_recording_transcription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#delete_recording_transcription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Download Recording
    # Downloads the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [File]
    def download_call_recording(account_id, call_id, recording_id, opts = {})
      data, _status_code, _headers = download_call_recording_with_http_info(account_id, call_id, recording_id, opts)
      data
    end

    # Download Recording
    # Downloads the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def download_call_recording_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.download_call_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.download_call_recording"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.download_call_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.download_call_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
        :operation => :"RecordingsApi.download_call_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#download_call_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Call Recording
    # Returns metadata for the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [CallRecordingMetadata]
    def get_call_recording(account_id, call_id, recording_id, opts = {})
      data, _status_code, _headers = get_call_recording_with_http_info(account_id, call_id, recording_id, opts)
      data
    end

    # Get Call Recording
    # Returns metadata for the specified recording.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CallRecordingMetadata, Integer, Hash)>] CallRecordingMetadata data, response status code and response headers
    def get_call_recording_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.get_call_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.get_call_recording"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.get_call_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.get_call_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type] || 'CallRecordingMetadata'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.get_call_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#get_call_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Transcription
    # Downloads the specified transcription. If the recording was multi-channel, then there will be 2 transcripts. The caller/called party transcript will be the first item while [`<PlayAudio>`](/docs/voice/bxml/playAudio) and [`<SpeakSentence>`](/docs/voice/bxml/speakSentence) transcript will be the second item. During a [`<Transfer>`](/docs/voice/bxml/transfer) the A-leg transcript will be the first item while the B-leg transcript will be the second item.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [RecordingTranscriptions]
    def get_recording_transcription(account_id, call_id, recording_id, opts = {})
      data, _status_code, _headers = get_recording_transcription_with_http_info(account_id, call_id, recording_id, opts)
      data
    end

    # Get Transcription
    # Downloads the specified transcription. If the recording was multi-channel, then there will be 2 transcripts. The caller/called party transcript will be the first item while [&#x60;&lt;PlayAudio&gt;&#x60;](/docs/voice/bxml/playAudio) and [&#x60;&lt;SpeakSentence&gt;&#x60;](/docs/voice/bxml/speakSentence) transcript will be the second item. During a [&#x60;&lt;Transfer&gt;&#x60;](/docs/voice/bxml/transfer) the A-leg transcript will be the first item while the B-leg transcript will be the second item.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(RecordingTranscriptions, Integer, Hash)>] RecordingTranscriptions data, response status code and response headers
    def get_recording_transcription_with_http_info(account_id, call_id, recording_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.get_recording_transcription ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.get_recording_transcription"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.get_recording_transcription"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.get_recording_transcription"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      return_type = opts[:debug_return_type] || 'RecordingTranscriptions'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.get_recording_transcription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#get_recording_transcription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Call Recordings
    # Returns a list of metadata for the recordings associated with the specified account. The list can be filtered by the optional from, to, minStartTime, and maxStartTime arguments. The list is capped at 1000 entries and may be empty if no recordings match the specified criteria.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :to Filter results by the &#x60;to&#x60; field.
    # @option opts [String] :from Filter results by the &#x60;from&#x60; field.
    # @option opts [String] :min_start_time Filter results to recordings which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_start_time Filter results to recordings which have a &#x60;startTime&#x60; before &#x60;maxStartTime&#x60; (in ISO8601 format).
    # @return [Array<CallRecordingMetadata>]
    def list_account_call_recordings(account_id, opts = {})
      data, _status_code, _headers = list_account_call_recordings_with_http_info(account_id, opts)
      data
    end

    # Get Call Recordings
    # Returns a list of metadata for the recordings associated with the specified account. The list can be filtered by the optional from, to, minStartTime, and maxStartTime arguments. The list is capped at 1000 entries and may be empty if no recordings match the specified criteria.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :to Filter results by the &#x60;to&#x60; field.
    # @option opts [String] :from Filter results by the &#x60;from&#x60; field.
    # @option opts [String] :min_start_time Filter results to recordings which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format).
    # @option opts [String] :max_start_time Filter results to recordings which have a &#x60;startTime&#x60; before &#x60;maxStartTime&#x60; (in ISO8601 format).
    # @return [Array<(Array<CallRecordingMetadata>, Integer, Hash)>] Array<CallRecordingMetadata> data, response status code and response headers
    def list_account_call_recordings_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.list_account_call_recordings ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.list_account_call_recordings"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/recordings'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'minStartTime'] = opts[:'min_start_time'] if !opts[:'min_start_time'].nil?
      query_params[:'maxStartTime'] = opts[:'max_start_time'] if !opts[:'max_start_time'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<CallRecordingMetadata>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.list_account_call_recordings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#list_account_call_recordings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Call Recordings
    # Returns a (potentially empty) list of metadata for the recordings that took place during the specified call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<CallRecordingMetadata>]
    def list_call_recordings(account_id, call_id, opts = {})
      data, _status_code, _headers = list_call_recordings_with_http_info(account_id, call_id, opts)
      data
    end

    # List Call Recordings
    # Returns a (potentially empty) list of metadata for the recordings that took place during the specified call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<CallRecordingMetadata>, Integer, Hash)>] Array<CallRecordingMetadata> data, response status code and response headers
    def list_call_recordings_with_http_info(account_id, call_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.list_call_recordings ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.list_call_recordings"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.list_call_recordings"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s))

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
      return_type = opts[:debug_return_type] || 'Array<CallRecordingMetadata>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.list_call_recordings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#list_call_recordings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Transcription Request
    # Generate the transcription for a specific recording. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param transcribe_recording [TranscribeRecording] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def transcribe_call_recording(account_id, call_id, recording_id, transcribe_recording, opts = {})
      transcribe_call_recording_with_http_info(account_id, call_id, recording_id, transcribe_recording, opts)
      nil
    end

    # Create Transcription Request
    # Generate the transcription for a specific recording. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param recording_id [String] Programmable Voice API Recording ID.
    # @param transcribe_recording [TranscribeRecording] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def transcribe_call_recording_with_http_info(account_id, call_id, recording_id, transcribe_recording, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.transcribe_call_recording ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.transcribe_call_recording"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.transcribe_call_recording"
      end
      # verify the required parameter 'recording_id' is set
      if @api_client.config.client_side_validation && recording_id.nil?
        fail ArgumentError, "Missing the required parameter 'recording_id' when calling RecordingsApi.transcribe_call_recording"
      end
      # verify the required parameter 'transcribe_recording' is set
      if @api_client.config.client_side_validation && transcribe_recording.nil?
        fail ArgumentError, "Missing the required parameter 'transcribe_recording' when calling RecordingsApi.transcribe_call_recording"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s)).sub('{' + 'recordingId' + '}', CGI.escape(recording_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(transcribe_recording)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.transcribe_call_recording",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#transcribe_call_recording\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Recording
    # Pause or resume a recording on an active phone call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param update_call_recording [UpdateCallRecording] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_call_recording_state(account_id, call_id, update_call_recording, opts = {})
      update_call_recording_state_with_http_info(account_id, call_id, update_call_recording, opts)
      nil
    end

    # Update Recording
    # Pause or resume a recording on an active phone call.
    # @param account_id [String] Your Bandwidth Account ID.
    # @param call_id [String] Programmable Voice API Call ID.
    # @param update_call_recording [UpdateCallRecording] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_call_recording_state_with_http_info(account_id, call_id, update_call_recording, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RecordingsApi.update_call_recording_state ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling RecordingsApi.update_call_recording_state"
      end
      # verify the required parameter 'call_id' is set
      if @api_client.config.client_side_validation && call_id.nil?
        fail ArgumentError, "Missing the required parameter 'call_id' when calling RecordingsApi.update_call_recording_state"
      end
      # verify the required parameter 'update_call_recording' is set
      if @api_client.config.client_side_validation && update_call_recording.nil?
        fail ArgumentError, "Missing the required parameter 'update_call_recording' when calling RecordingsApi.update_call_recording_state"
      end
      # resource path
      local_var_path = '/accounts/{accountId}/calls/{callId}/recording'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s)).sub('{' + 'callId' + '}', CGI.escape(call_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_call_recording)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Basic']

      new_options = opts.merge(
        :operation => :"RecordingsApi.update_call_recording_state",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RecordingsApi#update_call_recording_state\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
