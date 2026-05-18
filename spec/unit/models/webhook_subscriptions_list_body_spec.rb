# Unit tests for Bandwidth::WebhookSubscriptionsListBody
describe Bandwidth::WebhookSubscriptionsListBody do
  let(:webhook_subscriptions_list_body_default) { Bandwidth::WebhookSubscriptionsListBody.new({
    data: []
  }) }
  let(:webhook_subscriptions_list_body_values) { Bandwidth::WebhookSubscriptionsListBody.new({
    links: { self: 'https://example.com/self' },
    errors: [
      Bandwidth::WebhookSubscriptionError.new({ code: 400, description: 'Invalid request' })
    ],
    data: [
      Bandwidth::WebhookSubscription.new({ id: '6cf73464-0c9f-431f-bd16-3711df296b9a', account_id: '9900000' })
    ]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionsListBody.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionsListBody.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::WebhookSubscriptionsListBody.acceptable_attributes).to eq(Bandwidth::WebhookSubscriptionsListBody.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::WebhookSubscriptionsListBody.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of WebhookSubscriptionsListBody created by the build_from_hash method' do
      webhook_subscriptions_list_body_from_hash = Bandwidth::WebhookSubscriptionsListBody.build_from_hash({
        links: { self: 'https://example.com/self' },
        errors: [{ code: 400, description: 'Invalid request' }],
        data: [{ id: '6cf73464-0c9f-431f-bd16-3711df296b9a', accountId: '9900000' }]
      })
      expect(webhook_subscriptions_list_body_from_hash).to be_instance_of(Bandwidth::WebhookSubscriptionsListBody)
      expect(webhook_subscriptions_list_body_from_hash.links).to be_instance_of(Bandwidth::LinksObject)
      expect(webhook_subscriptions_list_body_from_hash.errors).to be_instance_of(Array)
      expect(webhook_subscriptions_list_body_from_hash.errors.first).to be_instance_of(Bandwidth::WebhookSubscriptionError)
      expect(webhook_subscriptions_list_body_from_hash.data).to be_instance_of(Array)
      expect(webhook_subscriptions_list_body_from_hash.data.first).to be_instance_of(Bandwidth::WebhookSubscription)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(webhook_subscriptions_list_body_values.to_s).to eq('{:links=>{:self=>"https://example.com/self"}, :errors=>[{:code=>400, :description=>"Invalid request"}], :data=>[{:id=>"6cf73464-0c9f-431f-bd16-3711df296b9a", :accountId=>"9900000", :callbackUrl=>nil}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      webhook_subscriptions_list_body_equal = Bandwidth::WebhookSubscriptionsListBody.new({
        data: []
      })
      expect(webhook_subscriptions_list_body_default.eql?(webhook_subscriptions_list_body_equal)).to be true
      expect(webhook_subscriptions_list_body_default.eql?(webhook_subscriptions_list_body_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(webhook_subscriptions_list_body_values.to_body).to eq({
        links: { self: 'https://example.com/self' },
        errors: [{ code: 400, description: 'Invalid request' }],
        data: [{ id: '6cf73464-0c9f-431f-bd16-3711df296b9a', accountId: '9900000', callbackUrl: nil }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#data=' do
      expect {
        webhook_subscriptions_list_body_values.data = nil
      }.to raise_error(ArgumentError, 'data cannot be nil')
    end
  end
end
