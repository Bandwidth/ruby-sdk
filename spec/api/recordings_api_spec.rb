# Unit tests for Bandwidth::RecordingsApi
describe 'RecordingsApi' do
  before do
    Bandwidth.configure do |config|
      config.return_binary_data = true
      config.debugging = true
    end
    @recordings_api_instance = Bandwidth::RecordingsApi.new

    # recording info
    @call_id = 'c-3f758f24-40c0bd9f-0a8e-4ab6-88d4-c88a2e961c7d'
    @recording_id = 'r-fbe05094-87f9b821-e110-4bfb-ac57-82b2bf2bb3d5'
    @duration = 'PT4.478S'
    @direction = Bandwidth::CallDirectionEnum::OUTBOUND
    @channels = 1
    @start_time = '2023-06-26T14:58:51.195Z'
    @end_time = '2023-06-26T14:58:57.502Z'
    @file_format = Bandwidth::FileFormatEnum::WAV
    @status = 'complete'
    @media_url = "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/media"
    @text = 'Now a recording, a long pause.'
    @confidence = 0.975
    @test_id = 'test id'

    # stubs
    @download_call_recording_body_stub = 'RIFFFWAVEfmtLISTINFOISFTLavf58.45.100data'
    @download_call_recording_headers_stub = { 'content-type' => 'audio/vnd.wave', 'content-length' => "#{@download_call_recording_body_stub.length}" }
    @get_call_recording_headers_stub = { 'content-type' => 'application/json' }
    @get_call_recording_body_stub = "{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{@call_id}\",\"recordingId\":\"#{@recording_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"duration\":\"#{@duration}\",\"direction\":\"#{@direction}\",\"channels\":#{@channels},\"startTime\":\"#{@start_time}\",\"endTime\":\"#{@end_time}\",\"fileFormat\":\"#{@file_format}\",\"status\":\"#{@status}\",\"mediaUrl\":\"#{@media_url}\"}"
    @get_call_transcription_headers_stub = { 'content-type' => 'application/json' }
    @get_call_transcription_body_stub = "{\"transcripts\":[{\"text\":\"#{@text}\",\"confidence\":#{@confidence}}]}"
    @list_account_call_recordings_headers_stub = { 'content-type' => 'application/json' }
    @list_account_call_recordings_body_stub = "[{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{@call_id}\",\"recordingId\":\"#{@recording_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"duration\":\"#{@duration}\",\"direction\":\"#{@direction}\",\"channels\":#{@channels},\"startTime\":\"#{@start_time}\",\"endTime\":\"#{@end_time}\",\"fileFormat\":\"#{@file_format}\",\"status\":\"#{@status}\",\"mediaUrl\":\"#{@media_url}\"}]"
    @list_call_recordings_headers_stub = { 'content-type' => 'application/json' }
    @list_call_recordings_body_stub = "[{\"applicationId\":\"#{BW_VOICE_APPLICATION_ID}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{@call_id}\",\"recordingId\":\"#{@recording_id}\",\"to\":\"#{USER_NUMBER}\",\"from\":\"#{BW_NUMBER}\",\"duration\":\"#{@duration}\",\"direction\":\"#{@direction}\",\"channels\":#{@channels},\"startTime\":\"#{@start_time}\",\"endTime\":\"#{@end_time}\",\"fileFormat\":\"#{@file_format}\",\"status\":\"#{@status}\",\"mediaUrl\":\"#{@media_url}\"}]"
    @update_call_recording_state_headers_stub = { 'content-length' => '0' }
  end

  describe 'test an instance of RecordingsApi' do
    it 'should create an instance of RecordingsApi' do
      expect(@recordings_api_instance).to be_instance_of(Bandwidth::RecordingsApi)
    end
  end

  # Delete Transcription
  describe 'delete_call_transcription' do
    it 'deletes the completed call recording transcription' do
      stub_request(:delete, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/transcription").
      to_return(status: 204)

      data, status_code, headers = @recordings_api_instance.delete_call_transcription_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.delete_call_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.delete_call_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.delete_call_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete Recording
  describe 'delete_recording' do
    it 'deletes the completed call recording data' do
      stub_request(:delete, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}").
      to_return(status: 204)

      data, status_code, headers = @recordings_api_instance.delete_recording_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.delete_recording(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.delete_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.delete_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete Recording Media
  describe 'delete_recording_media' do
    it 'deletes the completed call recording media' do
      stub_request(:delete, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/media").
      to_return(status: 204)

      data, status_code, headers = @recordings_api_instance.delete_recording_media_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.delete_recording_media(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.delete_recording_media(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.delete_recording_media(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Download Recording
  describe 'download_call_recording' do
    it 'downloads a call recording by id' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/media").
      to_return(status: 200, headers: @download_call_recording_headers_stub, body: @download_call_recording_body_stub)

      data, status_code, headers = @recordings_api_instance.download_call_recording_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@download_call_recording_headers_stub)
      expect(data).to eq(@download_call_recording_body_stub)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.download_call_recording(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.download_call_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.download_call_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Call Recording
  describe 'get_call_recording' do
    it 'gets a call recording by id' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}").
      to_return(status: 200, headers: @get_call_recording_headers_stub, body: @get_call_recording_body_stub)

      data, status_code, headers = @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)
      
      expect(status_code).to eq(200)
      expect(headers).to eq(@get_call_recording_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data.application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq(@call_id)
      expect(data.recording_id).to eq(@recording_id)
      expect(data.to).to eq(USER_NUMBER)
      expect(data.from).to eq(BW_NUMBER)
      expect(data.duration).to eq(@duration)
      expect(data.direction).to eq(@direction)
      expect(data.channels).to eq(@channels)
      expect(data.start_time).to eq(Time.parse(@start_time))
      expect(data.end_time).to eq(Time.parse(@end_time))
      expect(data.file_format).to eq(@file_format)
      expect(data.status).to eq(@status)
      expect(data.media_url).to eq(@media_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.get_call_recording(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.get_call_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.get_call_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Transcription
  describe 'get_call_transcription' do
    it 'gets the completed call recording transcription' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/transcription").
      to_return(status: 200, headers: @get_call_transcription_headers_stub, body: @get_call_transcription_body_stub)

      data, status_code, headers = @recordings_api_instance.get_call_transcription_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::TranscriptionList)
      expect(data.transcripts).to be_instance_of(Array)
      expect(data.transcripts[0]).to be_instance_of(Bandwidth::Transcription)
      expect(data.transcripts[0].text).to eq(@text)
      expect(data.transcripts[0].confidence).to eq(@confidence)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.get_call_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.get_call_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.get_call_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Call Recordings
  describe 'list_account_call_recordings' do
    it 'lists account call recordings' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/recordings").
      to_return(status: 200, headers: @list_account_call_recordings_headers_stub, body: @list_account_call_recordings_body_stub)

      data, status_code, headers = @recordings_api_instance.list_account_call_recordings_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data[0].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].call_id).to eq(@call_id)
      expect(data[0].recording_id).to eq(@recording_id)
      expect(data[0].to).to eq(USER_NUMBER)
      expect(data[0].from).to eq(BW_NUMBER)
      expect(data[0].duration).to eq(@duration)
      expect(data[0].direction).to eq(@direction)
      expect(data[0].channels).to eq(@channels)
      expect(data[0].start_time).to eq(Time.parse(@start_time))
      expect(data[0].end_time).to eq(Time.parse(@end_time))
      expect(data[0].file_format).to eq(@file_format)
      expect(data[0].status).to eq(@status)
      expect(data[0].media_url).to eq(@media_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.list_account_call_recordings(nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Call Recordings
  describe 'list_call_recordings' do
    it 'lists all recordings for a single call' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings").
      to_return(status: 200, headers: @list_call_recordings_headers_stub, body: @list_call_recordings_body_stub)

      data, status_code, headers = @recordings_api_instance.list_call_recordings_with_http_info(BW_ACCOUNT_ID, @call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0].application_id).to eq(BW_VOICE_APPLICATION_ID)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].call_id).to eq(@call_id)
      expect(data[0].recording_id).to eq(@recording_id)
      expect(data[0].to).to eq(USER_NUMBER)
      expect(data[0].from).to eq(BW_NUMBER)
      expect(data[0].duration).to eq(@duration)
      expect(data[0].direction).to eq(@direction)
      expect(data[0].channels).to eq(@channels)
      expect(data[0].start_time).to eq(Time.parse(@start_time))
      expect(data[0].end_time).to eq(Time.parse(@end_time))
      expect(data[0].file_format).to eq(@file_format)
      expect(data[0].status).to eq(@status)
      expect(data[0].media_url).to eq(@media_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.list_call_recordings(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.list_call_recordings(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Create Transcription Request
  describe 'transcribe_call_recording' do
    it 'creates a transcription request' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recordings/#{@recording_id}/transcription").
      to_return(status: 204)

      transcribe_recording = Bandwidth::TranscribeRecording.new(
        callback_url: BASE_CALLBACK_URL + '/transcriptions',
        tag: @test_id
      )

      data, status_code, headers = @recordings_api_instance.transcribe_call_recording_with_http_info(BW_ACCOUNT_ID, @call_id, @recording_id, transcribe_recording)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.transcribe_call_recording(nil, '', '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.transcribe_call_recording(BW_ACCOUNT_ID, nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.transcribe_call_recording(BW_ACCOUNT_ID, '', nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing transcribe_recording' do
      expect {
        @recordings_api_instance.transcribe_call_recording(BW_ACCOUNT_ID, '', '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Recording
  describe 'update_call_recording_state' do
    it 'updates and ends the manteca call recording' do
      stub_request(:put, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}/recording").
      to_return(status: 200, headers: @update_call_recording_state_headers_stub)

      pause_recording = Bandwidth::UpdateCallRecording.new(
        state: Bandwidth::RecordingStateEnum::PAUSED
      )

      data, status_code, headers = @recordings_api_instance.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, @call_id, pause_recording)

      expect(status_code).to eq(200)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @recordings_api_instance.update_call_recording_state(nil, '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.update_call_recording_state(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing update_call_recording' do
      expect {
        @recordings_api_instance.update_call_recording_state(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

end
