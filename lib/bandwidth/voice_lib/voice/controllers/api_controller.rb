# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
module Voice
  # APIController
  class APIController < BaseController
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a call request
    # @param [String] account_id Required parameter: Example:
    # @param [ApiCreateCallRequest] body Optional parameter: Example:
    # @return [ApiCallResponse] response from the API call
    def create_call(account_id,
                    body: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      ApiResponse.new(_response, data: ApiCallResponse.from_hash(decoded))
    end

    # Interrupts and replaces an active call's BXML document
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @param [ApiModifyCallRequest] body Optional parameter: Example:
    # @return [void] response from the API call
    def modify_call(account_id,
                    call_id,
                    body: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise APIException.new(
          'The call can\'t be modified in its current state',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 404
        raise APIException.new(
          'The call never existed, no longer exists, or is inaccessible to you',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      ApiResponse.new(_response)
    end

    # Pauses or resumes a recording
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @param [ModifyCallRecordingState] body Optional parameter: Example:
    # @return [void] response from the API call
    def modify_call_recording_state(account_id,
                                    call_id,
                                    body: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}/recording'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise APIException.new(
          'The call can\'t be modified in its current state',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 404
        raise APIException.new(
          'The call never existed, no longer exists, or is inaccessible to you',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      ApiResponse.new(_response)
    end

    # Returns a (potentially empty) list of metadata for the recordings that
    # took place during the specified call
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @return [List of RecordingMetadataResponse] response from the API call
    def get_query_metadata_for_account_and_call(account_id,
                                                call_id)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}/recordings'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      ApiResponse.new(
        _response,
        data: decoded.map { |element| RecordingMetadataResponse.from_hash(element) }
      )
    end

    # Returns metadata for the specified recording
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @param [String] recording_id Required parameter: Example:
    # @return [RecordingMetadataResponse] response from the API call
    def get_metadata_for_recording(account_id,
                                   call_id,
                                   recording_id)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}/recordings/{recordingId}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id,
        'recordingId' => recording_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 404
        raise APIException.new(
          'The recording never existed, no longer exists, or is inaccessible' \
          ' to you',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      ApiResponse.new(_response,
                      data: RecordingMetadataResponse.from_hash(decoded))
    end

    # Deletes the specified recording
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @param [String] recording_id Required parameter: Example:
    # @return [void] response from the API call
    def delete_recording(account_id,
                         call_id,
                         recording_id)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}/recordings/{recordingId}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id,
        'recordingId' => recording_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 404
        raise APIException.new(
          'The recording never existed, no longer exists, or is inaccessible' \
          ' to you',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      ApiResponse.new(_response)
    end

    # Downloads the specified recording
    # @param [String] account_id Required parameter: Example:
    # @param [String] call_id Required parameter: Example:
    # @param [String] recording_id Required parameter: Example:
    # @return [Binary] response from the API call
    def get_stream_recording_media(account_id,
                                   call_id,
                                   recording_id)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id,
        'callId' => call_id,
        'recordingId' => recording_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request, binary: true)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 404
        raise APIException.new(
          'The recording never existed, no longer exists, or is inaccessible' \
          ' to you',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      ApiResponse.new(_response, data: _response.raw_body)
    end

    # Returns a (potentially empty; capped at 1000) list of metadata for the
    # recordings associated with the specified account
    # @param [String] account_id Required parameter: Example:
    # @return [List of RecordingMetadataResponse] response from the API call
    def get_query_metadata_for_account(account_id)
      # Prepare query url.
      _query_builder = config.get_base_uri(Server::VOICEDEFAULT)
      _query_builder << '/api/v2/accounts/{accountId}/recordings'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'accountId' => account_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      VoiceBasicAuth.apply(config, _request)
      _response = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _response.status_code == 400
        raise ErrorResponseException.new(
          'Something didn\'t look right about that request. Please fix it' \
          ' before trying again.',
          _response
        )
      elsif _response.status_code == 401
        raise APIException.new(
          'Please authenticate yourself',
          _response
        )
      elsif _response.status_code == 403
        raise ErrorResponseException.new(
          'Your credentials are invalid. Please use your API credentials for' \
          ' the Bandwidth Dashboard.',
          _response
        )
      elsif _response.status_code == 415
        raise ErrorResponseException.new(
          'We don\'t support that media type. Please send us' \
          ' `application/json`.',
          _response
        )
      elsif _response.status_code == 429
        raise ErrorResponseException.new(
          'You\'re sending requests to this endpoint too frequently. Please' \
          ' slow your request rate down and try again.',
          _response
        )
      elsif _response.status_code == 500
        raise ErrorResponseException.new(
          'Something unexpected happened. Please try again.',
          _response
        )
      end
      validate_response(_response)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      ApiResponse.new(
        _response,
        data: decoded.map { |element| RecordingMetadataResponse.from_hash(element) }
      )
    end
  end
end
end