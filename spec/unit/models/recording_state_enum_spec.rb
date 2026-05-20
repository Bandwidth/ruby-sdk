# Unit tests for Bandwidth::RecordingStateEnum
describe Bandwidth::RecordingStateEnum do
  describe 'constants' do
    it 'defines PAUSED' do
      expect(Bandwidth::RecordingStateEnum::PAUSED).to eq('paused')
    end

    it 'defines RECORDING' do
      expect(Bandwidth::RecordingStateEnum::RECORDING).to eq('recording')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RecordingStateEnum.all_vars).to eq([
        'paused',
        'recording'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RecordingStateEnum.build_from_hash('paused')).to eq('paused')
      expect(Bandwidth::RecordingStateEnum.build_from_hash('recording')).to eq('recording')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RecordingStateEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
