# Unit tests for Bandwidth::AttestationLevelEnum
describe Bandwidth::AttestationLevelEnum do
  describe 'constants' do
    it 'defines A' do
      expect(Bandwidth::AttestationLevelEnum::A).to eq('A')
    end

    it 'defines B' do
      expect(Bandwidth::AttestationLevelEnum::B).to eq('B')
    end

    it 'defines C' do
      expect(Bandwidth::AttestationLevelEnum::C).to eq('C')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::AttestationLevelEnum.all_vars).to eq([
        'A',
        'B',
        'C'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::AttestationLevelEnum.build_from_hash('A')).to eq('A')
      expect(Bandwidth::AttestationLevelEnum.build_from_hash('B')).to eq('B')
      expect(Bandwidth::AttestationLevelEnum.build_from_hash('C')).to eq('C')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::AttestationLevelEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
