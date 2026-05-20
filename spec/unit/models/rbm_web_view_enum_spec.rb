# Unit tests for Bandwidth::RbmWebViewEnum
describe Bandwidth::RbmWebViewEnum do
  describe 'constants' do
    it 'defines FULL' do
      expect(Bandwidth::RbmWebViewEnum::FULL).to eq('FULL')
    end

    it 'defines HALF' do
      expect(Bandwidth::RbmWebViewEnum::HALF).to eq('HALF')
    end

    it 'defines TALL' do
      expect(Bandwidth::RbmWebViewEnum::TALL).to eq('TALL')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RbmWebViewEnum.all_vars).to eq([
        'FULL',
        'HALF',
        'TALL'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RbmWebViewEnum.build_from_hash('FULL')).to eq('FULL')
      expect(Bandwidth::RbmWebViewEnum.build_from_hash('HALF')).to eq('HALF')
      expect(Bandwidth::RbmWebViewEnum.build_from_hash('TALL')).to eq('TALL')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RbmWebViewEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
