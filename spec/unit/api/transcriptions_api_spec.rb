# Unit tests for Bandwidth::TranscriptionsApi
describe 'TranscriptionsApi' do
  let(:call_id) { 'c-1234' }
  let(:transcription_id) { 't-1234' }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @transcriptions_api_instance = Bandwidth::TranscriptionsApi.new
  end

  describe 'test an instance of TranscriptionsApi' do
    it 'should create an instance of TranscriptionsApi' do
      expect(@transcriptions_api_instance).to be_instance_of(Bandwidth::TranscriptionsApi)
    end
  end

  # Delete Call Transcription
  describe 'delete_real_time_transcription' do
    it 'deletes the specified call transcription' do
      _data, status_code = @transcriptions_api_instance.delete_real_time_transcription_with_http_info(BW_ACCOUNT_ID, call_id, transcription_id)

      expect(status_code).to eq(200)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @transcriptions_api_instance.delete_real_time_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @transcriptions_api_instance.delete_real_time_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing transcription_id' do
      expect {
        @transcriptions_api_instance.delete_real_time_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Call Transcriptions
  describe 'list_real_time_transcriptions' do
    it 'lists call transcriptions' do
      data, status_code = @transcriptions_api_instance.list_real_time_transcriptions_with_http_info(BW_ACCOUNT_ID, call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallTranscriptionMetadata)
      expect(data[0].transcription_id).to be_instance_of(String)
      expect(data[0].transcription_url).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @transcriptions_api_instance.list_real_time_transcriptions(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @transcriptions_api_instance.list_real_time_transcriptions(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Call Transcription
  describe 'get_real_time_transcription' do
    it 'gets the specified call transcription' do
      data, status_code = @transcriptions_api_instance.get_real_time_transcription_with_http_info(BW_ACCOUNT_ID, call_id, transcription_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::CallTranscriptionResponse)
      expect(data.account_id.length).to eq(7)
      expect(data.call_id.length).to eq(47)
      expect(data.transcription_id).to be_instance_of(String)
      expect(data.tracks).to be_instance_of(Array)
      expect(data.tracks[0]).to be_instance_of(Bandwidth::CallTranscription)
      expect(data.tracks[0].detected_language).to be_one_of(Bandwidth::CallTranscriptionDetectedLanguageEnum.all_vars)
      expect(data.tracks[0].track).to be_one_of(Bandwidth::CallTranscriptionTrackEnum.all_vars)
      expect(data.tracks[0].transcript).to be_instance_of(String)
      expect(data.tracks[0].confidence).to be_instance_of(Float)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @transcriptions_api_instance.get_real_time_transcription(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing call_id' do
      expect {
        @transcriptions_api_instance.get_real_time_transcription(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing transcription_id' do
      expect {
        @transcriptions_api_instance.get_real_time_transcription(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end
end
