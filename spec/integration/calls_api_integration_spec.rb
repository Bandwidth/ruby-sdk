require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::CallsApi
describe 'CallsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_voice = Bandwidth::CallsApi.new
  end

  after do
    # run after each test
  end

  # Create Call and Get Call State Information
  describe 'create_call and get_call_state' do
    it 'creates a call with amd' do
      amd_config = Bandwidth::MachineDetectionConfiguration.new(
        mode: "async",
        detection_timeout: 5.0,
        silence_timeout: 5.0,
        speech_threshold: 5.0,
        speech_end_threshold: 5.0,
        delay_result: true,
        callback_url: BASE_CALLBACK_URL + "/machineDetection",
        callback_method: "POST"
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

      call_response = @api_instance_voice.create_call_with_http_info(BW_ACCOUNT_ID, call_body)
      sleep(3)

      expect(call_response[CODE]).to eq(201)
      expect(call_response[DATA].call_id.length).to eq(47)
      expect(call_response[DATA].account_id).to eq(BW_ACCOUNT_ID)
      expect(call_response[DATA].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(call_response[DATA].to).to eq(USER_NUMBER)
      expect(call_response[DATA].from).to eq(BW_NUMBER)
      expect(call_response[DATA].call_url).to eq("https://voice.bandwidth.com/api/v2/accounts/" + BW_ACCOUNT_ID + "/calls/" + call_response[DATA].call_id)
      expect(call_response[DATA].call_timeout).to eq(30.0)
      expect(call_response[DATA].callback_timeout).to eq(15.0)
      expect(call_response[DATA].enqueued_time).to be_a(Time)
      expect(call_response[DATA].answer_method).to eq("POST")
      expect(call_response[DATA].disconnect_method).to eq("GET")
      expect(call_response[DATA].answer_url).to eq(BASE_CALLBACK_URL + "/callbacks/answer")
      expect(call_response[DATA].disconnect_url).to eq(BASE_CALLBACK_URL + "/callbacks/disconnect")
    end
  end

  # Update Call
  describe 'update_call test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Update Call BXML
  describe 'update_call_bxml test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
