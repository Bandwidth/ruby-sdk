# Unit tests for Bandwidth::Bxml::Hangup
describe 'Bandwidth::Bxml::Hangup' do
  let(:instance) { Bandwidth::Bxml::Hangup.new }

  describe 'test an instance of Hangup' do
    it 'validates instance of Hangup' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Hangup)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Hangup instance' do
      expected = "\n<Hangup/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
