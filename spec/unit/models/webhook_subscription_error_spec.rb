# Unit tests for Bandwidth::WebhookSubscriptionError
describe Bandwidth::WebhookSubscriptionError do
  let(:webhook_subscription_error_default) { Bandwidth::WebhookSubscriptionError.new }
  let(:webhook_subscription_error_values) { Bandwidth::WebhookSubscriptionError.new({
    code: 400,
    description: 'Invalid request',
    telephone_numbers: [
      Bandwidth::TelephoneNumber.new({ telephone_number: '+18005554321' })
    ]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::WebhookSubscriptionError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::WebhookSubscriptionError.acceptable_attributes).to eq(Bandwidth::WebhookSubscriptionError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::WebhookSubscriptionError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of WebhookSubscriptionError created by the build_from_hash method' do
      webhook_subscription_error_from_hash = Bandwidth::WebhookSubscriptionError.build_from_hash({
        code: 400,
        description: 'Invalid request',
        telephoneNumbers: [{ telephoneNumber: '+18005554321' }]
      })
      expect(webhook_subscription_error_from_hash).to be_instance_of(Bandwidth::WebhookSubscriptionError)
      expect(webhook_subscription_error_from_hash.code).to eq(400)
      expect(webhook_subscription_error_from_hash.description).to eq('Invalid request')
      expect(webhook_subscription_error_from_hash.telephone_numbers).to be_instance_of(Array)
      expect(webhook_subscription_error_from_hash.telephone_numbers.first).to be_instance_of(Bandwidth::TelephoneNumber)
      expect(webhook_subscription_error_from_hash.telephone_numbers.first.telephone_number).to eq('+18005554321')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(webhook_subscription_error_values.to_s).to eq('{:code=>400, :description=>"Invalid request", :telephoneNumbers=>[{:telephoneNumber=>"+18005554321"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(webhook_subscription_error_default.eql?(Bandwidth::WebhookSubscriptionError.new)).to be true
      expect(webhook_subscription_error_default.eql?(webhook_subscription_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(webhook_subscription_error_values.to_body).to eq({
        code: 400,
        description: 'Invalid request',
        telephoneNumbers: [{ telephoneNumber: '+18005554321' }]
      })
    end
  end
end
