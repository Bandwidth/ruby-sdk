require 'spec_helper'
require 'json'
require_relative '../manteca_utils'

# Integration Tests for Bandwidth::CallsApi
describe 'CallsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_calls = Bandwidth::CallsApi.new
    $call_info_id = ""
  end

  # Create Call
  describe 'create_call' do
    it 'creates a call with amd' do
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

      response = @api_instance_calls.create_call_with_http_info(BW_ACCOUNT_ID, call_body)
      sleep(SLEEP_TIME_S)

      expect(response[CODE]).to eq(201)
      expect(response[DATA].call_id.length).to eq(47)
      expect(response[DATA].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(response[DATA].to).to eq(USER_NUMBER)
      expect(response[DATA].from).to eq(BW_NUMBER)
      expect(response[DATA].call_id)
      expect(response[DATA].call_timeout).to eq(30.0)
      expect(response[DATA].callback_timeout).to eq(15.0)
      expect(response[DATA].enqueued_time).to be_a(Time)
      expect(response[DATA].answer_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(response[DATA].disconnect_method).to eq("GET")
      expect(response[DATA].answer_url).to eq(BASE_CALLBACK_URL + "/callbacks/answer")
      expect(response[DATA].disconnect_url).to eq(BASE_CALLBACK_URL + "/callbacks/disconnect")

      $call_info_id = response[DATA].call_id
      $active_calls.append($call_info_id)
    end
  end

  # Get Call State Information
  describe 'get_call_state' do
    it 'gets the call state' do
      response = @api_instance_calls.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA].call_id).to eq($call_info_id)
      expect(response[DATA].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(response[DATA].start_time).to be_a(Time)
      expect(response[DATA].last_update).to be_a(Time)
      expect(response[DATA].state).to be_a(String)
      expect(response[DATA].direction).to eq(Bandwidth::CallDirectionEnum::OUTBOUND)
    end
  end

  # Update Call
  describe 'update_call' do
    it 'creates and updates a call' do    
      update_call_body = Bandwidth::UpdateCall.new(
        state: Bandwidth::CallStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + "/bxml/pause"
      )
      
      update_call_id = create_manteca_call(@api_instance_calls)
      sleep(SLEEP_TIME_S)
      
      update_response = @api_instance_calls.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, update_call_body)
      expect(update_response[CODE]).to eq(200)
      sleep(SLEEP_TIME_S)
      
      complete_response = @api_instance_calls.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, $complete_call_body)
      expect(complete_response[CODE]).to eq(200)
    end
  end

  # Update Call BXML
  describe 'update_call_bxml' do
    it 'updates a call using bxml' do
      update_call_id = create_manteca_call(@api_instance_calls)
      sleep(SLEEP_TIME_S)

      update_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Bxml><SpeakSentence locale=\"en_US\" gender=\"female\" voice=\"susan\">This is a test bxml response</SpeakSentence><Pause duration=\"3\"/></Bxml>";
      update_response = @api_instance_calls.update_call_bxml_with_http_info(BW_ACCOUNT_ID, update_call_id, update_xml)
      expect(update_response[CODE]).to eq(204)
      sleep(SLEEP_TIME_S)
      
      complete_response = @api_instance_calls.update_call_with_http_info(BW_ACCOUNT_ID, update_call_id, $complete_call_body)
      expect(complete_response[CODE]).to eq(200)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
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
        @api_instance_calls.create_call_with_http_info(BW_ACCOUNT_ID, call_body_bad)
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 404 error' do
      dne_id = "does-not-exist"

      expect {
        @api_instance_calls.get_call_state_with_http_info(BW_ACCOUNT_ID, dne_id)
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = 'bad_username'
        config.password = 'bad_password'
      end

      expect {
        @api_instance_calls.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 403 error' do
      Bandwidth.configure do |config|
        config.username = FORBIDDEN_USERNAME
        config.password = FORBIDDEN_PASSWORD
      end

      expect {
        @api_instance_calls.get_call_state_with_http_info(BW_ACCOUNT_ID, $call_info_id)
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
