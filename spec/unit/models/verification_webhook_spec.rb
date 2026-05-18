# Unit tests for Bandwidth::VerificationWebhook
describe Bandwidth::VerificationWebhook do
  let(:verification_webhook_default) { Bandwidth::VerificationWebhook.new }
  let(:verification_webhook_values) { Bandwidth::VerificationWebhook.new({
    account_id: '9900000',
    phone_number: '+18005554321',
    status: Bandwidth::TfvCallbackStatusEnum::VERIFIED,
    internal_ticket_number: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VerificationWebhook.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerificationWebhook.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VerificationWebhook.acceptable_attributes).to eq(Bandwidth::VerificationWebhook.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::VerificationWebhook.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VerificationWebhook created by the build_from_hash method' do
      verification_webhook_from_hash = Bandwidth::VerificationWebhook.build_from_hash({
        accountId: '9900000',
        phoneNumber: '+18005554321',
        status: Bandwidth::TfvCallbackStatusEnum::VERIFIED,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3'
      })
      expect(verification_webhook_from_hash).to be_instance_of(Bandwidth::VerificationWebhook)
      expect(verification_webhook_from_hash.account_id).to eq('9900000')
      expect(verification_webhook_from_hash.phone_number).to eq('+18005554321')
      expect(verification_webhook_from_hash.status).to eq(Bandwidth::TfvCallbackStatusEnum::VERIFIED)
      expect(verification_webhook_from_hash.internal_ticket_number).to eq('8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(verification_webhook_values.to_s).to eq('{:accountId=>"9900000", :phoneNumber=>"+18005554321", :status=>"VERIFIED", :internalTicketNumber=>"8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(verification_webhook_default.eql?(Bandwidth::VerificationWebhook.new)).to be true
      expect(verification_webhook_default.eql?(verification_webhook_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(verification_webhook_values.to_body).to eq({
        accountId: '9900000',
        phoneNumber: '+18005554321',
        status: Bandwidth::TfvCallbackStatusEnum::VERIFIED,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_number=' do
      expect {
        Bandwidth::VerificationWebhook.new({ phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::VerificationWebhook.new({ phone_number: '+1800555432' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 12.')

      expect {
        Bandwidth::VerificationWebhook.new({ phone_number: '+180055543210' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.')

      expect {
        Bandwidth::VerificationWebhook.new({ phone_number: '+12345678901' })
      }.to raise_error(ArgumentError, /invalid value for "phone_number", must conform to the pattern/)
    end
  end
end
