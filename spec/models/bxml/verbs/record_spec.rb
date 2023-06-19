# Unit tests for Bandwidth::Bxml::Record
describe 'Bandwidth::Bxml::Record' do
  let(:initial_attributes) {
    {
      record_complete_url: 'https://initial.com',
      record_complete_method: 'POST',
      record_complete_fallback_url: 'https://initial.com',
      record_complete_fallback_method: 'POST',
      recording_available_url: 'https://initial.com',
      recording_available_method: 'POST',
      transcribe: true,
      transcription_available_url: 'https://initial.com',
      transcription_available_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag',
      terminating_digits: '5',
      max_duration: 5,
      silence_timeout: 5,
      file_format: 'wav'
    }
  }

  let(:new_attributes) {
    {
      record_complete_url: 'https://new.com',
      record_complete_method: 'GET',
      record_complete_fallback_url: 'https://new.com',
      record_complete_fallback_method: 'GET',
      recording_available_url: 'https://new.com',
      recording_available_method: 'GET',
      transcribe: true,
      transcription_available_url: 'https://new.com',
      transcription_available_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag',
      terminating_digits: '0',
      max_duration: 10,
      silence_timeout: 10,
      file_format: 'mp3'
    }
  }

  let(:instance) { Bandwidth::Bxml::Record.new(initial_attributes) }

  describe 'test an instance of Record' do
    it 'validates instance of Record' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Record)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Record instance' do
      expected = "\n<Record recordCompleteUrl=\"https://initial.com\" recordCompleteMethod=\"POST\" recordCompleteFallbackUrl=\"https://initial.com\" recordCompleteFallbackMethod=\"POST\" recordingAvailableUrl=\"https://initial.com\" recordingAvailableMethod=\"POST\" transcribe=\"true\" transcriptionAvailableUrl=\"https://initial.com\" transcriptionAvailableMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" terminatingDigits=\"5\" maxDuration=\"5\" silenceTimeout=\"5\" fileFormat=\"wav\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Record instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Record recordCompleteUrl=\"https://new.com\" recordCompleteMethod=\"GET\" recordCompleteFallbackUrl=\"https://new.com\" recordCompleteFallbackMethod=\"GET\" recordingAvailableUrl=\"https://new.com\" recordingAvailableMethod=\"GET\" transcribe=\"true\" transcriptionAvailableUrl=\"https://new.com\" transcriptionAvailableMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\" terminatingDigits=\"0\" maxDuration=\"10\" silenceTimeout=\"10\" fileFormat=\"mp3\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
