# Unit tests for Bandwidth::RbmOpenUrlEnum
describe Bandwidth::RbmOpenUrlEnum do
  describe 'constants' do
    it 'defines BROWSER' do
      expect(Bandwidth::RbmOpenUrlEnum::BROWSER).to eq('BROWSER')
    end

    it 'defines WEBVIEW' do
      expect(Bandwidth::RbmOpenUrlEnum::WEBVIEW).to eq('WEBVIEW')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RbmOpenUrlEnum.all_vars).to eq([
        'BROWSER',
        'WEBVIEW'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RbmOpenUrlEnum.build_from_hash('BROWSER')).to eq('BROWSER')
      expect(Bandwidth::RbmOpenUrlEnum.build_from_hash('WEBVIEW')).to eq('WEBVIEW')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RbmOpenUrlEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
