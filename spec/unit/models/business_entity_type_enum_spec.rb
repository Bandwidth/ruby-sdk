# Unit tests for Bandwidth::BusinessEntityTypeEnum
describe Bandwidth::BusinessEntityTypeEnum do
  describe 'constants' do
    it 'defines SOLE_PROPRIETOR' do
      expect(Bandwidth::BusinessEntityTypeEnum::SOLE_PROPRIETOR).to eq('SOLE_PROPRIETOR')
    end

    it 'defines PRIVATE_PROFIT' do
      expect(Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT).to eq('PRIVATE_PROFIT')
    end

    it 'defines PUBLIC_PROFIT' do
      expect(Bandwidth::BusinessEntityTypeEnum::PUBLIC_PROFIT).to eq('PUBLIC_PROFIT')
    end

    it 'defines NON_PROFIT' do
      expect(Bandwidth::BusinessEntityTypeEnum::NON_PROFIT).to eq('NON_PROFIT')
    end

    it 'defines GOVERNMENT' do
      expect(Bandwidth::BusinessEntityTypeEnum::GOVERNMENT).to eq('GOVERNMENT')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::BusinessEntityTypeEnum.all_vars).to eq([
        'SOLE_PROPRIETOR',
        'PRIVATE_PROFIT',
        'PUBLIC_PROFIT',
        'NON_PROFIT',
        'GOVERNMENT'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::BusinessEntityTypeEnum.build_from_hash('SOLE_PROPRIETOR')).to eq('SOLE_PROPRIETOR')
      expect(Bandwidth::BusinessEntityTypeEnum.build_from_hash('PRIVATE_PROFIT')).to eq('PRIVATE_PROFIT')
      expect(Bandwidth::BusinessEntityTypeEnum.build_from_hash('PUBLIC_PROFIT')).to eq('PUBLIC_PROFIT')
      expect(Bandwidth::BusinessEntityTypeEnum.build_from_hash('NON_PROFIT')).to eq('NON_PROFIT')
      expect(Bandwidth::BusinessEntityTypeEnum.build_from_hash('GOVERNMENT')).to eq('GOVERNMENT')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::BusinessEntityTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
