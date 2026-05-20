# Unit tests for Bandwidth::RbmMediaHeightEnum
describe Bandwidth::RbmMediaHeightEnum do
  describe 'constants' do
    it 'defines SHORT' do
      expect(Bandwidth::RbmMediaHeightEnum::SHORT).to eq('SHORT')
    end

    it 'defines MEDIUM' do
      expect(Bandwidth::RbmMediaHeightEnum::MEDIUM).to eq('MEDIUM')
    end

    it 'defines TALL' do
      expect(Bandwidth::RbmMediaHeightEnum::TALL).to eq('TALL')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RbmMediaHeightEnum.all_vars).to eq([
        'SHORT',
        'MEDIUM',
        'TALL'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RbmMediaHeightEnum.build_from_hash('SHORT')).to eq('SHORT')
      expect(Bandwidth::RbmMediaHeightEnum.build_from_hash('MEDIUM')).to eq('MEDIUM')
      expect(Bandwidth::RbmMediaHeightEnum.build_from_hash('TALL')).to eq('TALL')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RbmMediaHeightEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
