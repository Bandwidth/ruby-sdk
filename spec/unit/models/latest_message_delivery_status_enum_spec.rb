# Unit tests for Bandwidth::LatestMessageDeliveryStatusEnum
describe Bandwidth::LatestMessageDeliveryStatusEnum do
  describe 'constants' do
    it 'defines ACTIVE' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum::ACTIVE).to eq('ACTIVE')
    end

    it 'defines DEACTIVATED' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum::DEACTIVATED).to eq('DEACTIVATED')
    end

    it 'defines UNKNOWN' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum::UNKNOWN).to eq('UNKNOWN')
    end

    it 'defines NOT_ENABLED' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum::NOT_ENABLED).to eq('NOT_ENABLED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum.all_vars).to eq([
        'ACTIVE',
        'DEACTIVATED',
        'UNKNOWN',
        'NOT_ENABLED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::LatestMessageDeliveryStatusEnum.build_from_hash('ACTIVE')).to eq('ACTIVE')
      expect(Bandwidth::LatestMessageDeliveryStatusEnum.build_from_hash('DEACTIVATED')).to eq('DEACTIVATED')
      expect(Bandwidth::LatestMessageDeliveryStatusEnum.build_from_hash('UNKNOWN')).to eq('UNKNOWN')
      expect(Bandwidth::LatestMessageDeliveryStatusEnum.build_from_hash('NOT_ENABLED')).to eq('NOT_ENABLED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::LatestMessageDeliveryStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
