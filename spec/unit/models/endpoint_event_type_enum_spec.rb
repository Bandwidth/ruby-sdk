# Unit tests for Bandwidth::EndpointEventTypeEnum
describe Bandwidth::EndpointEventTypeEnum do
  describe 'constants' do
    it 'defines DEVICE_CONNECTED' do
      expect(Bandwidth::EndpointEventTypeEnum::DEVICE_CONNECTED).to eq('DEVICE_CONNECTED')
    end

    it 'defines DEVICE_DISCONNECTED' do
      expect(Bandwidth::EndpointEventTypeEnum::DEVICE_DISCONNECTED).to eq('DEVICE_DISCONNECTED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::EndpointEventTypeEnum.all_vars).to eq([
        'DEVICE_CONNECTED',
        'DEVICE_DISCONNECTED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::EndpointEventTypeEnum.build_from_hash('DEVICE_CONNECTED')).to eq('DEVICE_CONNECTED')
      expect(Bandwidth::EndpointEventTypeEnum.build_from_hash('DEVICE_DISCONNECTED')).to eq('DEVICE_DISCONNECTED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::EndpointEventTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
