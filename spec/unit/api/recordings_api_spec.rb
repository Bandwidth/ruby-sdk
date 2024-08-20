# Unit tests for Bandwidth::RecordingsApi
describe 'RecordingsApi' do
  let(:call_id) { 'c-1234' }
  let(:recording_id) { 'r-1234' }
  
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @recordings_api_instance = Bandwidth::RecordingsApi.new
  end

  describe 'test an instance of RecordingsApi' do
    it 'should create an instance of RecordingsApi' do
      expect(@recordings_api_instance).to be_instance_of(Bandwidth::RecordingsApi)
    end
  end

  # Delete Recording Transcription
  describe 'delete_recording_transcription' do
    it 'deletes the completed call recording transcription' do
      _data, status_code = @recordings_api_instance.delete_recording_transcription_with_http_info(BW_ACCOUNT_ID, call_id, recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.delete_recording_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.delete_recording_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.delete_recording_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete Recording
  describe 'delete_recording' do
    it 'deletes the completed call recording data' do
      _data, status_code = @recordings_api_instance.delete_recording_with_http_info(BW_ACCOUNT_ID, call_id, recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.delete_recording(nil, '', '')
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
      _data, status_code = @recordings_api_instance.delete_recording_media_with_http_info(BW_ACCOUNT_ID, call_id, recording_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.delete_recording_media(nil, '', '')
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
      data, status_code = @recordings_api_instance.download_call_recording_with_http_info(
        BW_ACCOUNT_ID, call_id, recording_id, { header_params: { 'Accept' => 'audio/vnd.wave' } })

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.download_call_recording(nil, '', '')
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
      data, status_code = @recordings_api_instance.get_call_recording_with_http_info(BW_ACCOUNT_ID, call_id, recording_id)
      
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data.application_id.length).to eq(36)
      expect(data.account_id.length).to eq(7)
      expect(data.call_id.length).to eq(47)
      expect(data.parent_call_id.length).to eq(47)
      expect(data.recording_id.length).to eq(47)
      expect(data.to.length).to eq(12)
      expect(data.from.length).to eq(12)
      expect(data.transfer_caller_id.length).to eq(12)
      expect(data.transfer_to.length).to eq(12)
      expect(data.duration).to start_with('PT')
      expect(data.direction).to be_one_of(Bandwidth::CallDirectionEnum.all_vars)
      expect(data.channels).to be_instance_of(Integer)
      expect(data.start_time).to be_instance_of(Time)
      expect(data.end_time).to be_instance_of(Time)
      expect(data.file_format).to be_one_of(Bandwidth::FileFormatEnum.all_vars)
      expect(data.status).to be_instance_of(String)
      expect(data.media_url).to start_with('http')
      expect(data.transcription).to be_instance_of(Bandwidth::RecordingTranscriptionMetadata)
      expect(data.transcription.id.length).to eq(38)
      expect(data.transcription.status).to be_instance_of(String)
      expect(data.transcription.completed_time).to be_instance_of(Time)
      expect(data.transcription.url).to start_with('http')
      expect(data.recording_name).to be_instance_of(String)
    end if false # skip due to prism error

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.get_call_recording(nil, '', '')
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

  # Get Recording Transcription
  describe 'get_recording_transcription' do
    it 'gets the completed call recording transcription' do
      data, status_code = @recordings_api_instance.get_recording_transcription_with_http_info(BW_ACCOUNT_ID, call_id, recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::RecordingTranscriptions)
      expect(data.transcripts).to be_instance_of(Array)
      expect(data.transcripts[0]).to be_instance_of(Bandwidth::Transcription)
      expect(data.transcripts[0].text).to be_instance_of(String)
      expect(data.transcripts[0].confidence).to be_instance_of(Float)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.get_recording_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @recordings_api_instance.get_recording_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @recordings_api_instance.get_recording_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Call Recordings
  describe 'list_account_call_recordings' do
    it 'lists account call recordings' do
      data, status_code = @recordings_api_instance.list_account_call_recordings_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data[0].application_id.length).to eq(36)
      expect(data[0].account_id.length).to eq(7)
      expect(data[0].call_id.length).to eq(47)
      expect(data[0].parent_call_id.length).to eq(47)
      expect(data[0].recording_id.length).to eq(47)
      expect(data[0].to.length).to eq(12)
      expect(data[0].from.length).to eq(12)
      expect(data[0].transfer_caller_id.length).to eq(12)
      expect(data[0].transfer_to.length).to eq(12)
      expect(data[0].duration).to start_with('PT')
      expect(data[0].direction).to be_one_of(Bandwidth::CallDirectionEnum.all_vars)
      expect(data[0].channels).to be_instance_of(Integer)
      expect(data[0].start_time).to be_instance_of(Time)
      expect(data[0].end_time).to be_instance_of(Time)
      expect(data[0].file_format).to be_one_of(Bandwidth::FileFormatEnum.all_vars)
      expect(data[0].status).to be_instance_of(String)
      expect(data[0].media_url).to start_with('http')
      expect(data[0].transcription).to be_instance_of(Bandwidth::RecordingTranscriptionMetadata)
      expect(data[0].transcription.id.length).to eq(38)
      expect(data[0].transcription.status).to be_instance_of(String)
      expect(data[0].transcription.completed_time).to be_instance_of(Time)
      expect(data[0].transcription.url).to start_with('http')
      expect(data[0].recording_name).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.list_account_call_recordings(nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Call Recordings
  describe 'list_call_recordings' do
    it 'lists all recordings for a single call' do
      data, status_code = @recordings_api_instance.list_call_recordings_with_http_info(BW_ACCOUNT_ID, call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(data[0].application_id.length).to eq(36)
      expect(data[0].account_id.length).to eq(7)
      expect(data[0].call_id.length).to eq(47)
      expect(data[0].parent_call_id.length).to eq(47)
      expect(data[0].recording_id.length).to eq(47)
      expect(data[0].to.length).to eq(12)
      expect(data[0].from.length).to eq(12)
      expect(data[0].transfer_caller_id.length).to eq(12)
      expect(data[0].transfer_to.length).to eq(12)
      expect(data[0].duration).to start_with('PT')
      expect(data[0].direction).to be_one_of(Bandwidth::CallDirectionEnum.all_vars)
      expect(data[0].channels).to be_instance_of(Integer)
      expect(data[0].start_time).to be_instance_of(Time)
      expect(data[0].end_time).to be_instance_of(Time)
      expect(data[0].file_format).to be_one_of(Bandwidth::FileFormatEnum.all_vars)
      expect(data[0].status).to be_instance_of(String)
      expect(data[0].media_url).to start_with('http')
      expect(data[0].transcription).to be_instance_of(Bandwidth::RecordingTranscriptionMetadata)
      expect(data[0].transcription.id.length).to eq(38)
      expect(data[0].transcription.status).to be_instance_of(String)
      expect(data[0].transcription.completed_time).to be_instance_of(Time)
      expect(data[0].transcription.url).to start_with('http')
      expect(data[0].recording_name).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.list_call_recordings(nil, '')
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
      transcribe_recording = Bandwidth::TranscribeRecording.new(
        callback_url: BASE_CALLBACK_URL + '/transcriptions',
        tag: call_id
      )

      _data, status_code = @recordings_api_instance.transcribe_call_recording_with_http_info(BW_ACCOUNT_ID, call_id, recording_id, transcribe_recording)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.transcribe_call_recording(nil, '', '', '')
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
    it 'updates call recording' do
      pause_recording = Bandwidth::UpdateCallRecording.new(
        state: Bandwidth::RecordingStateEnum::PAUSED
      )

      _data, status_code = @recordings_api_instance.update_call_recording_state_with_http_info(BW_ACCOUNT_ID, call_id, pause_recording)

      expect(status_code).to eq(200)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @recordings_api_instance.update_call_recording_state(nil, '', {})
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
