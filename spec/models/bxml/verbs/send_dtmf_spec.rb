

# Unit tests for Bandwidth::Bxml::SendDtmf
describe 'Bandwidth::Bxml::SendDtmf' do
  let(:initial_attributes) {
    {
      tone_duration: 5,
      tone_interval: 5
    }
  }

  let(:new_attributes) {
    {
      tone_duration: 10,
      tone_interval: 10
    }
  }

  let(:instance) { Bandwidth::Bxml::SendDtmf.new('1234', initial_attributes) }

  describe 'test an instance of SendDtmf' do
    it 'validates instance of SendDtmf' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::SendDtmf)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the SendDtmf instance' do
      expected = "\n<SendDtmf toneDuration=\"5\" toneInterval=\"5\">1234</SendDtmf>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the SendDtmf instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<SendDtmf toneDuration=\"10\" toneInterval=\"10\">1234</SendDtmf>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
