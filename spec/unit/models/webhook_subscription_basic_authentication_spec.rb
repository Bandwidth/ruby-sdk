# Unit tests for Bandwidth::WebhookSubscriptionBasicAuthentication
describe Bandwidth::WebhookSubscriptionBasicAuthentication do
  let(:webhook_subscription_basic_authentication_default) { Bandwidth::WebhookSubscriptionBasicAuthentication.new({
    username: 'baseline',
    password: 'baselinePass'
  }) }
  let(:webhook_subscription_basic_authentication_values) { Bandwidth::WebhookSubscriptionBasicAuthentication.new({
    username: 'mySecretUsername',
    password: 'mySecretPassword'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::WebhookSubscriptionBasicAuthentication.acceptable_attributes).to eq(Bandwidth::WebhookSubscriptionBasicAuthentication.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::WebhookSubscriptionBasicAuthentication.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of WebhookSubscriptionBasicAuthentication created by the build_from_hash method' do
      webhook_subscription_basic_authentication_from_hash = Bandwidth::WebhookSubscriptionBasicAuthentication.build_from_hash({
        username: 'mySecretUsername',
        password: 'mySecretPassword'
      })
      expect(webhook_subscription_basic_authentication_from_hash).to be_instance_of(Bandwidth::WebhookSubscriptionBasicAuthentication)
      expect(webhook_subscription_basic_authentication_from_hash.username).to eq('mySecretUsername')
      expect(webhook_subscription_basic_authentication_from_hash.password).to eq('mySecretPassword')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(webhook_subscription_basic_authentication_values.to_s).to eq('{:username=>"mySecretUsername", :password=>"mySecretPassword"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      webhook_subscription_basic_authentication_equal = Bandwidth::WebhookSubscriptionBasicAuthentication.new({
        username: 'baseline',
        password: 'baselinePass'
      })
      expect(webhook_subscription_basic_authentication_default.eql?(webhook_subscription_basic_authentication_equal)).to be true
      expect(webhook_subscription_basic_authentication_default.eql?(webhook_subscription_basic_authentication_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(webhook_subscription_basic_authentication_values.to_body).to eq({
        username: 'mySecretUsername',
        password: 'mySecretPassword'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#username=' do
      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new({ username: nil, password: 'pass' })
      }.to raise_error(ArgumentError, 'username cannot be nil')

      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new({ username: 'a' * 101, password: 'pass' })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 100.')
    end

    it '#password=' do
      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new({ username: 'user', password: nil })
      }.to raise_error(ArgumentError, 'password cannot be nil')

      expect {
        Bandwidth::WebhookSubscriptionBasicAuthentication.new({ username: 'user', password: 'a' * 201 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 200.')
    end
  end
end
