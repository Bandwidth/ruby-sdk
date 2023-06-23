# Unit tests for Bandwidth::CallsApi
describe 'CallsApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.debugging = true
    end
    @calls_api_instance = Bandwidth::CallsApi.new

    # call info
    @call_id = 'c-15ac29a2-006c67ad-060f-4b98-b148-b753d6e5e2ce'

    # stubs
    @create_call_body_stub = "{\"applicationId\":\"c78d4926-46f8-4426-a9b1-af52aa723823\",\"accountId\":\"9901159\",\"callId\":\"c-15ac29a2-006c67ad-060f-4b98-b148-b753d6e5e2ce\",\"to\":\"+19195556059\",\"from\":\"+19192300340\",\"enqueuedTime\":\"2023-06-23T18:43:51.248Z\",\"callUrl\":\"https://voice.bandwidth.com/api/v2/accounts/9901159/calls/c-15ac29a2-006c67ad-060f-4b98-b148-b753d6e5e2ce\",\"callTimeout\":30.0,\"callbackTimeout\":15.0,\"answerMethod\":\"POST\",\"answerUrl\":\"https://localhost:3000/callbacks/answer\",\"answerFallbackMethod\":\"POST\",\"disconnectMethod\":\"GET\",\"disconnectUrl\":\"https://localhost:3000/callbacks/disconnect\",\"priority\":5}"
    @create_call_headers_stub = {"content-type":"application/json"}
    @create_call_bad_request_stub = "{\"type\":\"validation\",\"description\":\"Invalid to: must be a valid SIP URI or an E164 TN\"}"
    @get_call_state_body_stub = "{\"applicationId\":\"c78d4926-46f8-4426-a9b1-af52aa723823\",\"accountId\":\"9901159\",\"callId\":\"c-15ac29a2-006c67ad-060f-4b98-b148-b753d6e5e2ce\",\"to\":\"+19195556059\",\"from\":\"+19192300340\",\"direction\":\"outbound\",\"state\":\"disconnected\",\"stirShaken\":{},\"enqueuedTime\":\"2023-06-23T19:11:06.048Z\",\"startTime\":\"2023-06-23T19:11:06.049Z\",\"endTime\":\"2023-06-23T19:11:06.175Z\",\"disconnectCause\":\"rejected\",\"errorMessage\":\"Destination not found\",\"errorId\":\"779941c4-6482-461d-b370-177b4ad0b5a7\",\"lastUpdate\":\"2023-06-23T19:11:06.175Z\"}"
    @get_call_state_headers_stub = {"content-type":"application/json"}
    @get_call_state_not_found_stub = "{\"type\":\"validation\",\"description\":\"Call does-not-exist was not found.\"}"
    @get_call_state_unauthorized_stub = "{\"type\":\"authentication-error\",\"description\":\"The credentials provided were invalid\"}"
    @get_call_state_forbidden_stub = "{\"type\":\"authorization-error\",\"description\":\"Access is denied\"}"
    @update_call_headers_stub = {"content-length": "0"}
  end

  describe 'test an instance of CallsApi' do
    it 'should create an instance of CallsApi' do
      expect(@calls_api_instance).to be_instance_of(Bandwidth::CallsApi)
    end
  end

  # Create Call
  describe '#create_call' do
    it 'creates a call with amd' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls").
      to_return(status: 201, headers: @create_call_headers_stub, body: @create_call_body_stub)

      amd_config = Bandwidth::MachineDetectionConfiguration.new(
        mode: "async",
        detection_timeout: 5.0,
        silence_timeout: 5.0,
        speech_threshold: 5.0,
        speech_end_threshold: 5.0,
        delay_result: true,
        callback_url: BASE_CALLBACK_URL + "/machineDetection",
        callback_method: Bandwidth::CallbackMethodEnum::POST
      )

      call_body = Bandwidth::CreateCall.new(
        application_id: BW_VOICE_APPLICATION_ID,
        to: USER_NUMBER,
        from: BW_NUMBER,
        answer_url: BASE_CALLBACK_URL + "/callbacks/answer",
        answer_method: "POST",
        disconnect_url: BASE_CALLBACK_URL + "/callbacks/disconnect",
        disconnect_method: "GET",
        machine_detection: amd_config,
        call_timeout: 30.0,
        callback_timeout: 15.0
      )

      data, status_code, headers = @calls_api_instance.create_call_with_http_info(BW_ACCOUNT_ID, call_body)

      expect(status_code).to eq(201)
      expect(headers.transform_keys(&:to_sym)).to eq(@create_call_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CreateCallResponse)
      expect(data.call_id).to eq(@call_id)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.to).to eq(USER_NUMBER)
      expect(data.from).to eq(BW_NUMBER)
      expect(data.call_timeout).to eq(30.0)
      expect(data.callback_timeout).to eq(15.0)
      expect(data.enqueued_time).to be_instance_of(Time)
      expect(data.answer_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(data.disconnect_method).to eq("GET")
      expect(data.answer_url).to eq(BASE_CALLBACK_URL + "/callbacks/answer")
      expect(data.disconnect_url).to eq(BASE_CALLBACK_URL + "/callbacks/disconnect")
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.create_call(nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing create_call' do
      expect {
        @calls_api_instance.create_call(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Call State Information
  describe '#get_call_state' do
    it 'gets the call state' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 200, headers: @get_call_state_headers_stub, body: @get_call_state_body_stub)

      data, status_code, headers = @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, @call_id)

      expect(status_code).to eq(200)
      expect(headers.transform_keys(&:to_sym)).to eq(@get_call_state_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CallState)
      expect(data.call_id).to eq(@call_id)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.start_time).to be_instance_of(Time)
      expect(data.last_update).to be_instance_of(Time)
      expect(data.state).to be_instance_of(String)
      expect(data.direction).to eq(Bandwidth::CallDirectionEnum::OUTBOUND)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.get_call_state(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Update Call
  describe '#update_call' do
    it 'creates and updates a call' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 200, headers: @update_call_headers_stub)

      update_call_body = Bandwidth::UpdateCall.new(
        state: Bandwidth::CallStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + "/bxml/pause"
      )

      data, status_code, headers = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, @call_id, update_call_body)

      expect(status_code).to eq(200)
      expect(headers.transform_keys(&:to_sym)).to eq(@update_call_headers_stub)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.update_call(nil, '', {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.update_call(BW_ACCOUNT_ID, nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing update_call' do
      expect {
        @calls_api_instance.update_call(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Update Call BXML
  describe '#update_call_bxml' do
    it 'updates a call using bxml' do
      stub_request(:put, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/bxml").
      to_return(status: 204)

      update_bxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Bxml><SpeakSentence locale=\"en_US\" gender=\"female\" voice=\"susan\">This is a test bxml response</SpeakSentence><Pause duration=\"3\"/></Bxml>"

      data, status_code, headers = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, @call_id, update_bxml)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.update_call_bxml(nil, '', {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.update_call_bxml(BW_ACCOUNT_ID, nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @calls_api_instance.update_call_bxml(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls").
      to_return(status: 400, body: @create_call_bad_request_stub)

      call_body_bad = Bandwidth::CreateCall.new(
        application_id: BW_VOICE_APPLICATION_ID,
        to: "+1invalid",
        from: BW_NUMBER,
        answer_url: BASE_CALLBACK_URL + "/callbacks/answer",
        answer_method: "POST",
        disconnect_url: BASE_CALLBACK_URL + "/callbacks/disconnect",
        disconnect_method: "GET"
      )

      expect {
        @calls_api_instance.create_call(BW_ACCOUNT_ID, call_body_bad)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 404 error' do
      dne_id = 'does-not-exist'

      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{dne_id}").
      to_return(status: 404, body: @get_call_state_not_found_stub)

      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, dne_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 401 error' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 401, body: @get_call_state_unauthorized_stub)

      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, @call_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 403 error' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 403, body: @get_call_state_forbidden_stub)

      expect {
        @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, @call_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
