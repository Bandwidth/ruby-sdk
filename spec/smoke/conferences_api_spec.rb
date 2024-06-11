require_relative '../call_utils'

# Integration Tests for Bandwidth::ConferencesApi
describe 'ConferencesApi Integration Tests' do
  before(:all) do
    WebMock.allow_net_connect!
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
    end
    @conferences_api_instance = Bandwidth::ConferencesApi.new
    @calls_api_instance = Bandwidth::CallsApi.new

    # conference info
    $manteca_test_id = setup_manteca('conference')
    $manteca_call_id = create_manteca_call($manteca_test_id, '/bxml/joinConferencePause', @calls_api_instance)
    $conference_id = ''
    $recording_id = ''
  end

  after(:all) do
    WebMock.disable_net_connect!
  end
  
  # Get Conferences
  describe 'list_conferences' do
    it 'list all conferences' do
      conference_opts = {
        name: $manteca_test_id
      }

      sleep(SLEEP_TIME_S)
      data, status_code = @conferences_api_instance.list_conferences_with_http_info(BW_ACCOUNT_ID, conference_opts)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::Conference)
      expect(data[0].id).to be_instance_of(String)
      $conference_id = data[0].id
    end
  end

  # Get Conference Information
  describe 'get_conference' do
    it 'get a conference by id' do
      data, status_code = @conferences_api_instance.get_conference_with_http_info(BW_ACCOUNT_ID, $conference_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::Conference)
      expect(data.id).to eq($conference_id)
      expect(data.name).to eq($manteca_test_id)
      expect(data.tag).to eq($manteca_test_id)
    end
  end
  
  # Get Conference Member
  describe 'get_conference_member' do
    it 'gets a conference member by call id' do
      data, status_code = @conferences_api_instance.get_conference_member_with_http_info(BW_ACCOUNT_ID, $conference_id, $manteca_call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ConferenceMember)
      expect(data.conference_id).to eq($conference_id)
      expect(data.call_id).to eq($manteca_call_id)
    end
  end
  
  # Update Conference Member
  describe 'update_conference_member' do
    it 'updates a conference member by call id' do
      update_conference_member = Bandwidth::UpdateConferenceMember.new(
        mute: false
      )

      _data, status_code = @conferences_api_instance.update_conference_member_with_http_info(BW_ACCOUNT_ID, $conference_id, $manteca_call_id, update_conference_member)
      expect(status_code).to eq(204)
    end
  end

  # Update Conference
  describe 'update_conference' do
    it 'updates a conference' do
      update_conference_body = Bandwidth::UpdateConference.new(
        status: Bandwidth::ConferenceStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + '/bxml/pause',
        redirect_method: Bandwidth::RedirectMethodEnum::POST,
        username: 'username',
        password: 'password',
        redirect_fallback_url: MANTECA_BASE_URL + '/bxml/pause',
        redirect_fallback_method: Bandwidth::RedirectMethodEnum::POST,
        fallback_username: 'username',
        fallback_password: 'password'
      )

      _data, status_code = @conferences_api_instance.update_conference_with_http_info(BW_ACCOUNT_ID, $conference_id, update_conference_body)
      expect(status_code).to eq(204)
    end
  end

  # Update Conference BXML
  describe 'update_conference_bxml' do
    it 'updates a conference using bxml' do
      update_bxml = '<?xml version="1.0" encoding="UTF-8"?><Bxml><StartRecording/><SpeakSentence locale="en_US" gender="female" voice="susan">This should be a conference recording.</SpeakSentence><StopRecording/></Bxml>'

      _data, status_code = @conferences_api_instance.update_conference_bxml_with_http_info(BW_ACCOUNT_ID, $conference_id, update_bxml)
      expect(status_code).to eq(204)

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
  
  # Get Conference Recordings
  describe 'list_conference_recordings' do
    it 'lists recordings for a conference' do
      data, status_code = @conferences_api_instance.list_conference_recordings_with_http_info(BW_ACCOUNT_ID, $conference_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data[0].conference_id).to eq($conference_id)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].name).to eq($manteca_test_id)
      expect(data[0].status).to eq('complete').or eq('partial')
      expect(data[0].recording_id).to be_instance_of(String)
      expect(data[0].file_format).to eq(Bandwidth::FileFormatEnum::WAV)

      $recording_id = data[0].recording_id
    end
  end
  
  # Get Conference Recording Information
  describe 'get_conference_recording' do
    it 'gets a conference recording by id' do
      data, status_code = @conferences_api_instance.get_conference_recording_with_http_info(BW_ACCOUNT_ID, $conference_id, $recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data.conference_id).to eq($conference_id)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.name).to eq($manteca_test_id)
      expect(data.status).to eq('complete').or eq('partial')
      expect(data.recording_id).to be_instance_of(String)
      expect(data.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
    end
  end

  # Download Conference Recording
  describe 'download_conference_recording test' do
    it 'should work' do
      data, status_code = @conferences_api_instance.download_conference_recording_with_http_info(BW_ACCOUNT_ID, $conference_id, $recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(String)
    end
  end
end
