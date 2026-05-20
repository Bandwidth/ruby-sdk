# Unit tests for Bandwidth::CallTranscriptionTrackEnum
describe Bandwidth::CallTranscriptionTrackEnum do
  describe 'constants' do
    it 'defines INBOUND' do
      expect(Bandwidth::CallTranscriptionTrackEnum::INBOUND).to eq('inbound')
    end

    it 'defines OUTBOUND' do
      expect(Bandwidth::CallTranscriptionTrackEnum::OUTBOUND).to eq('outbound')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CallTranscriptionTrackEnum.all_vars).to eq([
        'inbound',
        'outbound'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CallTranscriptionTrackEnum.build_from_hash('inbound')).to eq('inbound')
      expect(Bandwidth::CallTranscriptionTrackEnum.build_from_hash('outbound')).to eq('outbound')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallTranscriptionTrackEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
