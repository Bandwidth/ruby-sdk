# Unit tests for Bandwidth::EndpointTypeEnum
describe Bandwidth::EndpointTypeEnum do
  describe 'constants' do
    it 'defines WEBRTC' do
      expect(Bandwidth::EndpointTypeEnum::WEBRTC).to eq('WEBRTC')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::EndpointTypeEnum.all_vars).to eq([
        'WEBRTC'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::EndpointTypeEnum.build_from_hash('WEBRTC')).to eq('WEBRTC')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::EndpointTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
