# Unit tests for Bandwidth::TfvCallbackStatusEnum
describe Bandwidth::TfvCallbackStatusEnum do
  describe 'constants' do
    it 'defines VERIFIED' do
      expect(Bandwidth::TfvCallbackStatusEnum::VERIFIED).to eq('VERIFIED')
    end

    it 'defines UNVERIFIED' do
      expect(Bandwidth::TfvCallbackStatusEnum::UNVERIFIED).to eq('UNVERIFIED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::TfvCallbackStatusEnum.all_vars).to eq([
        'VERIFIED',
        'UNVERIFIED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::TfvCallbackStatusEnum.build_from_hash('VERIFIED')).to eq('VERIFIED')
      expect(Bandwidth::TfvCallbackStatusEnum.build_from_hash('UNVERIFIED')).to eq('UNVERIFIED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::TfvCallbackStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
