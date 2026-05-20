# Unit tests for Bandwidth::StatusCallbackTypeEnum
describe Bandwidth::StatusCallbackTypeEnum do
  describe 'constants' do
    it 'defines MESSAGE_SENDING' do
      expect(Bandwidth::StatusCallbackTypeEnum::MESSAGE_SENDING).to eq('message-sending')
    end

    it 'defines MESSAGE_DELIVERED' do
      expect(Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED).to eq('message-delivered')
    end

    it 'defines MESSAGE_FAILED' do
      expect(Bandwidth::StatusCallbackTypeEnum::MESSAGE_FAILED).to eq('message-failed')
    end

    it 'defines MESSAGE_READ' do
      expect(Bandwidth::StatusCallbackTypeEnum::MESSAGE_READ).to eq('message-read')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::StatusCallbackTypeEnum.all_vars).to eq([
        'message-sending',
        'message-delivered',
        'message-failed',
        'message-read'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::StatusCallbackTypeEnum.build_from_hash('message-sending')).to eq('message-sending')
      expect(Bandwidth::StatusCallbackTypeEnum.build_from_hash('message-delivered')).to eq('message-delivered')
      expect(Bandwidth::StatusCallbackTypeEnum.build_from_hash('message-failed')).to eq('message-failed')
      expect(Bandwidth::StatusCallbackTypeEnum.build_from_hash('message-read')).to eq('message-read')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::StatusCallbackTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
