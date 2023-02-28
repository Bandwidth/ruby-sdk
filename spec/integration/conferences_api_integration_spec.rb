require 'spec_helper'
require 'json'
require_relative '../manteca_utils'

# Integration Tests for Bandwidth::ConferencesApi
describe 'ConferencesApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
    end
    @api_instance_conferences = Bandwidth::ConferencesApi.new
    @api_instance_calls = Bandwidth::CallsApi.new
    $manteca_test_id = setup_manteca('conference')
    $manteca_call_id = create_manteca_call($manteca_test_id, "/bxml/joinConferencePause", @api_instance_calls)
    $conference_id = ""
    $recording_id = ""
  end
  
  # Get Conferences
  describe 'list_conferences' do
    it 'list all conferences' do
      conference_opts = {
        name: $manteca_test_id
      }

      sleep(SLEEP_TIME_S)
      response = @api_instance_conferences.list_conferences_with_http_info(BW_ACCOUNT_ID, conference_opts)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0]).to be_instance_of(Bandwidth::Conference)
      expect(response[DATA][0].id).to be_instance_of(String)
      $conference_id = response[DATA][0].id
    end
  end

  # Get Conference Information
  describe 'get_conference' do
    it 'get a conference by id' do
      response = @api_instance_conferences.get_conference_with_http_info(BW_ACCOUNT_ID, $conference_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::Conference)
      expect(response[DATA].id).to eq($conference_id)
      expect(response[DATA].name).to eq($manteca_test_id)
      expect(response[DATA].tag).to eq($manteca_test_id)
    end
  end
  
  # Get Conference Member
  describe 'get_conference_member' do
    it 'gets a conference member by call id' do
      response = @api_instance_conferences.get_conference_member_with_http_info(BW_ACCOUNT_ID, $conference_id, $manteca_call_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::ConferenceMember)
      expect(response[DATA].conference_id).to eq($conference_id)
      expect(response[DATA].call_id).to eq($manteca_call_id)
    end
  end
  
  # Update Conference Member
  describe 'update_conference_member' do
    it 'updates a conference member by call id' do
      update_conference_member = Bandwidth::UpdateConferenceMember.new(
        mute: false
      )

      response = @api_instance_conferences.update_conference_member_with_http_info(BW_ACCOUNT_ID, $conference_id, $manteca_call_id, update_conference_member)
      expect(response[CODE]).to eq(204)
    end
  end

  # Update Conference
  describe 'update_conference' do
    it 'updates a conference' do
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

      response = @api_instance_conferences.update_conference_with_http_info(BW_ACCOUNT_ID, $conference_id, update_conference_body)
      expect(response[CODE]).to eq(204)
    end
  end

  # Update Conference BXML
  describe 'update_conference_bxml' do
    it 'updates a conference using bxml' do
      update_bxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Bxml><StartRecording/><SpeakSentence locale=\"en_US\" gender=\"female\" voice=\"susan\">This should be a conference recording.</SpeakSentence><StopRecording/></Bxml>"

      response = @api_instance_conferences.update_conference_bxml_with_http_info(BW_ACCOUNT_ID, $conference_id, update_bxml)
      expect(response[CODE]).to eq(204)

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
  
  # Get Conference Recordings
  describe 'list_conference_recordings' do
    it 'lists recordings for a conference' do
      response = @api_instance_conferences.list_conference_recordings_with_http_info(BW_ACCOUNT_ID, $conference_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0]).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(response[DATA][0].conference_id).to eq($conference_id)
      expect(response[DATA][0].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA][0].name).to eq($manteca_test_id)
      expect(response[DATA][0].status).to eq('complete').or eq('partial')
      expect(response[DATA][0].recording_id).to be_instance_of(String)
      expect(response[DATA][0].file_format).to eq(Bandwidth::FileFormatEnum::WAV)

      $recording_id = response[DATA][0].recording_id
    end
  end
  
    # Get Conference Recording Information
    describe 'get_conference_recording' do
      it 'gets a conference recording by id' do
        response = @api_instance_conferences.get_conference_recording_with_http_info(BW_ACCOUNT_ID, $conference_id, $recording_id)

        expect(response[CODE]).to eq(200)
        expect(response[DATA]).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
        expect(response[DATA].conference_id).to eq($conference_id)
        expect(response[DATA].account_id).to eq(BW_ACCOUNT_ID)
        expect(response[DATA].name).to eq($manteca_test_id)
        expect(response[DATA].status).to eq('complete').or eq('partial')
        expect(response[DATA].recording_id).to be_instance_of(String)
        expect(response[DATA].file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      end
    end

  # Download Conference Recording
  describe 'download_conference_recording test' do
    it 'should work' do
      response = @api_instance_conferences.download_conference_recording_with_http_info(BW_ACCOUNT_ID, $conference_id, $recording_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(String)
    end
  end

end
