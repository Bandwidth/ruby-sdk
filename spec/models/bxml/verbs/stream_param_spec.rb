

# Unit tests for Bandwidth::Bxml::StreamParam
describe 'Bandwidth::Bxml::StreamParam' do
  let(:initial_attributes) {
    {
      name: 'initial_name',
      value: 'initial_value'
    }
  }

  let(:new_attributes) {
    {
      name: 'new_name',
      value: 'new_value'
    }
  }

  let(:instance) { Bandwidth::Bxml::StreamParam.new(initial_attributes) }

  describe 'test an instance of StreamParam' do
    it 'validates instance of StreamParam' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StreamParam)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StreamParam instance' do
      expected = "\n<StreamParam name=\"initial_name\" value=\"initial_value\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StreamParam instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StreamParam name=\"new_name\" value=\"new_value\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
