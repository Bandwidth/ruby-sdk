require_relative '../call_utils'

# Integration Tests for Bandwidth::TranscriptionsApi
describe 'TranscriptionsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @transcriptions_api_instance = Bandwidth::TranscriptionsApi.new
    @calls_api_instance = Bandwidth::CallsApi.new

    # transcription info
    $manteca_test_id = setup_manteca('CALL')
    $manteca_call_id = create_manteca_call($manteca_test_id, '/bxml/idle', @calls_api_instance)
    $transcription_id = ''
  end

  # Create Call Transcription
  describe 'create_call_transcription' do
    it 'creates a call transcription' do
      sleep(SLEEP_TIME_S)

      start_transcription_bxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><StartTranscription name=\"#{$manteca_call_id}\" tracks=\"inbound\"></StartTranscription><Pause duration=\"6\"/></Response>"
      _start_data, start_status_code = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, start_transcription_bxml)
      expect(start_status_code).to eq(204)
      sleep(SLEEP_TIME_S)

      stop_transcription_bxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><StopTranscription name=\"#{$manteca_call_id}\"></StopTranscription></Response>"
      _stop_data, stop_status_code = @calls_api_instance.update_call_bxml_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, stop_transcription_bxml)
      expect(stop_status_code).to eq(204)
      sleep(SLEEP_TIME_S)

      _complete_data, complete_status_code = @calls_api_instance.update_call_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $complete_call_body)
      expect(complete_status_code).to eq(200)
    end
  end

  # List Real Time Call Transcriptions
  describe 'list_real_time_transcriptions' do
    it 'lists call transcriptions' do
      sleep(SLEEP_TIME_S * 20)
      data, status_code, _headers = @transcriptions_api_instance.list_real_time_transcriptions_with_http_info(BW_ACCOUNT_ID, $manteca_call_id)
      
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::CallTranscriptionMetadata)
      expect(data[0].transcription_id).to be_instance_of(String)
      expect(data[0].transcription_url).to be_instance_of(String)
      expect(data[0].transcription_name).to be_instance_of(String)
      $transcription_id = data[0].transcription_id
    end
  end

  # Get Real Time Call Transcription
  describe 'get_real_time_transcription' do
    it 'gets the specified call transcription' do
      data, status_code, _headers = @transcriptions_api_instance.get_real_time_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $transcription_id)
      
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::CallTranscriptionResponse)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.call_id).to eq($manteca_call_id)
      expect(data.transcription_id).to eq($transcription_id)
      expect(data.tracks).to be_instance_of(Array)
      expect(data.tracks[0]).to be_instance_of(Bandwidth::CallTranscription)
      expect(data.tracks[0].track).to eq('inbound')
      expect(data.tracks[0].confidence).to be_instance_of(Float)
    end
  end

  # Delete Real Time Call Transcription
  describe 'delete_real_time_transcription' do
    it 'deletes the specified call transcription' do
      _data, status_code = @transcriptions_api_instance.delete_real_time_transcription_with_http_info(BW_ACCOUNT_ID, $manteca_call_id, $transcription_id)

      expect(status_code).to eq(200) # This is a bug in the API, it should return 204. VAPI-1863 should fix this.
    end
  end if false # skip due to PV issues
end
