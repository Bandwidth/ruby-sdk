# Unit tests for Bandwidth::CardWidthEnum
describe Bandwidth::CardWidthEnum do
  describe 'constants' do
    it 'defines SMALL' do
      expect(Bandwidth::CardWidthEnum::SMALL).to eq('SMALL')
    end

    it 'defines MEDIUM' do
      expect(Bandwidth::CardWidthEnum::MEDIUM).to eq('MEDIUM')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CardWidthEnum.all_vars).to eq([
        'SMALL',
        'MEDIUM'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CardWidthEnum.build_from_hash('SMALL')).to eq('SMALL')
      expect(Bandwidth::CardWidthEnum.build_from_hash('MEDIUM')).to eq('MEDIUM')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CardWidthEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
