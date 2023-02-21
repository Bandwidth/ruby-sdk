require 'spec_helper'
require 'json'
require_relative '../manteca_utils'

# Integration Tests for Bandwidth::RecordingsApi
describe 'RecordingsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_recordings = Bandwidth::RecordingsApi.new
    @api_instance_calls = Bandwidth::CallsApi.new
    $manteca_test_id = setup_manteca('CALL')
    $manteca_call_id = create_manteca_call($manteca_test_id, "/bxml/startLongRecording", @api_instance_calls)
    $recording_id = ""
  end
 
  # Update Recording
  describe 'update_call_recording_state' do
    it 'updates and ends the manteca call recording' do
      pause_recording = Bandwidth::UpdateCallRecording.new(
        state: Bandwidth::RecordingStateEnum::PAUSED
      )

      start_recording = Bandwidth::UpdateCallRecording.new(
        state: Bandwidth::RecordingStateEnum::RECORDING
      )

      sleep(SLEEP_TIME_S * 2)
      pause_response = @api_instance_recordings.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, pause_recording)
      expect(pause_response[CODE]).to eq(200)

      sleep(SLEEP_TIME_S)
      record_response = @api_instance_recordings.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, start_recording)
      expect(record_response[CODE]).to eq(200)

      complete_response = @api_instance_calls.update_call_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $complete_call_body)
      expect(complete_response[CODE]).to eq(200)
    end
  end

  # Delete Transcription
  describe 'delete_call_transcription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Delete Recording
  describe 'delete_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Delete Recording Media
  describe 'delete_recording_media test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Download Recording
  describe 'download_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Call Recording
  describe 'get_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Transcription
  describe 'get_call_transcription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # List Call Recordings
  describe 'list_call_recordings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end
  
  # Create Transcription Request
  describe 'transcribe_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Call Recordings
  describe 'list_account_call_recordings' do
    it 'lists account call recordings' do
      response = @api_instance_recordings.list_account_call_recordings_with_http_info(BW_ACCOUNT_ID)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0].application_id).to eq(MANTECA_APPLICATION_ID)
      expect(response[DATA][0].account_id).to eq(BW_ACCOUNT_ID)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 404 error' do
      dne_id = "does-not-exist"

      expect {
        @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, dne_id, dne_id)
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
        @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
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
        @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
