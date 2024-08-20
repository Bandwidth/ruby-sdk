# Unit tests for Bandwidth::ConferencesApi
describe 'ConferencesApi' do
  let(:call_id) { 'c-1234' }
  let(:conference_id) { 'c-4321' }
  let(:recording_id) { 'r-1234' }
    
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.return_binary_data = true
      config.host = '127.0.0.1:4010'
    end
    @conferences_api_instance = Bandwidth::ConferencesApi.new
  end
  
  describe 'test an instance of ConferencesApi' do
    it 'should create an instance of ConferencesApi' do
      expect(@conferences_api_instance).to be_instance_of(Bandwidth::ConferencesApi)
    end
  end
  
  # Download Conference Recording
  describe 'download_conference_recording test' do
    it 'download a conference recording' do
      data, status_code = @conferences_api_instance.download_conference_recording_with_http_info(
        BW_ACCOUNT_ID, conference_id, recording_id, { header_params: { 'Accept' => 'audio/vnd.wave' } })

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.download_conference_recording(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.download_conference_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @conferences_api_instance.download_conference_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Conference Information
  describe 'get_conference' do
    it 'get a conference by id' do
      data, status_code = @conferences_api_instance.get_conference_with_http_info(BW_ACCOUNT_ID, conference_id)
      
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::Conference)
      expect(data.id.length).to eq(50)
      expect(data.name).to be_instance_of(String)
      expect(data.created_time).to be_instance_of(Time)
      expect(data.completed_time).to be_instance_of(Time)
      expect(data.conference_event_url).to start_with('http')
      expect(data.conference_event_method).to be_one_of(Bandwidth::CallbackMethodEnum.all_vars)
      expect(data.tag).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.get_conference(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
  
  # Get Conference Member
  describe 'get_conference_member' do
    it 'gets a conference member by call id' do
      data, status_code = @conferences_api_instance.get_conference_member_with_http_info(BW_ACCOUNT_ID, conference_id, call_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ConferenceMember)
      expect(data.call_id.length).to eq(47)
      expect(data.conference_id.length).to eq(50)
      expect(data.member_url).to start_with('http')
      expect(data.mute).to be_one_of([true, false])
      expect(data.hold).to be_one_of([true, false])
      expect(data.call_ids_to_coach).to be_instance_of(Array)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.get_conference_member(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference_member(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing member_id' do
      expect {
        @conferences_api_instance.get_conference_member(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Conference Recording Information
  describe 'get_conference_recording' do
    it 'gets a conference recording by id' do
      data, status_code = @conferences_api_instance.get_conference_recording_with_http_info(BW_ACCOUNT_ID, conference_id, recording_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data.account_id.length).to eq(7)
      expect(data.conference_id.length).to eq(50)
      expect(data.name).to be_instance_of(String)
      expect(data.recording_id.length).to eq(47)
      expect(data.duration).to start_with('PT')
      expect(data.channels).to be_instance_of(Integer)
      expect(data.start_time).to be_instance_of(Time)
      expect(data.end_time).to be_instance_of(Time)
      expect(data.file_format).to be_one_of(Bandwidth::FileFormatEnum.all_vars)
      expect(data.status).to be_instance_of(String)
      expect(data.media_url).to start_with('http')
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.get_conference_recording(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @conferences_api_instance.get_conference_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Conference Recordings
  describe 'list_conference_recordings' do
    it 'lists recordings for a conference' do
      data, status_code = @conferences_api_instance.list_conference_recordings_with_http_info(BW_ACCOUNT_ID, conference_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data[0].account_id.length).to eq(7)
      expect(data[0].conference_id.length).to eq(50)
      expect(data[0].name).to be_instance_of(String)
      expect(data[0].recording_id.length).to eq(47)
      expect(data[0].duration).to start_with('PT')
      expect(data[0].channels).to be_instance_of(Integer)
      expect(data[0].start_time).to be_instance_of(Time)
      expect(data[0].end_time).to be_instance_of(Time)
      expect(data[0].file_format).to be_one_of(Bandwidth::FileFormatEnum.all_vars)
      expect(data[0].status).to be_instance_of(String)
      expect(data[0].media_url).to start_with('http')
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.list_conference_recordings(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.list_conference_recordings(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Conferences
  describe 'list_conferences' do
    it 'list all conferences' do
      conference_opts = {
        name: call_id
      }

      data, status_code = @conferences_api_instance.list_conferences_with_http_info(BW_ACCOUNT_ID, conference_opts)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::Conference)
      expect(data[0].id.length).to eq(50)
      expect(data[0].name).to be_instance_of(String)
      expect(data[0].created_time).to be_instance_of(Time)
      expect(data[0].completed_time).to be_instance_of(Time)
      expect(data[0].conference_event_url).to start_with('http')
      expect(data[0].conference_event_method).to be_one_of(Bandwidth::CallbackMethodEnum.all_vars)
      expect(data[0].tag).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.list_conferences(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for an invalid page_size' do
      expect {
        @conferences_api_instance.list_conferences(BW_ACCOUNT_ID, { page_size: 1001 })
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for an invalid page_size' do
      expect {
        @conferences_api_instance.list_conferences(BW_ACCOUNT_ID, { page_size: 0 })
      }.to raise_error(ArgumentError)
    end
  end

  # Update Conference
  describe 'update_conference' do
    it 'updates a conference' do
      update_conference_body = Bandwidth::UpdateConference.new(
        status: Bandwidth::ConferenceStateEnum::ACTIVE,
        redirect_url: BASE_CALLBACK_URL + '/bxml/pause',
        redirect_method: Bandwidth::RedirectMethodEnum::POST,
        username: 'username',
        password: 'password',
        redirect_fallback_url: BASE_CALLBACK_URL + '/bxml/pause',
        redirect_fallback_method: Bandwidth::RedirectMethodEnum::POST,
        fallback_username: 'username',
        fallback_password: 'password'
      )

      _data, status_code = @conferences_api_instance.update_conference_with_http_info(BW_ACCOUNT_ID, conference_id, update_conference_body)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.update_conference(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing update_conference' do
      expect {
        @conferences_api_instance.update_conference(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end
  
  # Update Conference BXML
  describe 'update_conference_bxml' do
    it 'updates a conference using bxml' do
      update_bxml = '<?xml version="1.0" encoding="UTF-8"?><Bxml><StartRecording/><SpeakSentence locale="en_US" gender="female" voice="susan">This should be a conference recording.</SpeakSentence><StopRecording/></Bxml>'

      _data, status_code = @conferences_api_instance.update_conference_bxml_with_http_info(BW_ACCOUNT_ID, conference_id, update_bxml)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.update_conference_bxml(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference_bxml(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @conferences_api_instance.update_conference_bxml(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Conference Member
  describe 'update_conference_member' do
    it 'updates a conference member by call id' do
      update_conference_member = Bandwidth::UpdateConferenceMember.new(
        mute: false
      )

      _data, status_code = @conferences_api_instance.update_conference_member_with_http_info(BW_ACCOUNT_ID, conference_id, call_id, update_conference_member)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @conferences_api_instance.update_conference_member(nil, '', '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, nil, '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing member_id' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, '', nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing update_conference_member' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, '', '', nil)
      }.to raise_error(ArgumentError)
    end
  end
end
