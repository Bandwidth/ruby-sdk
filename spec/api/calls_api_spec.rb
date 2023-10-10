# Unit tests for Bandwidth::CallsApi
describe 'CallsApi' do
  # call info
  let(:call_id) { 'c-15ac29a2-006c67ad-060f-4b98-b148-b753d6e5e2ce' }
  let(:enqueued_time) { '2023-06-23T18:43:51.248Z' }
  let(:call_url) { "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}" }
  let(:call_timeout) { 30.0 }
  let(:callback_timeout) { 15.0 }
  let(:display_name) { 'Ruby SDK' }
  let(:answer_method) { Bandwidth::CallbackMethodEnum::POST }
  let(:answer_url) { BASE_CALLBACK_URL + '/callbacks/answer' }
  let(:answer_fallback_url) { BASE_CALLBACK_URL + '/callbacks/answer' }
  let(:answer_fallback_method) { Bandwidth::CallbackMethodEnum::POST }
  let(:disconnect_method) { Bandwidth::CallbackMethodEnum::GET }
  let(:disconnect_url) { BASE_CALLBACK_URL + '/callbacks/disconnect' }
  let(:priority) { 5 }
  let(:direction) { Bandwidth::CallDirectionEnum::OUTBOUND }
  let(:state) { 'disconnected' }
  let(:stir_shaken) { {} }
  let(:start_time) { '2023-06-23T19:11:06.049Z' }
  let(:end_time) { '2023-06-23T19:11:06.175Z' }
  let(:disconnect_cause) { 'rejected' }
  let(:error_message) { 'Destination not found' }
  let(:error_id) { '779941c4-6482-461d-b370-177b4ad0b5a7' }
  let(:last_update) { '2023-06-23T19:11:06.175Z' }
  let(:tag) { 'test tag' }

  # stubs
  let(:create_call_headers_stub) { { 'content-type' => 'application/json' } }
  let(:create_call_body_stub) { "{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{call_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"enqueuedTime\":\"#{enqueued_time}\",\"callUrl\":\"#{call_url}\",\"callTimeout\":#{call_timeout},\"callbackTimeout\":#{callback_timeout},\"tag\":\"#{tag}\",\"answerMethod\":\"#{answer_method}\",\"answerUrl\":\"#{answer_url}\",\"answerFallbackUrl\":\"#{answer_fallback_url}\",\"answerFallbackMethod\":\"#{answer_fallback_method}\",\"disconnectMethod\":\"#{disconnect_method}\",\"disconnectUrl\":\"#{disconnect_url}\",\"priority\":#{priority}}" }
  let(:create_call_bad_request_stub) { '{"type":"validation","description":"Invalid to: must be a valid SIP URI or an E164 TN"}' }
  let(:get_calls_headers_stub) { { 'content-type' => 'application/json' } }
  let(:get_calls_body_stub) { "[{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{call_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"direction\":\"#{direction}\",\"state\":\"#{state}\",\"stirShaken\":#{stir_shaken},\"startTime\":\"#{start_time}\",\"endTime\":\"#{end_time}\",\"disconnectCause\":\"#{disconnect_cause}\",\"errorMessage\":\"#{error_message}\",\"errorId\":\"#{error_id}\",\"lastUpdate\":\"#{last_update}\"}]" }
  let(:get_call_state_headers_stub) { { 'content-type' => 'application/json' } }
  let(:get_call_state_body_stub) { "{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{call_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"direction\":\"#{direction}\",\"state\":\"#{state}\",\"stirShaken\":#{stir_shaken},\"enqueuedTime\":\"#{enqueued_time}\",\"startTime\":\"#{start_time}\",\"endTime\":\"#{end_time}\",\"disconnectCause\":\"#{disconnect_cause}\",\"errorMessage\":\"#{error_message}\",\"errorId\":\"#{error_id}\",\"lastUpdate\":\"#{last_update}\"}" }
  let(:get_call_state_not_found_stub) { '{"type":"validation","description":"Call does-not-exist was not found."}' }
  let(:get_call_state_unauthorized_stub) { '{"type":"authentication-error","description":"The credentials provided were invalid"}' }
  let(:get_call_state_forbidden_stub) { '{"type":"authorization-error","description":"Access is denied"}' }
  let(:update_call_headers_stub) { { 'content-length' => '0' } }
  
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
    end
    @calls_api_instance = Bandwidth::CallsApi.new
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
      to_return(status: 201, headers: create_call_headers_stub, body: create_call_body_stub)

      amd_config = Bandwidth::MachineDetectionConfiguration.new(
        mode: 'async',
        detection_timeout: 5.0,
        silence_timeout: 5.0,
        speech_threshold: 5.0,
        speech_end_threshold: 5.0,
        delay_result: true,
        callback_url: BASE_CALLBACK_URL + '/machineDetection',
        callback_method: Bandwidth::CallbackMethodEnum::POST
      )

      call_body = Bandwidth::CreateCall.new(
        application_id: BW_VOICE_APPLICATION_ID,
        to: USER_NUMBER,
        from: BW_NUMBER,
        display_name: display_name,
        answer_url: answer_url,
        answer_fallback_url: answer_fallback_url,
        answer_method: answer_method,
        disconnect_url: disconnect_url,
        disconnect_method: disconnect_method,
        machine_detection: amd_config,
        call_timeout: call_timeout,
        callback_timeout: callback_timeout,
        tag: tag
      )

      data, status_code, headers = @calls_api_instance.create_call_with_http_info(BW_ACCOUNT_ID, call_body)

      expect(status_code).to eq(201)
      expect(headers).to eq(create_call_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CreateCallResponse)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq(call_id)
      expect(data.to).to eq(USER_NUMBER)
      expect(data.from).to eq(BW_NUMBER)
      expect(data.enqueued_time).to eq(Time.parse(enqueued_time))
      expect(data.call_url).to eq(call_url)
      expect(data.call_timeout).to eq(call_timeout)
      expect(data.callback_timeout).to eq(callback_timeout)
      expect(data.tag).to eq(tag)
      expect(data.answer_method).to eq(answer_method)
      expect(data.answer_url).to eq(answer_url)
      expect(data.answer_fallback_method).to eq(answer_fallback_method)
      expect(data.answer_fallback_url).to eq(answer_fallback_url)
      expect(data.disconnect_method).to eq(disconnect_method)
      expect(data.disconnect_url).to eq(disconnect_url)
      expect(data.priority).to eq(priority)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @calls_api_instance.create_call(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing create_call' do
      expect {
        @calls_api_instance.create_call(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Calls
  describe '#list_calls' do
    it 'gets a list of calls' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls").
      to_return(status: 200, headers: get_calls_headers_stub, body: get_calls_body_stub)

      data, status_code, headers = @calls_api_instance.list_calls_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(headers).to eq(get_calls_headers_stub)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallState)
      expect(data[0].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].call_id).to eq(call_id)
      expect(data[0].to).to eq(USER_NUMBER)
      expect(data[0].from).to eq(BW_NUMBER)
      expect(data[0].direction).to eq(direction)
      expect(data[0].stir_shaken).to eq(stir_shaken)
      expect(data[0].state).to eq(state)
      expect(data[0].start_time).to eq(Time.parse(start_time))
      expect(data[0].end_time).to eq(Time.parse(end_time))
      expect(data[0].disconnect_cause).to eq(disconnect_cause)
      expect(data[0].error_message).to eq(error_message)
      expect(data[0].error_id).to eq(error_id)
      expect(data[0].last_update).to eq(Time.parse(last_update))
    end
  end

  # Get Call State Information
  describe '#get_call_state' do
    it 'gets the call state' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}").
      to_return(status: 200, headers: get_call_state_headers_stub, body: get_call_state_body_stub)

      data, status_code, headers = @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, call_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(get_call_state_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CallState)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq(call_id)
      expect(data.to).to eq(USER_NUMBER)
      expect(data.from).to eq(BW_NUMBER)
      expect(data.direction).to eq(direction)
      expect(data.stir_shaken).to eq(stir_shaken)
      expect(data.state).to eq(state)
      expect(data.enqueued_time).to eq(Time.parse(enqueued_time))
      expect(data.start_time).to eq(Time.parse(start_time))
      expect(data.end_time).to eq(Time.parse(end_time))
      expect(data.disconnect_cause).to eq(disconnect_cause)
      expect(data.error_message).to eq(error_message)
      expect(data.error_id).to eq(error_id)
      expect(data.last_update).to eq(Time.parse(last_update))
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.get_call_state(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Call
  describe '#update_call' do
    it 'creates and updates a call' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}").
      to_return(status: 200, headers: update_call_headers_stub)

      update_call_body = Bandwidth::UpdateCall.new(
        state: Bandwidth::CallStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + '/bxml/pause'
      )

      data, status_code, headers = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, call_id, update_call_body)

      expect(status_code).to eq(200)
      expect(headers).to eq(update_call_headers_stub)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @calls_api_instance.update_call(nil, '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.update_call(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing update_call' do
      expect {
        @calls_api_instance.update_call(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Call BXML
  describe '#update_call_bxml' do
    it 'updates a call using bxml' do
      stub_request(:put, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}/bxml").
      to_return(status: 204)

      update_bxml = '<?xml version="1.0" encoding="UTF-8"?><Bxml><SpeakSentence locale="en_US" gender="female" voice="susan">This is a test bxml response</SpeakSentence><Pause duration="3"/></Bxml>'

      data, status_code, headers = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, call_id, update_bxml)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @calls_api_instance.update_call_bxml(nil, '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.update_call_bxml(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @calls_api_instance.update_call_bxml(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end
end
