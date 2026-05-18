# Unit tests for Bandwidth::WebhookSubscriptionRequestSchema
describe Bandwidth::WebhookSubscriptionRequestSchema do
  let(:webhook_subscription_request_schema_default) { Bandwidth::WebhookSubscriptionRequestSchema.new }
  let(:webhook_subscription_request_schema_values) { Bandwidth::WebhookSubscriptionRequestSchema.new({
    basic_authentication: Bandwidth::TfvBasicAuthentication.new({ username: 'user', password: 'pass' }),
    callback_url: 'https://example.com/callback',
    shared_secret_key: 'abc123abc123abc1'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionRequestSchema.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionRequestSchema.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::WebhookSubscriptionRequestSchema.acceptable_attributes).to eq(Bandwidth::WebhookSubscriptionRequestSchema.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::WebhookSubscriptionRequestSchema.openapi_nullable).to eq(Set.new([
        :'callback_url',
        :'shared_secret_key'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of WebhookSubscriptionRequestSchema created by the build_from_hash method' do
      webhook_subscription_request_schema_from_hash = Bandwidth::WebhookSubscriptionRequestSchema.build_from_hash({
        basicAuthentication: { username: 'user', password: 'pass' },
        callbackUrl: 'https://example.com/callback',
        sharedSecretKey: 'abc123abc123abc1'
      })
      expect(webhook_subscription_request_schema_from_hash).to be_instance_of(Bandwidth::WebhookSubscriptionRequestSchema)
      expect(webhook_subscription_request_schema_from_hash.basic_authentication).to be_instance_of(Bandwidth::TfvBasicAuthentication)
      expect(webhook_subscription_request_schema_from_hash.basic_authentication.username).to eq('user')
      expect(webhook_subscription_request_schema_from_hash.basic_authentication.password).to eq('pass')
      expect(webhook_subscription_request_schema_from_hash.callback_url).to eq('https://example.com/callback')
      expect(webhook_subscription_request_schema_from_hash.shared_secret_key).to eq('abc123abc123abc1')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(webhook_subscription_request_schema_values.to_s).to eq('{:basicAuthentication=>{:username=>"user", :password=>"pass"}, :callbackUrl=>"https://example.com/callback", :sharedSecretKey=>"abc123abc123abc1"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(webhook_subscription_request_schema_default.eql?(Bandwidth::WebhookSubscriptionRequestSchema.new)).to be true
      expect(webhook_subscription_request_schema_default.eql?(webhook_subscription_request_schema_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(webhook_subscription_request_schema_values.to_body).to eq({
        basicAuthentication: { username: 'user', password: 'pass' },
        callbackUrl: 'https://example.com/callback',
        sharedSecretKey: 'abc123abc123abc1'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#callback_url=' do
      expect {
        webhook_subscription_request_schema_values.callback_url = 'a' * 2001
      }.to raise_error(ArgumentError, 'invalid value for "callback_url", the character length must be smaller than or equal to 2000.')

      expect {
        webhook_subscription_request_schema_values.callback_url = 'not a url'
      }.to raise_error(ArgumentError, /invalid value for "callback_url", must conform to the pattern/)
    end

    it '#shared_secret_key=' do
      expect {
        webhook_subscription_request_schema_values.shared_secret_key = 'a' * 65
      }.to raise_error(ArgumentError, 'invalid value for "shared_secret_key", the character length must be smaller than or equal to 64.')

      expect {
        webhook_subscription_request_schema_values.shared_secret_key = 'a' * 15
      }.to raise_error(ArgumentError, 'invalid value for "shared_secret_key", the character length must be greater than or equal to 16.')
    end
  end
end
