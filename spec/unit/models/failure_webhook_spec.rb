# Unit tests for Bandwidth::FailureWebhook
describe Bandwidth::FailureWebhook do
  let(:failure_webhook_default) { Bandwidth::FailureWebhook.new }
  let(:failure_webhook_values) { Bandwidth::FailureWebhook.new({
    account_id: '9900000',
    phone_number: '+18005551234',
    error_code: '400',
    error_message: 'bad request',
    errors: ['missing field'],
    internal_ticket_number: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::FailureWebhook.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::FailureWebhook.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::FailureWebhook.acceptable_attributes).to eq(Bandwidth::FailureWebhook.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::FailureWebhook.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of FailureWebhook created by the build_from_hash method' do
      failure_webhook_from_hash = Bandwidth::FailureWebhook.build_from_hash({
        accountId: '9900000',
        phoneNumber: '+18005551234',
        errorCode: '400',
        errorMessage: 'bad request',
        errors: ['missing field'],
        internalTicketNumber: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee'
      })
      expect(failure_webhook_from_hash).to be_instance_of(Bandwidth::FailureWebhook)
      expect(failure_webhook_from_hash.account_id).to eq('9900000')
      expect(failure_webhook_from_hash.phone_number).to eq('+18005551234')
      expect(failure_webhook_from_hash.error_code).to eq('400')
      expect(failure_webhook_from_hash.error_message).to eq('bad request')
      expect(failure_webhook_from_hash.errors).to eq(['missing field'])
      expect(failure_webhook_from_hash.internal_ticket_number).to eq('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(failure_webhook_values.to_s).to eq('{:accountId=>"9900000", :phoneNumber=>"+18005551234", :errorCode=>"400", :errorMessage=>"bad request", :errors=>["missing field"], :internalTicketNumber=>"aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(failure_webhook_default.eql?(Bandwidth::FailureWebhook.new)).to be true
      expect(failure_webhook_default.eql?(failure_webhook_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(failure_webhook_values.to_body).to eq({
        accountId: '9900000',
        phoneNumber: '+18005551234',
        errorCode: '400',
        errorMessage: 'bad request',
        errors: ['missing field'],
        internalTicketNumber: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_number=' do
      expect {
        Bandwidth::FailureWebhook.new({ phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::FailureWebhook.new({ phone_number: '+1800555123456' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.')

      expect {
        Bandwidth::FailureWebhook.new({ phone_number: '+1800555' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 12.')

      expect {
        Bandwidth::FailureWebhook.new({ phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", must conform to the pattern (?-mix:^\+1(800|833|844|855|866|877|888)[2-9]\d{6}$).')
    end
  end
end
