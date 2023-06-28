# Unit tests for Bandwidth::ConferencesApi
describe 'ConferencesApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.return_binary_data = true
      config.debugging = true
    end
    @conferences_api_instance = Bandwidth::ConferencesApi.new

    # conference info
    @test_id = 'ruby-3.1.3_macOS_conference_1687791527'
    @conference_id = 'conf-3f758f24-6711b6d2-0d44-495d-afc8-2555c3ce5f4f'
    @created_time = '2023-06-26T14:58:49.471Z'
    @conference_event_url = 'https://amazonaws.com/prod/conferenceEvents'
    @conference_event_method = 'POST'
    @call_id = 'c-3f758f24-cd77b08f-97c2-4311-965a-a1ac8ed8f340'
    @recording_id = 'r-fbe05094-7bf4b314-91fe-4bdd-a39b-500cdc873d3a'
    @start_time = '2023-06-26T14:58:51.195Z'
    @end_time = '2023-06-26T14:58:57.502Z'
    @duration = 'PT6.3S'
    @channels = 1
    @file_format = Bandwidth::FileFormatEnum::WAV
    @status = 'complete'
    @member_url = "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/members/#{@call_id}"
    @media_url = "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/recordings/#{@recording_id}/media"
    @active_members = "[{\"callId\":\"#{@call_id}\",\"conferenceId\":\"#{@conference_id}\",\"memberUrl\":\"#{@member_url}\",\"mute\":false,\"hold\":false,\"callIdsToCoach\":[]}]"
    
    # stubs
    @list_conferences_headers_stub = { "content-type" => "application/json" }
    @list_conferences_body_stub = "[{\"id\":\"#{@conference_id}\",\"name\":\"#{@test_id}\",\"createdTime\":\"#{@created_time}\",\"conferenceEventUrl\":\"#{@conference_event_url}\",\"conferenceEventMethod\":\"#{@conference_event_method}\",\"tag\":\"#{@test_id}\"}]"
    @get_conference_headers_stub = { "content-type" => "application/json" }
    @get_conference_body_stub = "{\"id\":\"#{@conference_id}\",\"name\":\"#{@test_id}\",\"createdTime\":\"#{@created_time}\",\"conferenceEventUrl\":\"#{@conference_event_url}\",\"conferenceEventMethod\":\"#{@conference_event_method}\",\"tag\":\"#{@test_id}\",\"activeMembers\":#{@active_members}}"
    @get_conference_member_headers_stub = { "content-type" => "application/json" }
    @get_conference_member_body_stub = "{\"callId\":\"#{@call_id}\",\"conferenceId\":\"#{@conference_id}\",\"memberUrl\":\"#{@member_url}\",\"mute\":false,\"hold\":false,\"callIdsToCoach\":[]}"
    @list_conference_recordings_headers_stub = { "content-type" => "application/json" }
    @list_conference_recordings_body_stub = "[{\"accountId\":\"#{BW_ACCOUNT_ID}\",\"conferenceId\":\"#{@conference_id}\",\"name\":\"#{@test_id}\",\"recordingId\":\"#{@recording_id}\",\"duration\":\"#{@duration}\",\"channels\":#{@channels},\"startTime\":\"#{@start_time}\",\"endTime\":\"#{@end_time}\",\"fileFormat\":\"#{@file_format}\",\"status\":\"#{@status}\",\"mediaUrl\":\"#{@media_url}\"}]"
    @get_conference_recording_headers_stub = { "content-type" => "application/json" }
    @get_conference_recording_body_stub = "{\"accountId\":\"#{BW_ACCOUNT_ID}\",\"conferenceId\":\"#{@conference_id}\",\"name\":\"#{@test_id}\",\"recordingId\":\"#{@recording_id}\",\"duration\":\"#{@duration}\",\"channels\":#{@channels},\"startTime\":\"#{@start_time}\",\"endTime\":\"#{@end_time}\",\"fileFormat\":\"#{@file_format}\",\"status\":\"#{@status}\",\"mediaUrl\":\"#{@media_url}\"}"
    @download_conference_recording_body_stub = "RIFFWAVEfmtLISTINFOISFTLavf58.45.100data"
    @download_conference_recording_headers_stub = { "content-type" => "audio/vnd.wave", "content-length" => "#{@download_conference_recording_body_stub.length}" }
  end
  
  describe 'test an instance of ConferencesApi' do
    it 'should create an instance of ConferencesApi' do
      expect(@conferences_api_instance).to be_instance_of(Bandwidth::ConferencesApi)
    end
  end
  
  # Download Conference Recording
  describe 'download_conference_recording test' do
    it 'should work' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/recordings/#{@recording_id}/media").
      to_return(status: 200, headers: @download_conference_recording_headers_stub, body: @download_conference_recording_body_stub)

      data, status_code, headers = @conferences_api_instance.download_conference_recording_with_http_info(BW_ACCOUNT_ID, @conference_id, @recording_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@download_conference_recording_headers_stub)
      expect(data).to eq(@download_conference_recording_body_stub)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.download_conference_recording(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.download_conference_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @conferences_api_instance.download_conference_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Conference Information
  describe 'get_conference' do
    it 'get a conference by id' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}").
      to_return(status: 200, headers: @get_conference_headers_stub, body: @get_conference_body_stub)

      data, status_code, headers = @conferences_api_instance.get_conference_with_http_info(BW_ACCOUNT_ID, @conference_id)
      
      expect(status_code).to eq(200)
      expect(headers).to eq(@get_conference_headers_stub)
      expect(data).to be_instance_of(Bandwidth::Conference)
      expect(data.id).to eq(@conference_id)
      expect(data.name).to eq(@test_id)
      expect(data.tag).to eq(@test_id)
      expect(data.created_time).to eq(Time.parse(@created_time))
      expect(data.conference_event_url).to eq(@conference_event_url)
      expect(data.conference_event_method).to eq(@conference_event_method)
      expect(data.active_members).to be_instance_of(Array)
      expect(data.active_members[0]).to be_instance_of(Bandwidth::ConferenceMember)
      expect(data.active_members[0].call_id).to eq(@call_id)
      expect(data.active_members[0].conference_id).to eq(@conference_id)
      expect(data.active_members[0].member_url).to eq(@member_url)
      expect(data.active_members[0].mute).to be false
      expect(data.active_members[0].hold).to be false
      expect(data.active_members[0].call_ids_to_coach).to eq([])
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.get_conference(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end
  
  # Get Conference Member
  describe 'get_conference_member' do
    it 'gets a conference member by call id' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/members/#{@call_id}").
      to_return(status: 200, headers: @get_conference_member_headers_stub, body: @get_conference_member_body_stub)

      data, status_code, headers = @conferences_api_instance.get_conference_member_with_http_info(BW_ACCOUNT_ID, @conference_id, @call_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@get_conference_member_headers_stub)
      expect(data).to be_instance_of(Bandwidth::ConferenceMember)
      expect(data.conference_id).to eq(@conference_id)
      expect(data.call_id).to eq(@call_id)
      expect(data.member_url).to eq(@member_url)
      expect(data.mute).to be false
      expect(data.hold).to be false
      expect(data.call_ids_to_coach).to eq([])
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.get_conference_member(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference_member(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing member_id' do
      expect {
        @conferences_api_instance.get_conference_member(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Conference Recording Information
  describe 'get_conference_recording' do
    it 'gets a conference recording by id' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/recordings/#{@recording_id}").
      to_return(status: 200, headers: @get_conference_recording_headers_stub, body: @get_conference_recording_body_stub)

      data, status_code, headers = @conferences_api_instance.get_conference_recording_with_http_info(BW_ACCOUNT_ID, @conference_id, @recording_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@get_conference_recording_headers_stub)
      expect(data).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data.account_id).to eq(BW_ACCOUNT_ID)
      expect(data.conference_id).to eq(@conference_id)
      expect(data.name).to eq(@test_id)
      expect(data.recording_id).to eq(@recording_id)
      expect(data.duration).to eq(@duration)
      expect(data.channels).to eq(@channels)
      expect(data.start_time).to eq(Time.parse(@start_time))
      expect(data.end_time).to eq(Time.parse(@end_time))
      expect(data.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(data.status).to eq('complete')
      expect(data.media_url).to eq(@media_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.get_conference_recording(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.get_conference_recording(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing recording_id' do
      expect {
        @conferences_api_instance.get_conference_recording(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Conference Recordings
  describe 'list_conference_recordings' do
    it 'lists recordings for a conference' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/recordings").
      to_return(status: 200, headers: @list_conference_recordings_headers_stub, body: @list_conference_recordings_body_stub)

      data, status_code, headers = @conferences_api_instance.list_conference_recordings_with_http_info(BW_ACCOUNT_ID, @conference_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@list_conference_recordings_headers_stub)
      expect(data[0]).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(data[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data[0].conference_id).to eq(@conference_id)
      expect(data[0].name).to eq(@test_id)
      expect(data[0].recording_id).to eq(@recording_id)
      expect(data[0].duration).to eq(@duration)
      expect(data[0].channels).to eq(@channels)
      expect(data[0].start_time).to eq(Time.parse(@start_time))
      expect(data[0].end_time).to eq(Time.parse(@end_time))
      expect(data[0].file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(data[0].status).to eq('complete')
      expect(data[0].media_url).to eq(@media_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.list_conference_recordings(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.list_conference_recordings(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Conferences
  describe 'list_conferences' do
    it 'list all conferences' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences?name=#{@test_id}").
      to_return(status: 200, headers: @list_conferences_headers_stub, body: @list_conferences_body_stub)

      conference_opts = {
        name: @test_id
      }

      data, status_code, headers = @conferences_api_instance.list_conferences_with_http_info(BW_ACCOUNT_ID, conference_opts)

      expect(status_code).to eq(200)
      expect(headers).to eq(@list_conferences_headers_stub)
      expect(data[0]).to be_instance_of(Bandwidth::Conference)
      expect(data[0].id).to eq(@conference_id)
      expect(data[0].name).to eq(@test_id)
      expect(data[0].tag).to eq(@test_id)
      expect(data[0].created_time).to eq(Time.parse(@created_time))
      expect(data[0].conference_event_url).to eq(@conference_event_url)
      expect(data[0].conference_event_method).to eq(@conference_event_method)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.list_conferences(nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for an invalid page_size' do
      expect {
        @conferences_api_instance.list_conferences(BW_ACCOUNT_ID, { page_size: 1001 })
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for an invalid page_size' do
      expect {
        @conferences_api_instance.list_conferences(BW_ACCOUNT_ID, { page_size: 0 })
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Update Conference
  describe 'update_conference' do
    it 'updates a conference' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}").
      to_return(status: 204)

      update_conference_body = Bandwidth::UpdateConference.new(
        status: Bandwidth::ConferenceStateEnum::ACTIVE,
        redirect_url: MANTECA_BASE_URL + "/bxml/pause",
        redirect_method: Bandwidth::RedirectMethodEnum::POST,
        username: "username",
        password: "password",
        redirect_fallback_url: MANTECA_BASE_URL + "/bxml/pause",
        redirect_fallback_method: Bandwidth::RedirectMethodEnum::POST,
        fallback_username: "username",
        fallback_password: "password"
      )

      data, status_code, headers = @conferences_api_instance.update_conference_with_http_info(BW_ACCOUNT_ID, @conference_id, update_conference_body)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.update_conference(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing update_conference' do
      expect {
        @conferences_api_instance.update_conference(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end
  
  # Update Conference BXML
  describe 'update_conference_bxml' do
    it 'updates a conference using bxml' do
      stub_request(:put, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/bxml").
      to_return(status: 204)

      update_bxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Bxml><StartRecording/><SpeakSentence locale=\"en_US\" gender=\"female\" voice=\"susan\">This should be a conference recording.</SpeakSentence><StopRecording/></Bxml>"

      data, status_code, headers = @conferences_api_instance.update_conference_bxml_with_http_info(BW_ACCOUNT_ID, @conference_id, update_bxml)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.update_conference_bxml(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference_bxml(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @conferences_api_instance.update_conference_bxml(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Update Conference Member
  describe 'update_conference_member' do
    it 'updates a conference member by call id' do
      stub_request(:put, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/conferences/#{@conference_id}/members/#{@call_id}").
      to_return(status: 204)

      update_conference_member = Bandwidth::UpdateConferenceMember.new(
        mute: false
      )

      data, status_code, headers = @conferences_api_instance.update_conference_member_with_http_info(BW_ACCOUNT_ID, @conference_id, @call_id, update_conference_member)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @conferences_api_instance.update_conference_member(nil, '', '', {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing conference_id' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, nil, '', {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing member_id' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, '', nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing update_conference_member' do
      expect {
        @conferences_api_instance.update_conference_member(BW_ACCOUNT_ID, '', '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

end
