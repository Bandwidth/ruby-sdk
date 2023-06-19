# Unit tests for Bandwidth::RecordingStateEnum
describe Bandwidth::RecordingStateEnum do
  let(:instance) { Bandwidth::RecordingStateEnum.new }

  describe 'test an instance of RecordingStateEnum' do
    it 'should create an instance of RecordingStateEnum' do
      expect(instance).to be_instance_of(Bandwidth::RecordingStateEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RecordingStateEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
