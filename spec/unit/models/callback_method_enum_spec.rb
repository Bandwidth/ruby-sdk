# Unit tests for Bandwidth::CallbackMethodEnum
describe Bandwidth::CallbackMethodEnum do
  describe 'constants' do
    it 'defines GET' do
      expect(Bandwidth::CallbackMethodEnum::GET).to eq('GET')
    end

    it 'defines POST' do
      expect(Bandwidth::CallbackMethodEnum::POST).to eq('POST')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CallbackMethodEnum.all_vars).to eq([
        'GET',
        'POST'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CallbackMethodEnum.build_from_hash('GET')).to eq('GET')
      expect(Bandwidth::CallbackMethodEnum.build_from_hash('POST')).to eq('POST')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallbackMethodEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
