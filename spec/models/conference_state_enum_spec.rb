# Unit tests for Bandwidth::ConferenceStateEnum
describe Bandwidth::ConferenceStateEnum do
  let(:instance) { Bandwidth::ConferenceStateEnum.new }

  describe 'test an instance of ConferenceStateEnum' do
    it 'creates an instance of ConferenceStateEnum' do
      expect(instance).to be_instance_of(Bandwidth::ConferenceStateEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ConferenceStateEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
