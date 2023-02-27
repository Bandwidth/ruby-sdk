require 'spec_helper'

# Unit tests for Bandwidth::Bxml::StartRecording
describe 'Bandwidth::Bxml::StartRecording' do
  let(:initial_attributes) {
    {
      recording_available_url: 'https://initial.com',
      recording_available_method: 'POST',
      transcribe: true,
      transcription_available_url: 'https://initial.com',
      transcription_available_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      tag: 'initial_tag',
      file_format: 'wav',
      multi_channel: true
    }
  }

  let(:new_attributes) {
    {
      recording_available_url: 'https://new.com',
      recording_available_method: 'GET',
      transcribe: false,
      transcription_available_url: 'https://new.com',
      transcription_available_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      tag: 'new_tag',
      file_format: 'mp3',
      multi_channel: false
    }
  }

  let(:instance) { Bandwidth::Bxml::StartRecording.new(initial_attributes) }

  describe 'test an instance of StartRecording' do
    it 'validates instance of StartRecording' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StartRecording)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StartRecording instance' do
      expected = "\n<StartRecording recordingAvailableUrl=\"https://initial.com\" recordingAvailableMethod=\"POST\" transcribe=\"true\" transcriptionAvailableUrl=\"https://initial.com\" transcriptionAvailableMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" tag=\"initial_tag\" fileFormat=\"wav\" multiChannel=\"true\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StartRecording instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StartRecording recordingAvailableUrl=\"https://new.com\" recordingAvailableMethod=\"GET\" transcribe=\"false\" transcriptionAvailableUrl=\"https://new.com\" transcriptionAvailableMethod=\"GET\" username=\"new_username\" password=\"new_password\" tag=\"new_tag\" fileFormat=\"mp3\" multiChannel=\"false\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
