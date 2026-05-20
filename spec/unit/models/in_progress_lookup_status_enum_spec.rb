# Unit tests for Bandwidth::InProgressLookupStatusEnum
describe Bandwidth::InProgressLookupStatusEnum do
  describe 'constants' do
    it 'defines IN_PROGRESS' do
      expect(Bandwidth::InProgressLookupStatusEnum::IN_PROGRESS).to eq('IN_PROGRESS')
    end

    it 'defines COMPLETE' do
      expect(Bandwidth::InProgressLookupStatusEnum::COMPLETE).to eq('COMPLETE')
    end

    it 'defines PARTIAL_COMPLETE' do
      expect(Bandwidth::InProgressLookupStatusEnum::PARTIAL_COMPLETE).to eq('PARTIAL_COMPLETE')
    end

    it 'defines FAILED' do
      expect(Bandwidth::InProgressLookupStatusEnum::FAILED).to eq('FAILED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::InProgressLookupStatusEnum.all_vars).to eq([
        'IN_PROGRESS',
        'COMPLETE',
        'PARTIAL_COMPLETE',
        'FAILED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::InProgressLookupStatusEnum.build_from_hash('IN_PROGRESS')).to eq('IN_PROGRESS')
      expect(Bandwidth::InProgressLookupStatusEnum.build_from_hash('COMPLETE')).to eq('COMPLETE')
      expect(Bandwidth::InProgressLookupStatusEnum.build_from_hash('PARTIAL_COMPLETE')).to eq('PARTIAL_COMPLETE')
      expect(Bandwidth::InProgressLookupStatusEnum.build_from_hash('FAILED')).to eq('FAILED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::InProgressLookupStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
