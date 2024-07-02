require_relative '../call_utils'

# Integration Tests for Bandwidth::RecordingsApi
describe 'RecordingsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
    end
    @recordings_api_instance = Bandwidth::RecordingsApi.new
    @calls_api_instance = Bandwidth::CallsApi.new

    # recording info
    $manteca_test_id = setup_manteca('CALL')
    $manteca_call_id = create_manteca_call($manteca_test_id, '/bxml/startLongRecording', @calls_api_instance)
    $recording_id = ''
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
      _pause_data, pause_status_code = @recordings_api_instance.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, pause_recording)
      expect(pause_status_code).to eq(200)

      sleep(SLEEP_TIME_S)
      _record_data, record_status_code = @recordings_api_instance.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, start_recording)
      expect(record_status_code).to eq(200)

      _complete_data, complete_status_code = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $complete_call_body)
      expect(complete_status_code).to eq(200)

      retries = 0
      recording_complete = false
      begin
        while !recording_complete && retries < MAX_RETRIES
          recording_complete = get_manteca_test_status($manteca_test_id)['callRecorded']
          retries += 1
          sleep(SLEEP_TIME_S)
        end
      rescue => e
        puts e.inspect
      end

      expect(recording_complete).to be true
    end
  end
  
  # Get Call Recordings
  describe 'list_account_call_recordings' do
    it 'lists account call recordings' do
      data, status_code = @recordings_api_instance.list_account_call_recordings_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data[0].application_id).to be_instance_of(String)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
    end
  end

  # List Call Recordings
  describe 'list_call_recordings' do
    it 'lists all recordings for a single call' do
      data, status_code = @recordings_api_instance.list_call_recordings_with_http_info(BW_ACCOUNT_ID, $manteca_call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data[0].application_id).to eq(MANTECA_APPLICATION_ID)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].call_id).to eq($manteca_call_id)
      expect(data[0].recording_id).to be_instance_of(String)
      expect(data[0].status).to eq('complete').or eq('partial')
      
      $recording_id = data[0].recording_id
    end
  end
  
  # Get Call Recording
  describe 'get_call_recording' do
    it 'gets a call recording by id' do
      data, status_code = @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data.application_id).to eq(MANTECA_APPLICATION_ID)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq($manteca_call_id)
      expect(data.status).to eq('complete').or eq('partial')
      expect(data.recording_id).to eq($recording_id)
    end
  end
  
  # Download Recording
  describe 'download_call_recording' do
    it 'downloads a call recording by id' do
      data, status_code = @recordings_api_instance.download_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(String)
    end
  end
  
  # Create Transcription Request
  describe 'transcribe_call_recording' do
    it 'creates a recording transcription request' do
      transcribe_recording = Bandwidth::TranscribeRecording.new(
        callback_url: MANTECA_BASE_URL + '/transcriptions',
        tag: $manteca_test_id
      )

      _data, status_code = @recordings_api_instance.transcribe_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id, transcribe_recording)
      expect(status_code).to eq(204)

      retries = 0
      transcription_complete = false
      sleep(SLEEP_TIME_S * 10)
      begin
        while !transcription_complete && retries < MAX_RETRIES
          transcription_complete = get_manteca_test_status($manteca_test_id)['callTranscribed']
          retries += 1
          sleep(SLEEP_TIME_S)
        end
      rescue => e
        puts e.inspect
      end

      expect(transcription_complete).to be true
    end
  end
  
  # Get Transcription
  describe 'get_call_transcription' do
    it 'gets the completed call recording transcription' do
      data, status_code = @recordings_api_instance.get_recording_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::RecordingTranscriptions)
      expect(data.transcripts).to be_instance_of(Array)
      expect(data.transcripts[0]).to be_instance_of(Bandwidth::Transcription)
      expect(data.transcripts[0].text).to be_instance_of(String)
      expect(data.transcripts[0].confidence).to be_instance_of(Float)
    end
  end

  # Delete Transcription
  describe 'delete_call_transcription' do
    it 'deletes the completed call recording transcription' do
      _data, status_code = @recordings_api_instance.delete_recording_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      expect(status_code).to eq(204)
    end
  end
  
  # Delete Recording Media
  describe 'delete_recording_media' do
    it 'deletes the completed call recording media' do
      _data, status_code = @recordings_api_instance.delete_recording_media_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      expect(status_code).to eq(204)
    end
  end

  # Delete Recording
  describe 'delete_recording' do
    it 'deletes the completed call recording data' do
      _data, status_code = @recordings_api_instance.delete_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      expect(status_code).to eq(204)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 404 error' do
      dne_id = 'does-not-exist'

      expect {
        @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, dne_id, dne_id)
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
        @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
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
        @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $recording_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end
end
