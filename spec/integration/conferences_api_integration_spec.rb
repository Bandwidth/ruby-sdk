require 'spec_helper'
require 'json'
require_relative '../manteca_utils'

# Integration Tests for Bandwidth::ConferencesApi
describe 'ConferencesApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_conferences = Bandwidth::ConferencesApi.new
    @api_instance_calls = Bandwidth::CallsApi.new
    $manteca_test_id = setup_manteca('conference')
    $manteca_call_id = create_manteca_call($manteca_test_id, "/bxml/joinConferencePause", @api_instance_calls)
    $conference_id = ""
  end
  
  # Get Conferences
  describe 'list_conferences' do
    it 'list all conferences' do
      sleep(SLEEP_TIME_S)
      response = @api_instance_conferences.list_conferences_with_http_info(BW_ACCOUNT_ID)

      expect(response[CODE]).to eq(200)
      expect(response[DATA][0].id).to be_a(String)
      $conference_id = response[DATA][0].id
    end
  end

  # Get Conference Information
  describe 'get_conference' do
    it 'get a conference by id' do
      response = @api_instance_conferences.get_conference_with_http_info(BW_ACCOUNT_ID, $conference_id)

      expect(response[CODE]).to eq(200)
      # puts response[DATA]
      expect(response[DATA].id).to eq($conference_id)
      # expect()
    end
  end

  # Download Conference Recording
  describe 'download_conference_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Conference Member
  describe 'get_conference_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Conference Recording Information
  describe 'get_conference_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Get Conference Recordings
  describe 'list_conference_recordings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Update Conference
  describe 'update_conference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Update Conference BXML
  describe 'update_conference_bxml test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Update Conference Member
  describe 'update_conference_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
