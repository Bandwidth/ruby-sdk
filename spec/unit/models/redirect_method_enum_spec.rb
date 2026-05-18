# Unit tests for Bandwidth::RedirectMethodEnum
describe Bandwidth::RedirectMethodEnum do
  describe 'constants' do
    it 'defines GET' do
      expect(Bandwidth::RedirectMethodEnum::GET).to eq('GET')
    end

    it 'defines POST' do
      expect(Bandwidth::RedirectMethodEnum::POST).to eq('POST')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RedirectMethodEnum.all_vars).to eq([
        'GET',
        'POST'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RedirectMethodEnum.build_from_hash('GET')).to eq('GET')
      expect(Bandwidth::RedirectMethodEnum.build_from_hash('POST')).to eq('POST')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RedirectMethodEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
