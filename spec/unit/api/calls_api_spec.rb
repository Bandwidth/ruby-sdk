# Unit tests for Bandwidth::CallsApi
describe 'CallsApi' do
  let(:call_id) { 'c-1234' }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME,
      config.password = BW_PASSWORD,
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
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
      amd_config = Bandwidth::MachineDetectionConfiguration.new(
        mode: Bandwidth::MachineDetectionModeEnum::ASYNC,
        detection_timeout: 15.0,
        silence_timeout: 10.0,
        speech_threshold: 10.0,
        speech_end_threshold: 5.0,
        machine_speech_end_threshold: 5.0,
        delay_result: false,
        callback_url: 'https://myServer.com/bandwidth/webhooks/machineDetectionComplete',
        callback_method: Bandwidth::CallbackMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword1!',
        fallback_url: 'https://myFallbackServer.com/bandwidth/webhooks/machineDetectionComplete',
        fallback_method: Bandwidth::CallbackMethodEnum::POST,
        fallback_username: 'mySecretUsername',
        fallback_password: 'mySecretPassword1!',
      )

      call_body = Bandwidth::CreateCall.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        answer_url: BASE_CALLBACK_URL,
        answer_method: Bandwidth::CallbackMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword1!',
        answer_fallback_url: 'https://www.myFallbackServer.com/webhooks/answer',
        answer_fallback_method: Bandwidth::CallbackMethodEnum::POST,
        fallback_username: 'mySecretUsername',
        fallback_password: 'mySecretPassword1!',
        disconnect_url: 'https://myServer.com/bandwidth/webhooks/disconnectUrl',
        disconnect_method: Bandwidth::CallbackMethodEnum::POST,
        call_timeout: 30.0,
        callback_timeout: 15.0,
        machine_detection: amd_config,
        priority: 5,
        tag: 'tag_example',
      )

      data, status_code = @calls_api_instance.create_call_with_http_info(BW_ACCOUNT_ID, call_body)

      expect(status_code).to eq(201)
      expect(data).to be_instance_of(Bandwidth::CreateCallResponse)
      expect(data.application_id.length).to eq(36)
      expect(data.account_id.length).to eq(7)
      expect(data.call_id.length).to eq(47)
      expect(data.to.length).to eq(12)
      expect(data.from.length).to eq(12)
      expect(data.enqueued_time).to be_instance_of(Time)
      expect(data.call_url).to start_with('http')
      expect(data.call_timeout).to be_instance_of(Float)
      expect(data.callback_timeout).to be_instance_of(Float)
      expect(data.tag).to be_instance_of(String)
      expect(data.answer_method).to be_one_of(Bandwidth::CallbackMethodEnum.all_vars)
      expect(data.answer_url).to start_with('http')
      expect(data.answer_fallback_method).to be_one_of(Bandwidth::CallbackMethodEnum.all_vars)
      expect(data.answer_fallback_url).to start_with('http')
      expect(data.disconnect_method).to be_one_of(Bandwidth::CallbackMethodEnum.all_vars)
      expect(data.disconnect_url).to start_with('http')
      expect(data.username).to be_instance_of(String)
      expect(data.password).to be_instance_of(String)
      expect(data.fallback_username).to be_instance_of(String)
      expect(data.fallback_password).to be_instance_of(String)
      expect(data.priority).to be_instance_of(Integer)
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
      data, status_code = @calls_api_instance.list_calls_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallState)
      expect(data[0].application_id.length).to eq(36)
      expect(data[0].account_id.length).to eq(7)
      expect(data[0].call_id.length).to eq(47)
      expect(data[0].parent_call_id.length).to eq(47)
      expect(data[0].to.length).to eq(12)
      expect(data[0].from.length).to eq(12)
      expect(data[0].direction).to be_one_of(Bandwidth::CallDirectionEnum.all_vars)
      expect(data[0].state).to be_instance_of(String)
      expect(data[0].stir_shaken).to be_instance_of(Hash)
      expect(data[0].identity).to be_instance_of(String)
      expect(data[0].enqueued_time).to be_instance_of(Time)
      expect(data[0].start_time).to be_instance_of(Time)
      expect(data[0].answer_time).to be_instance_of(Time)
      expect(data[0].end_time).to be_instance_of(Time)
      expect(data[0].disconnect_cause).to be_instance_of(String)
      expect(data[0]).to respond_to(:error_message)
      expect(data[0]).to respond_to(:error_id)
      expect(data[0].last_update).to be_instance_of(Time)
    end
  end

  #   # Get Call State Information
  describe '#get_call_state' do
    it 'gets the call state' do
      data, status_code = @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::CallState)
      expect(data.application_id.length).to eq(36)
      expect(data.account_id.length).to eq(7)
      expect(data.call_id.length).to eq(47)
      expect(data.parent_call_id.length).to eq(47)
      expect(data.to.length).to eq(12)
      expect(data.from.length).to eq(12)
      expect(data.direction).to be_one_of(Bandwidth::CallDirectionEnum.all_vars)
      expect(data.state).to be_instance_of(String)
      expect(data.stir_shaken).to be_instance_of(Hash)
      expect(data.identity).to be_instance_of(String)
      expect(data.enqueued_time).to be_instance_of(Time)
      expect(data.start_time).to be_instance_of(Time)
      expect(data.answer_time).to be_instance_of(Time)
      expect(data.end_time).to be_instance_of(Time)
      expect(data.disconnect_cause).to be_instance_of(String)
      expect(data).to respond_to(:error_message)
      expect(data).to respond_to(:error_id)
      expect(data.last_update).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @calls_api_instance.get_call_state(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  #   # Update Call
  describe '#update_call' do
    it 'creates and updates a call' do
      update_call_body = Bandwidth::UpdateCall.new(
        state: Bandwidth::CallStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + '/bxml/pause'
      )

      _data, status_code = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, call_id, update_call_body)

      expect(status_code).to eq(200)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @calls_api_instance.update_call(nil, '', {})
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
      update_bxml = "<?xml version='1.0' encoding='UTF-8'?><Bxml><SpeakSentence locale='en_US' gender='female' voice='susan'>This is a test bxml response</SpeakSentence><Pause duration='3'/></Bxml>"

      _data, status_code = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, call_id, update_bxml)

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
