# Unit tests for Bandwidth::InboundCallbackTypeEnum
describe Bandwidth::InboundCallbackTypeEnum do
  describe 'constants' do
    it 'defines MESSAGE_RECEIVED' do
      expect(Bandwidth::InboundCallbackTypeEnum::MESSAGE_RECEIVED).to eq('message-received')
    end

    it 'defines REQUEST_LOCATION_RESPONSE' do
      expect(Bandwidth::InboundCallbackTypeEnum::REQUEST_LOCATION_RESPONSE).to eq('request-location-response')
    end

    it 'defines SUGGESTION_RESPONSE' do
      expect(Bandwidth::InboundCallbackTypeEnum::SUGGESTION_RESPONSE).to eq('suggestion-response')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::InboundCallbackTypeEnum.all_vars).to eq([
        'message-received',
        'request-location-response',
        'suggestion-response'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::InboundCallbackTypeEnum.build_from_hash('message-received')).to eq('message-received')
      expect(Bandwidth::InboundCallbackTypeEnum.build_from_hash('request-location-response')).to eq('request-location-response')
      expect(Bandwidth::InboundCallbackTypeEnum.build_from_hash('suggestion-response')).to eq('suggestion-response')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::InboundCallbackTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
