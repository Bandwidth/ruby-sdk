=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'spec_helper'
require 'json'

# Unit tests for Bandwidth::ConferencesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ConferencesApi' do
  before do
    # run before each test
    @api_instance = Bandwidth::ConferencesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ConferencesApi' do
    it 'should create an instance of ConferencesApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::ConferencesApi)
    end
  end

  # unit tests for download_conference_recording
  # Download Conference Recording
  # Downloads the specified recording file.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [File]
  describe 'download_conference_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_conference
  # Get Conference Information
  # Returns information about the specified conference.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param [Hash] opts the optional parameters
  # @return [Conference]
  describe 'get_conference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_conference_member
  # Get Conference Member
  # Returns information about the specified conference member.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param member_id Programmable Voice API Conference Member ID
  # @param [Hash] opts the optional parameters
  # @return [ConferenceMember]
  describe 'get_conference_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_conference_recording
  # Get Conference Recording Information
  # Returns metadata for the specified recording.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [ConferenceRecordingMetadata]
  describe 'get_conference_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_conference_recordings
  # Get Conference Recordings
  # Returns a (potentially empty) list of metadata for the recordings that took place during the specified conference.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param [Hash] opts the optional parameters
  # @return [Array<ConferenceRecordingMetadata>]
  describe 'list_conference_recordings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_conferences
  # Get Conferences
  # Returns a max of 1000 conferences, sorted by &#x60;createdTime&#x60; from oldest to newest.  **NOTE:** If the number of conferences in the account is bigger than &#x60;pageSize&#x60;, a &#x60;Link&#x60; header (with format &#x60;&lt;{url}&gt;; rel&#x3D;\&quot;next\&quot;&#x60;) will be returned in the response. The url can be used to retrieve the next page of conference records.
  # @param account_id Your Bandwidth Account ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :name Filter results by the &#x60;name&#x60; field.
  # @option opts [String] :min_created_time Filter results to conferences which have a &#x60;createdTime&#x60; after or at &#x60;minCreatedTime&#x60; (in ISO8601 format).
  # @option opts [String] :max_created_time Filter results to conferences which have a &#x60;createdTime&#x60; before or at &#x60;maxCreatedTime&#x60; (in ISO8601 format).
  # @option opts [Integer] :page_size Specifies the max number of conferences that will be returned.
  # @option opts [String] :page_token Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description.
  # @return [Array<Conference>]
  describe 'list_conferences test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_conference
  # Update Conference
  # Update the conference state.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param update_conference 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_conference test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_conference_bxml
  # Update Conference BXML
  # Update the conference BXML document.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param body 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_conference_bxml test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_conference_member
  # Update Conference Member
  # Updates settings for a particular conference member.
  # @param account_id Your Bandwidth Account ID
  # @param conference_id Programmable Voice API Conference ID
  # @param member_id Programmable Voice API Conference Member ID
  # @param update_conference_member 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_conference_member test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
