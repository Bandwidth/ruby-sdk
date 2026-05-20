# Unit tests for Bandwidth::TfvStatusEnum
describe Bandwidth::TfvStatusEnum do
  describe 'constants' do
    it 'defines VERIFIED' do
      expect(Bandwidth::TfvStatusEnum::VERIFIED).to eq('VERIFIED')
    end

    it 'defines UNVERIFIED' do
      expect(Bandwidth::TfvStatusEnum::UNVERIFIED).to eq('UNVERIFIED')
    end

    it 'defines PENDING' do
      expect(Bandwidth::TfvStatusEnum::PENDING).to eq('PENDING')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::TfvStatusEnum.all_vars).to eq([
        'VERIFIED',
        'UNVERIFIED',
        'PENDING'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::TfvStatusEnum.build_from_hash('VERIFIED')).to eq('VERIFIED')
      expect(Bandwidth::TfvStatusEnum.build_from_hash('UNVERIFIED')).to eq('UNVERIFIED')
      expect(Bandwidth::TfvStatusEnum.build_from_hash('PENDING')).to eq('PENDING')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::TfvStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
