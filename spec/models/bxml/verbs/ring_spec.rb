

# Unit tests for Bandwidth::Bxml::Ring
describe 'Bandwidth::Bxml::Ring' do
  let(:initial_attributes) {
    {
      duration: 5.0,
      answer_call: true
    }
  }

  let(:new_attributes) {
    {
      duration: 10.0,
      answer_call: false
    }
  }

  let(:instance) { Bandwidth::Bxml::Ring.new(initial_attributes) }

  describe 'test an instance of Ring' do
    it 'validates instance of Ring' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Ring)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Ring instance' do
      expected = "\n<Ring duration=\"5.0\" answerCall=\"true\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Ring instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Ring duration=\"10.0\" answerCall=\"false\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
