# Unit tests for Bandwidth::WebhookSubscriptionTypeEnum
describe Bandwidth::WebhookSubscriptionTypeEnum do
  describe 'constants' do
    it 'defines TOLLFREE_VERIFICATION_STATUS' do
      expect(Bandwidth::WebhookSubscriptionTypeEnum::TOLLFREE_VERIFICATION_STATUS).to eq('TOLLFREE_VERIFICATION_STATUS')
    end

    it 'defines MESSAGING_PORTOUT_APPROVAL_STATUS' do
      expect(Bandwidth::WebhookSubscriptionTypeEnum::MESSAGING_PORTOUT_APPROVAL_STATUS).to eq('MESSAGING_PORTOUT_APPROVAL_STATUS')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::WebhookSubscriptionTypeEnum.all_vars).to eq([
        'TOLLFREE_VERIFICATION_STATUS',
        'MESSAGING_PORTOUT_APPROVAL_STATUS'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::WebhookSubscriptionTypeEnum.build_from_hash('TOLLFREE_VERIFICATION_STATUS')).to eq('TOLLFREE_VERIFICATION_STATUS')
      expect(Bandwidth::WebhookSubscriptionTypeEnum.build_from_hash('MESSAGING_PORTOUT_APPROVAL_STATUS')).to eq('MESSAGING_PORTOUT_APPROVAL_STATUS')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::WebhookSubscriptionTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
