# Unit tests for Bandwidth::VerificationDenialWebhook
describe Bandwidth::VerificationDenialWebhook do
  let(:verification_denial_webhook_default) { Bandwidth::VerificationDenialWebhook.new }
  let(:verification_denial_webhook_values) { Bandwidth::VerificationDenialWebhook.new({
    account_id: '9900000',
    additional_denial_reasons: [
      Bandwidth::AdditionalDenialReason.new({ status_code: 100, reason: 'reason text', resubmit_allowed: true })
    ],
    decline_reason_description: 'The reason for declining',
    denial_status_code: 100,
    internal_ticket_number: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
    phone_number: '+18005554321',
    resubmit_allowed: true,
    status: 'UNVERIFIED',
    blocked: false,
    blocked_reason: 'The reason for blocking'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VerificationDenialWebhook.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerificationDenialWebhook.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VerificationDenialWebhook.acceptable_attributes).to eq(Bandwidth::VerificationDenialWebhook.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::VerificationDenialWebhook.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VerificationDenialWebhook created by the build_from_hash method' do
      verification_denial_webhook_from_hash = Bandwidth::VerificationDenialWebhook.build_from_hash({
        accountId: '9900000',
        additionalDenialReasons: [{ statusCode: 100, reason: 'reason text', resubmitAllowed: true }],
        declineReasonDescription: 'The reason for declining',
        denialStatusCode: 100,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
        phoneNumber: '+18005554321',
        resubmitAllowed: true,
        status: 'UNVERIFIED',
        blocked: false,
        blockedReason: 'The reason for blocking'
      })
      expect(verification_denial_webhook_from_hash).to be_instance_of(Bandwidth::VerificationDenialWebhook)
      expect(verification_denial_webhook_from_hash.account_id).to eq('9900000')
      expect(verification_denial_webhook_from_hash.additional_denial_reasons).to be_instance_of(Array)
      expect(verification_denial_webhook_from_hash.additional_denial_reasons.first).to be_instance_of(Bandwidth::AdditionalDenialReason)
      expect(verification_denial_webhook_from_hash.decline_reason_description).to eq('The reason for declining')
      expect(verification_denial_webhook_from_hash.denial_status_code).to eq(100)
      expect(verification_denial_webhook_from_hash.internal_ticket_number).to eq('8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3')
      expect(verification_denial_webhook_from_hash.phone_number).to eq('+18005554321')
      expect(verification_denial_webhook_from_hash.resubmit_allowed).to eq(true)
      expect(verification_denial_webhook_from_hash.status).to eq('UNVERIFIED')
      expect(verification_denial_webhook_from_hash.blocked).to eq(false)
      expect(verification_denial_webhook_from_hash.blocked_reason).to eq('The reason for blocking')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(verification_denial_webhook_values.to_s).to eq('{:accountId=>"9900000", :additionalDenialReasons=>[{:statusCode=>100, :reason=>"reason text", :resubmitAllowed=>true}], :declineReasonDescription=>"The reason for declining", :denialStatusCode=>100, :internalTicketNumber=>"8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3", :phoneNumber=>"+18005554321", :resubmitAllowed=>true, :status=>"UNVERIFIED", :blocked=>false, :blockedReason=>"The reason for blocking"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(verification_denial_webhook_default.eql?(Bandwidth::VerificationDenialWebhook.new)).to be true
      expect(verification_denial_webhook_default.eql?(verification_denial_webhook_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(verification_denial_webhook_values.to_body).to eq({
        accountId: '9900000',
        additionalDenialReasons: [{ statusCode: 100, reason: 'reason text', resubmitAllowed: true }],
        declineReasonDescription: 'The reason for declining',
        denialStatusCode: 100,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
        phoneNumber: '+18005554321',
        resubmitAllowed: true,
        status: 'UNVERIFIED',
        blocked: false,
        blockedReason: 'The reason for blocking'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_number=' do
      expect {
        Bandwidth::VerificationDenialWebhook.new({ phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::VerificationDenialWebhook.new({ phone_number: '+1800555432' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 12.')

      expect {
        Bandwidth::VerificationDenialWebhook.new({ phone_number: '+180055543210' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.')

      expect {
        Bandwidth::VerificationDenialWebhook.new({ phone_number: '+12345678901' })
      }.to raise_error(ArgumentError, /invalid value for "phone_number", must conform to the pattern/)
    end
  end
end
