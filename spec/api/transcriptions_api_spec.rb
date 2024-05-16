# Unit tests for Bandwidth::TranscriptionsApi
describe 'TranscriptionsApi' do
  # transcription info
  let(:call_id) { 'c-3f758f24-40c0bd9f-0a8e-4ab6-88d4-c88a2e961c7d' }
  let(:transcription_id) { 't-3f758f24-c7a2fc78-7c91-401a-8b2e-e542f9c40d6b' }
  let(:transcription_url) { "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}/transcriptions/#{transcription_id}" }
  let(:detected_language) { 'en-US' }
  let(:track) { 'inbound' }
  let(:text) { 'Hello World! This is an example.' }
  let(:confidence) { 0.9 }

  # stubs
  let(:list_real_time_transcriptions_headers_stub) { { 'content-type' => 'application/json' } }
  let(:list_real_time_transcriptions_body_stub) { "[{\"transcriptionId\":\"#{transcription_id}\",\"transcriptionUrl\":\"#{transcription_url}\"}]" }
  let(:get_real_time_transcription_headers_stub) { { 'content-type' => 'application/json' } }
  let(:get_real_time_transcription_body_stub) { "{\"accountId\":\"#{BW_ACCOUNT_ID}\",\"callId\":\"#{call_id}\",\"transcriptionId\":\"#{transcription_id}\",\"tracks\":[{\"detectedLanguage\":\"#{detected_language}\",\"track\":\"#{track}\",\"text\":\"#{text}\",\"confidence\":#{confidence}}]}" }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
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
      stub_request(:delete, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}/transcriptions/#{transcription_id}").
      to_return(status: 204)

      _data, status_code = @transcriptions_api_instance.delete_real_time_transcription_with_http_info(BW_ACCOUNT_ID, call_id, transcription_id)

      expect(status_code).to eq(204)
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
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}/transcriptions").
      to_return(status: 200, headers: list_real_time_transcriptions_headers_stub, body: list_real_time_transcriptions_body_stub)

      data, status_code, headers = @transcriptions_api_instance.list_real_time_transcriptions_with_http_info(BW_ACCOUNT_ID, call_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(list_real_time_transcriptions_headers_stub)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallTranscriptionMetadata)
      expect(data[0].transcription_id).to eq(transcription_id)
      expect(data[0].transcription_url).to eq(transcription_url)
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
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{call_id}/transcriptions/#{transcription_id}").
      to_return(status: 200, headers: get_real_time_transcription_headers_stub, body: get_real_time_transcription_body_stub)

      data, status_code, headers = @transcriptions_api_instance.get_real_time_transcription_with_http_info(BW_ACCOUNT_ID, call_id, transcription_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(get_real_time_transcription_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CallTranscriptionResponse)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq(call_id)
      expect(data.transcription_id).to eq(transcription_id)
      expect(data.tracks).to be_instance_of(Array)
      expect(data.tracks[0]).to be_instance_of(Bandwidth::CallTranscription)
      expect(data.tracks[0].detected_language).to eq(detected_language)
      expect(data.tracks[0].track).to eq(track)
      expect(data.tracks[0].text).to eq(text)
      expect(data.tracks[0].confidence).to eq(confidence)
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
