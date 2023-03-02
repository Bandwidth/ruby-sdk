require 'spec_helper'
require 'json'
require_relative '../call_utils'

# Integration Tests for Bandwidth::RecordingsApi
describe 'RecordingsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
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

      retries = 0
      recording_complete = false
      begin
        while !recording_complete && retries < MAX_RETRIES
          recording_complete = get_manteca_test_status($manteca_test_id)["callRecorded"]
          retries += 1
          sleep(SLEEP_TIME_S)
        end
      rescue => e
        puts e.inspect
      end

      expect(recording_complete).to be_instance_of(TrueClass)
    end
  end
  
  # Get Call Recordings
  describe 'list_account_call_recordings' do
    it 'lists account call recordings' do
      response = @api_instance_recordings.list_account_call_recordings_with_http_info(BW_ACCOUNT_ID)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(response[DATA][0].application_id).to eq(MANTECA_APPLICATION_ID)
      expect(response[DATA][0].account_id).to eq(BW_ACCOUNT_ID)
    end
  end

  # List Call Recordings
  describe 'list_call_recordings' do
    it 'lists all recordings for a single call' do
      response = @api_instance_recordings.list_call_recordings_with_http_info(BW_ACCOUNT_ID, $manteca_call_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(response[DATA][0].application_id).to eq(MANTECA_APPLICATION_ID)
      expect(response[DATA][0].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA][0].call_id).to eq($manteca_call_id)
      expect(response[DATA][0].recording_id).to be_instance_of(String)
      expect(response[DATA][0].status).to eq('complete').or eq('partial')
      
      $recording_id = response[DATA][0].recording_id
    end
  end
  
  # Get Call Recording
  describe 'get_call_recording' do
    it 'gets a call recording by id' do
      response = @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      
      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(response[DATA].application_id).to eq(MANTECA_APPLICATION_ID)
      expect(response[DATA].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA].call_id).to eq($manteca_call_id)
      expect(response[DATA].status).to eq('complete').or eq('partial')
      expect(response[DATA].recording_id).to eq($recording_id)
    end
  end
  
    # Download Recording
    describe 'download_call_recording' do
      it 'downloads a call recording by id' do
        response = @api_instance_recordings.download_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)

        expect(response[CODE]).to eq(200)
        expect(response[DATA]).to be_instance_of(String)
      end
    end
  
  # Create Transcription Request
  describe 'transcribe_call_recording' do
    it 'creates a transcription request' do
      transcribe_recording = Bandwidth::TranscribeRecording.new(
        callback_url: MANTECA_BASE_URL + "/transcriptions",
        tag: $manteca_test_id
      )

      response = @api_instance_recordings.transcribe_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id, transcribe_recording)
      expect(response[CODE]).to eq(204)

      retries = 0
      transcription_complete = false
      sleep(SLEEP_TIME_S * 10)
      begin
        while !transcription_complete && retries < MAX_RETRIES
          transcription_complete = get_manteca_test_status($manteca_test_id)["callTranscribed"]
          retries += 1
          sleep(SLEEP_TIME_S)
        end
      rescue => e
        puts e.inspect
      end

      expect(transcription_complete).to be_instance_of(TrueClass)
    end
  end
  
    # Get Transcription
    describe 'get_call_transcription' do
      it 'gets the completed call recording transcription' do
        response = @api_instance_recordings.get_call_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)

        expect(response[CODE]).to eq(200)
        expect(response[DATA]).to be_instance_of(Bandwidth::TranscriptionList)
        expect(response[DATA].transcripts[0]).to be_instance_of(Bandwidth::Transcription)
        expect(response[DATA].transcripts[0].text).to be_instance_of(String)
        expect(response[DATA].transcripts[0].confidence).to be_instance_of(Float)
      end
    end

  # Delete Transcription
  describe 'delete_call_transcription' do
    it 'deletes the completed call recording transcription' do
      response = @api_instance_recordings.delete_call_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      expect(response[CODE]).to eq(204)
    end
  end
  
    # Delete Recording Media
    describe 'delete_recording_media' do
      it 'deletes the completed call recording media' do
        response = @api_instance_recordings.delete_recording_media_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
        expect(response[CODE]).to eq(204)
      end
    end

  # Delete Recording
  describe 'delete_recording' do
    it 'deletes the completed call recording data' do
      response = @api_instance_recordings.delete_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      expect(response[CODE]).to eq(204)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 404 error' do
      dne_id = "does-not-exist"

      expect {
        @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, dne_id, dne_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
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
        @api_instance_recordings.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
