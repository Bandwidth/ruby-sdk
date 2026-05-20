# Unit tests for Bandwidth::EndpointStatusEnum
describe Bandwidth::EndpointStatusEnum do
  describe 'constants' do
    it 'defines CONNECTED' do
      expect(Bandwidth::EndpointStatusEnum::CONNECTED).to eq('CONNECTED')
    end

    it 'defines DISCONNECTED' do
      expect(Bandwidth::EndpointStatusEnum::DISCONNECTED).to eq('DISCONNECTED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::EndpointStatusEnum.all_vars).to eq([
        'CONNECTED',
        'DISCONNECTED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::EndpointStatusEnum.build_from_hash('CONNECTED')).to eq('CONNECTED')
      expect(Bandwidth::EndpointStatusEnum.build_from_hash('DISCONNECTED')).to eq('DISCONNECTED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::EndpointStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
