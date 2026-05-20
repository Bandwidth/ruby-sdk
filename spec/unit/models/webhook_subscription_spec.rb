# Unit tests for Bandwidth::WebhookSubscription
describe Bandwidth::WebhookSubscription do
  let(:webhook_subscription_default) { Bandwidth::WebhookSubscription.new }
  let(:webhook_subscription_values) { Bandwidth::WebhookSubscription.new({
    id: '6cf73464-0c9f-431f-bd16-3711df296b9a',
    account_id: '9900000',
    callback_url: 'https://example.com/callback',
    type: Bandwidth::WebhookSubscriptionTypeEnum::TOLLFREE_VERIFICATION_STATUS,
    basic_authentication: Bandwidth::WebhookSubscriptionBasicAuthentication.new({ username: 'user', password: 'pass' }),
    created_date: '2024-01-01T00:00:00Z',
    modified_date: '2024-01-02T00:00:00Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::WebhookSubscription.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::WebhookSubscription.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::WebhookSubscription.acceptable_attributes).to eq(Bandwidth::WebhookSubscription.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::WebhookSubscription.openapi_nullable).to eq(Set.new([:'callback_url']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of WebhookSubscription created by the build_from_hash method' do
      webhook_subscription_from_hash = Bandwidth::WebhookSubscription.build_from_hash({
        id: '6cf73464-0c9f-431f-bd16-3711df296b9a',
        accountId: '9900000',
        callbackUrl: 'https://example.com/callback',
        type: Bandwidth::WebhookSubscriptionTypeEnum::TOLLFREE_VERIFICATION_STATUS,
        basicAuthentication: { username: 'user', password: 'pass' },
        createdDate: '2024-01-01T00:00:00Z',
        modifiedDate: '2024-01-02T00:00:00Z'
      })
      expect(webhook_subscription_from_hash).to be_instance_of(Bandwidth::WebhookSubscription)
      expect(webhook_subscription_from_hash.id).to eq('6cf73464-0c9f-431f-bd16-3711df296b9a')
      expect(webhook_subscription_from_hash.account_id).to eq('9900000')
      expect(webhook_subscription_from_hash.callback_url).to eq('https://example.com/callback')
      expect(webhook_subscription_from_hash.type).to eq(Bandwidth::WebhookSubscriptionTypeEnum::TOLLFREE_VERIFICATION_STATUS)
      expect(webhook_subscription_from_hash.basic_authentication).to be_instance_of(Bandwidth::WebhookSubscriptionBasicAuthentication)
      expect(webhook_subscription_from_hash.created_date).to eq(Time.parse('2024-01-01T00:00:00Z'))
      expect(webhook_subscription_from_hash.modified_date).to eq(Time.parse('2024-01-02T00:00:00Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(webhook_subscription_values.to_s).to eq('{:id=>"6cf73464-0c9f-431f-bd16-3711df296b9a", :accountId=>"9900000", :callbackUrl=>"https://example.com/callback", :type=>"TOLLFREE_VERIFICATION_STATUS", :basicAuthentication=>{:username=>"user", :password=>"pass"}, :createdDate=>"2024-01-01T00:00:00Z", :modifiedDate=>"2024-01-02T00:00:00Z"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(webhook_subscription_default.eql?(Bandwidth::WebhookSubscription.new)).to be true
      expect(webhook_subscription_default.eql?(webhook_subscription_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(webhook_subscription_values.to_body).to eq({
        id: '6cf73464-0c9f-431f-bd16-3711df296b9a',
        accountId: '9900000',
        callbackUrl: 'https://example.com/callback',
        type: Bandwidth::WebhookSubscriptionTypeEnum::TOLLFREE_VERIFICATION_STATUS,
        basicAuthentication: { username: 'user', password: 'pass' },
        createdDate: '2024-01-01T00:00:00Z',
        modifiedDate: '2024-01-02T00:00:00Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#callback_url=' do
      expect {
        webhook_subscription_values.callback_url = 'a' * 2001
      }.to raise_error(ArgumentError, 'invalid value for "callback_url", the character length must be smaller than or equal to 2000.')

      expect {
        webhook_subscription_values.callback_url = 'not a url'
      }.to raise_error(ArgumentError, /invalid value for "callback_url", must conform to the pattern/)
    end
  end
end
