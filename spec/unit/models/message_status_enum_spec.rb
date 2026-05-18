# Unit tests for Bandwidth::MessageStatusEnum
describe Bandwidth::MessageStatusEnum do
  describe 'constants' do
    it 'defines RECEIVED' do
      expect(Bandwidth::MessageStatusEnum::RECEIVED).to eq('RECEIVED')
    end

    it 'defines QUEUED' do
      expect(Bandwidth::MessageStatusEnum::QUEUED).to eq('QUEUED')
    end

    it 'defines SENDING' do
      expect(Bandwidth::MessageStatusEnum::SENDING).to eq('SENDING')
    end

    it 'defines SENT' do
      expect(Bandwidth::MessageStatusEnum::SENT).to eq('SENT')
    end

    it 'defines FAILED' do
      expect(Bandwidth::MessageStatusEnum::FAILED).to eq('FAILED')
    end

    it 'defines DELIVERED' do
      expect(Bandwidth::MessageStatusEnum::DELIVERED).to eq('DELIVERED')
    end

    it 'defines ACCEPTED' do
      expect(Bandwidth::MessageStatusEnum::ACCEPTED).to eq('ACCEPTED')
    end

    it 'defines UNDELIVERED' do
      expect(Bandwidth::MessageStatusEnum::UNDELIVERED).to eq('UNDELIVERED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::MessageStatusEnum.all_vars).to eq([
        'RECEIVED',
        'QUEUED',
        'SENDING',
        'SENT',
        'FAILED',
        'DELIVERED',
        'ACCEPTED',
        'UNDELIVERED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::MessageStatusEnum.build_from_hash('RECEIVED')).to eq('RECEIVED')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('QUEUED')).to eq('QUEUED')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('SENDING')).to eq('SENDING')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('SENT')).to eq('SENT')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('FAILED')).to eq('FAILED')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('DELIVERED')).to eq('DELIVERED')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('ACCEPTED')).to eq('ACCEPTED')
      expect(Bandwidth::MessageStatusEnum.build_from_hash('UNDELIVERED')).to eq('UNDELIVERED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
