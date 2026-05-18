# Unit tests for Bandwidth::EndpointDirectionEnum
describe Bandwidth::EndpointDirectionEnum do
  describe 'constants' do
    it 'defines INBOUND' do
      expect(Bandwidth::EndpointDirectionEnum::INBOUND).to eq('INBOUND')
    end

    it 'defines OUTBOUND' do
      expect(Bandwidth::EndpointDirectionEnum::OUTBOUND).to eq('OUTBOUND')
    end

    it 'defines BIDIRECTIONAL' do
      expect(Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL).to eq('BIDIRECTIONAL')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::EndpointDirectionEnum.all_vars).to eq([
        'INBOUND',
        'OUTBOUND',
        'BIDIRECTIONAL'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::EndpointDirectionEnum.build_from_hash('INBOUND')).to eq('INBOUND')
      expect(Bandwidth::EndpointDirectionEnum.build_from_hash('OUTBOUND')).to eq('OUTBOUND')
      expect(Bandwidth::EndpointDirectionEnum.build_from_hash('BIDIRECTIONAL')).to eq('BIDIRECTIONAL')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::EndpointDirectionEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
