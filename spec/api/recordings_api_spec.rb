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

# Unit tests for Bandwidth::RecordingsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'RecordingsApi' do
  before do
    # run before each test
    @api_instance = Bandwidth::RecordingsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of RecordingsApi' do
    it 'should create an instance of RecordingsApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::RecordingsApi)
    end
  end

  # unit tests for delete_call_transcription
  # Delete Transcription
  # Deletes the specified recording&#39;s transcription.  Note: After the deletion is requested and a &#x60;204&#x60; is returned, the transcription will not be accessible anymore. However, it is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_call_transcription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_recording
  # Delete Recording
  # Delete the recording information, media and transcription.  Note: After the deletion is requested and a &#x60;204&#x60; is returned, neither the recording metadata nor the actual media nor its transcription will be accessible anymore. However, the media of the specified recording is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_recording_media
  # Delete Recording Media
  # Deletes the specified recording&#39;s media.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_recording_media test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for download_call_recording
  # Download Recording
  # Downloads the specified recording.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [File]
  describe 'download_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_call_recording
  # Get Call Recording
  # Returns metadata for the specified recording.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [CallRecordingMetadata]
  describe 'get_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_call_transcription
  # Get Transcription
  # Downloads the specified transcription.  If the transcribed recording was multi-channel, then there will be 2 transcripts. The caller/called party transcript will be the first item while [&#x60;&lt;PlayAudio&gt;&#x60;](/docs/voice/bxml/playAudio) and [&#x60;&lt;SpeakSentence&gt;&#x60;](/docs/voice/bxml/speakSentence) transcript will be the second item. During a [&#x60;&lt;Transfer&gt;&#x60;](/docs/voice/bxml/transfer) the A-leg transcript will be the first item while the B-leg transcript will be the second item.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param [Hash] opts the optional parameters
  # @return [TranscriptionList]
  describe 'get_call_transcription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_account_call_recordings
  # Get Call Recordings
  # Returns a list of metadata for the recordings associated with the specified account. The list can be filtered by the optional from, to, minStartTime, and maxStartTime arguments. The list is capped at 1000 entries and may be empty if no recordings match the specified criteria.
  # @param account_id Your Bandwidth Account ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to Filter results by the &#x60;to&#x60; field.
  # @option opts [String] :from Filter results by the &#x60;from&#x60; field.
  # @option opts [String] :min_start_time Filter results to recordings which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format).
  # @option opts [String] :max_start_time Filter results to recordings which have a &#x60;startTime&#x60; before &#x60;maxStartTime&#x60; (in ISO8601 format).
  # @return [Array<CallRecordingMetadata>]
  describe 'list_account_call_recordings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_call_recordings
  # List Call Recordings
  # Returns a (potentially empty) list of metadata for the recordings that took place during the specified call.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param [Hash] opts the optional parameters
  # @return [Array<CallRecordingMetadata>]
  describe 'list_call_recordings test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for transcribe_call_recording
  # Create Transcription Request
  # Generate the transcription for a specific recording. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param recording_id Programmable Voice API Recording ID
  # @param transcribe_recording 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'transcribe_call_recording test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_call_recording_state
  # Update Recording
  # Pause or resume a recording on an active phone call.
  # @param account_id Your Bandwidth Account ID
  # @param call_id Programmable Voice API Call ID
  # @param update_call_recording 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_call_recording_state test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
