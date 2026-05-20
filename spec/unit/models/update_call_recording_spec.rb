# Unit tests for Bandwidth::UpdateCallRecording
describe Bandwidth::UpdateCallRecording do
  let(:update_call_recording_default) { Bandwidth::UpdateCallRecording.new({
    state: Bandwidth::RecordingStateEnum::PAUSED
  }) }
  let(:update_call_recording_values) { Bandwidth::UpdateCallRecording.new({
    state: Bandwidth::RecordingStateEnum::RECORDING
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::UpdateCallRecording.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::UpdateCallRecording.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::UpdateCallRecording.acceptable_attributes).to eq(Bandwidth::UpdateCallRecording.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::UpdateCallRecording.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of UpdateCallRecording created by the build_from_hash method' do
      update_call_recording_from_hash = Bandwidth::UpdateCallRecording.build_from_hash({
        state: Bandwidth::RecordingStateEnum::RECORDING
      })
      expect(update_call_recording_from_hash).to be_instance_of(Bandwidth::UpdateCallRecording)
      expect(update_call_recording_from_hash.state).to eq(Bandwidth::RecordingStateEnum::RECORDING)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(update_call_recording_values.to_s).to eq('{:state=>"recording"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      update_call_recording_equal = Bandwidth::UpdateCallRecording.new({
        state: Bandwidth::RecordingStateEnum::PAUSED
      })
      expect(update_call_recording_default.eql?(update_call_recording_equal)).to be true
      expect(update_call_recording_default.eql?(update_call_recording_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(update_call_recording_values.to_body).to eq({
        state: Bandwidth::RecordingStateEnum::RECORDING
      })
    end
  end

  describe 'custom attribute writers' do
    it '#state=' do
      expect {
        Bandwidth::UpdateCallRecording.new({ state: nil })
      }.to raise_error(ArgumentError, 'state cannot be nil')
    end
  end
end
