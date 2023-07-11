require_relative '../call_utils'

# Integration Tests for Bandwidth::CallsApi
describe 'CallsApi Integration Tests' do
  # call info
  let(:answer_method ) { Bandwidth::CallbackMethodEnum::POST }
  let(:answer_url ) { BASE_CALLBACK_URL + '/callbacks/answer' }
  let(:answer_fallback_method ) { Bandwidth::CallbackMethodEnum::POST }
  let(:disconnect_method ) { Bandwidth::CallbackMethodEnum::GET }
  let(:disconnect_url ) { BASE_CALLBACK_URL + '/callbacks/disconnect' }
  let(:priority ) { 5 }
  let(:direction ) { Bandwidth::CallDirectionEnum::OUTBOUND }
  let(:call_timeout ) { 30.0 }
  let(:callback_timeout ) { 15.0 }
  
  before(:all) do
    WebMock.allow_net_connect!
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @calls_api_instance = Bandwidth::CallsApi.new
    
    # call id
    $call_info_id = ''
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  # Create Call
  describe 'create_call' do
    it 'creates a call with amd' do
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
        answer_url: answer_url,
        answer_method: answer_method,
        disconnect_url: disconnect_url,
        disconnect_method: disconnect_method,
        machine_detection: amd_config,
        call_timeout: call_timeout,
        callback_timeout: callback_timeout
      )

      data, status_code, headers = @calls_api_instance.create_call_with_http_info(BW_ACCOUNT_ID, call_body)

      expect(status_code).to eq(201)
      expect(data).to be_instance_of(Bandwidth::CreateCallResponse)
      expect(data.call_id.length).to eq(47)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.to).to eq(USER_NUMBER)
      expect(data.from).to eq(BW_NUMBER)
      expect(data.call_timeout).to eq(call_timeout)
      expect(data.callback_timeout).to eq(callback_timeout)
      expect(data.enqueued_time).to be_instance_of(Time)
      expect(data.answer_method).to eq(answer_method)
      expect(data.answer_fallback_method).to eq(answer_fallback_method)
      expect(data.disconnect_method).to eq(disconnect_method)
      expect(data.answer_url).to eq(answer_url)
      expect(data.disconnect_url).to eq(disconnect_url)

      $call_info_id = data.call_id
      $active_calls.append($call_info_id)
    end
  end

  # Get Call State Information
  describe 'get_call_state' do
    it 'gets the call state' do
      begin
        sleep(SLEEP_TIME_S)
        data, status_code, headers = @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)
  
        expect(status_code).to eq(200)
        expect(data).to be_instance_of(Bandwidth::CallState)
        expect(data.call_id).to eq($call_info_id)
        expect(data.account_id).to eq(BW_ACCOUNT_ID)
        expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
        expect(data.start_time).to be_instance_of(Time)
        expect(data.last_update).to be_instance_of(Time)
        expect(data.state).to be_instance_of(String)
        expect(data.direction).to eq(direction)
      rescue Bandwidth::ApiError => e
        if e.code != 404
          raise e
        end
      end
    end
  end

  # Update Call
  describe 'update_call' do
    it 'creates and updates a call' do    
      update_call_body = Bandwidth::UpdateCall.new(
        state: Bandwidth::CallStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + '/bxml/pause'
      )
      
      update_call_id = create_manteca_call(@calls_api_instance)
      sleep(SLEEP_TIME_S)
      
      update_data, update_status_code, update_headers = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, update_call_body)
      expect(update_status_code).to eq(200)
      sleep(SLEEP_TIME_S)
      
      complete_data, complete_status_code, complete_headers = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, $complete_call_body)
      expect(complete_status_code).to eq(200)
    end
  end

  # Update Call BXML
  describe 'update_call_bxml' do
    it 'updates a call using bxml' do
      update_call_id = create_manteca_call(@calls_api_instance)
      sleep(SLEEP_TIME_S)

      update_bxml = '<?xml version="1.0" encoding="UTF-8"?><Bxml><SpeakSentence locale="en_US" gender="female" voice="susan">This is a test bxml response</SpeakSentence><Pause duration="3"/></Bxml>'
      update_data, update_status_code, update_headers = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, update_call_id, update_bxml)
      expect(update_status_code).to eq(204)
      sleep(SLEEP_TIME_S)
      
      complete_data, complete_status_code, complete_headers = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, $complete_call_body)
      expect(complete_status_code).to eq(200)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      call_body_bad = Bandwidth::CreateCall.new(
        application_id: BW_VOICE_APPLICATION_ID,
        to: '+1invalid',
        from: BW_NUMBER,
        answer_url: answer_url,
        answer_method: answer_method,
        disconnect_url: disconnect_url,
        disconnect_method: disconnect_method
      )

      expect {
        @calls_api_instance.create_call_with_http_info(BW_ACCOUNT_ID, call_body_bad)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 404 error' do
      expect {
        @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, 'does-not-exist')
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = UNAUTHORIZED_USERNAME
        config.password = UNAUTHORIZED_PASSWORD
      end

      expect {
        @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 403 error' do
      Bandwidth.configure do |config|
        config.username = FORBIDDEN_USERNAME
        config.password = FORBIDDEN_PASSWORD
      end

      expect {
        @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
