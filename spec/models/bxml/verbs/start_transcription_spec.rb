# Unit tests for Bandwidth::Bxml::StartTranscription
describe 'Bandwidth::Bxml::StartTranscription' do
  let(:initial_attributes) {
    {
      name: 'initial_name',
      tracks: 'inbound',
      transcription_event_url: 'https://initial.com',
      transcription_event_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      destination: 'https://initial.com',
      stabilized: true
    }
  }

  let(:new_attributes) {
    {
      name: 'new_name',
      tracks: 'outbound',
      transcription_event_url: 'https://new.com',
      transcription_event_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      destination: 'https://new.com',
      stabilized: false
    }
  }

  let (:custom_param_1) { Bandwidth::Bxml::CustomParam.new({ name: 'custom_param_name_1', value: 'custom_param_value_1' }) }
  let (:custom_param_2) { Bandwidth::Bxml::CustomParam.new({ name: 'custom_param_name_2', value: 'custom_param_value_2' }) }

  let(:instance) { Bandwidth::Bxml::StartTranscription.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::StartTranscription.new([custom_param_1], initial_attributes) }

  describe 'test an instance of StartTranscription' do
    it 'validates instance of StartTranscription' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StartTranscription)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StartTranscription instance' do
      expected = "\n<StartTranscription name=\"initial_name\" tracks=\"inbound\" transcriptionEventUrl=\"https://initial.com\" transcriptionEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" destination=\"https://initial.com\" stabilized=\"true\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StartTranscription instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StartTranscription name=\"new_name\" tracks=\"outbound\" transcriptionEventUrl=\"https://new.com\" transcriptionEventMethod=\"GET\" username=\"new_username\" password=\"new_password\" destination=\"https://new.com\" stabilized=\"false\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of StartTranscription with nested verbs' do
    it 'validates instance of StartTranscription' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::StartTranscription)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested StartTranscription instance' do
      expected = "\n<StartTranscription name=\"initial_name\" tracks=\"inbound\" transcriptionEventUrl=\"https://initial.com\" transcriptionEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" destination=\"https://initial.com\" stabilized=\"true\">\n  <CustomParam name=\"custom_param_name_1\" value=\"custom_param_value_1\"/>\n</StartTranscription>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_custom_param method of the nested StartTranscription instance' do
      expected_single = "\n<StartTranscription name=\"initial_name\" tracks=\"inbound\" transcriptionEventUrl=\"https://initial.com\" transcriptionEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" destination=\"https://initial.com\" stabilized=\"true\">\n  <CustomParam name=\"custom_param_name_1\" value=\"custom_param_value_1\"/>\n  <CustomParam name=\"custom_param_name_2\" value=\"custom_param_value_2\"/>\n</StartTranscription>\n"
      instance_nested.add_custom_param(custom_param_2)
      expect(instance_nested.to_bxml).to eq(expected_single)

      expected_multiple = "\n<StartTranscription name=\"initial_name\" tracks=\"inbound\" transcriptionEventUrl=\"https://initial.com\" transcriptionEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" destination=\"https://initial.com\" stabilized=\"true\">\n  <CustomParam name=\"custom_param_name_1\" value=\"custom_param_value_1\"/>\n  <CustomParam name=\"custom_param_name_2\" value=\"custom_param_value_2\"/>\n  <CustomParam name=\"custom_param_name_2\" value=\"custom_param_value_2\"/>\n  <CustomParam name=\"custom_param_name_2\" value=\"custom_param_value_2\"/>\n</StartTranscription>\n"
      instance_nested.add_custom_param([custom_param_2, custom_param_2])
      expect(instance_nested.to_bxml).to eq(expected_multiple)
    end
  end
end
