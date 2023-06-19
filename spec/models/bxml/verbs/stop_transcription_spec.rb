# Unit tests for Bandwidth::Bxml::StopTranscription
describe 'Bandwidth::Bxml::StopTranscription' do
  let(:initial_attributes) {
    {
      name: 'initial_name'
    }
  }

  let(:new_attributes) {
    {
      name: 'new_name'
    }
  }

  let(:instance) { Bandwidth::Bxml::StopTranscription.new(initial_attributes) }

  describe 'test an instance of StopTranscription' do
    it 'validates instance of StopTranscription' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StopTranscription)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StopTranscription instance' do
      expected = "\n<StopTranscription name=\"initial_name\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StopTranscription instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StopTranscription name=\"new_name\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
