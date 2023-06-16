

# Unit tests for Bandwidth::Bxml::Pause
describe 'Bandwidth::Bxml::Pause' do
  let(:initial_attributes) {
    {
      duration: 5
    }
  }

  let(:new_attributes) {
    {
      duration: 10
    }
  }

  let(:instance) { Bandwidth::Bxml::Pause.new(initial_attributes) }

  describe 'test an instance of Pause' do
    it 'validates instance of Pause' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Pause)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Pause instance' do
      expected = "\n<Pause duration=\"5\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Pause instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Pause duration=\"10\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
