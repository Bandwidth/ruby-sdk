# Unit tests for Bandwidth::CompletedLookupStatusEnum
describe Bandwidth::CompletedLookupStatusEnum do
  describe 'constants' do
    it 'defines COMPLETE' do
      expect(Bandwidth::CompletedLookupStatusEnum::COMPLETE).to eq('COMPLETE')
    end

    it 'defines PARTIAL_COMPLETE' do
      expect(Bandwidth::CompletedLookupStatusEnum::PARTIAL_COMPLETE).to eq('PARTIAL_COMPLETE')
    end

    it 'defines FAILED' do
      expect(Bandwidth::CompletedLookupStatusEnum::FAILED).to eq('FAILED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CompletedLookupStatusEnum.all_vars).to eq([
        'COMPLETE',
        'PARTIAL_COMPLETE',
        'FAILED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CompletedLookupStatusEnum.build_from_hash('COMPLETE')).to eq('COMPLETE')
      expect(Bandwidth::CompletedLookupStatusEnum.build_from_hash('PARTIAL_COMPLETE')).to eq('PARTIAL_COMPLETE')
      expect(Bandwidth::CompletedLookupStatusEnum.build_from_hash('FAILED')).to eq('FAILED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CompletedLookupStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
