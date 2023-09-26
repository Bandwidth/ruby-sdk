# Unit tests for Bandwidth::Bxml::StartStream
describe 'Bandwidth::Bxml::StartStream' do
  let(:initial_attributes) {
    {
      name: 'initial_name',
      tracks: 'inbound',
      destination: 'https://initial.com',
      stream_event_url: 'https://initial.com',
      stream_event_method: 'POST',
      username: 'initial_username',
      password: 'initial_password'
    }
  }

  let(:new_attributes) {
    {
      name: 'new_name',
      tracks: 'outbound',
      destination: 'https://new.com',
      stream_event_url: 'https://new.com',
      stream_event_method: 'GET',
      username: 'new_username',
      password: 'new_password'
    }
  }

  let (:stream_param_1) { Bandwidth::Bxml::StreamParam.new({ name: 'stream_param_name_1', value: 'stream_param_value_1' }) }
  let (:stream_param_2) { Bandwidth::Bxml::StreamParam.new({ name: 'stream_param_name_2', value: 'stream_param_value_2' }) }

  let(:instance) { Bandwidth::Bxml::StartStream.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::StartStream.new([stream_param_1], initial_attributes) }

  describe 'test an instance of StartStream' do
    it 'validates instance of StartStream' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StartStream)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StartStream instance' do
      expected = "\n<StartStream name=\"initial_name\" tracks=\"inbound\" destination=\"https://initial.com\" streamEventUrl=\"https://initial.com\" streamEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StartStream instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StartStream name=\"new_name\" tracks=\"outbound\" destination=\"https://new.com\" streamEventUrl=\"https://new.com\" streamEventMethod=\"GET\" username=\"new_username\" password=\"new_password\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of StartStream with nested verbs' do
    it 'validates instance of StartStream' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::StartStream)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested StartStream instance' do
      expected = "\n<StartStream name=\"initial_name\" tracks=\"inbound\" destination=\"https://initial.com\" streamEventUrl=\"https://initial.com\" streamEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\">\n  <StreamParam name=\"stream_param_name_1\" value=\"stream_param_value_1\"/>\n</StartStream>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_stream_param method of the nested StartStream instance' do
      expected_single = "\n<StartStream name=\"initial_name\" tracks=\"inbound\" destination=\"https://initial.com\" streamEventUrl=\"https://initial.com\" streamEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\">\n  <StreamParam name=\"stream_param_name_1\" value=\"stream_param_value_1\"/>\n  <StreamParam name=\"stream_param_name_2\" value=\"stream_param_value_2\"/>\n</StartStream>\n"
      instance_nested.add_stream_param(stream_param_2)
      expect(instance_nested.to_bxml).to eq(expected_single)

      expected_multiple = "\n<StartStream name=\"initial_name\" tracks=\"inbound\" destination=\"https://initial.com\" streamEventUrl=\"https://initial.com\" streamEventMethod=\"POST\" username=\"initial_username\" password=\"initial_password\">\n  <StreamParam name=\"stream_param_name_1\" value=\"stream_param_value_1\"/>\n  <StreamParam name=\"stream_param_name_2\" value=\"stream_param_value_2\"/>\n  <StreamParam name=\"stream_param_name_2\" value=\"stream_param_value_2\"/>\n  <StreamParam name=\"stream_param_name_2\" value=\"stream_param_value_2\"/>\n</StartStream>\n"
      instance_nested.add_stream_param([stream_param_2, stream_param_2])
      expect(instance_nested.to_bxml).to eq(expected_multiple)
    end
  end
end
