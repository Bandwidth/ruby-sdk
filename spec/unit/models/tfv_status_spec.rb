# Unit tests for Bandwidth::TfvStatus
describe Bandwidth::TfvStatus do
  let(:tfv_status_default) { Bandwidth::TfvStatus.new }
  let(:tfv_status_values) { Bandwidth::TfvStatus.new({
    phone_number: '+18005554321',
    status: Bandwidth::TfvStatusEnum::VERIFIED,
    internal_ticket_number: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
    decline_reason_description: 'The reason for declining',
    denial_status_code: 100,
    additional_denial_reasons: [Bandwidth::AdditionalDenialReason.new({ status_code: 100, reason: 'reason text', resubmit_allowed: true })],
    resubmit_allowed: false,
    created_date_time: '2024-01-01T00:00:00Z',
    modified_date_time: '2024-01-02T00:00:00Z',
    submission: { businessAddress: { name: 'Bandwidth' } },
    blocked: false,
    blocked_reason: 'The reason for blocking',
    cv_token: 'cv_token_value'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TfvStatus.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TfvStatus.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TfvStatus.acceptable_attributes).to eq(Bandwidth::TfvStatus.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::TfvStatus.openapi_nullable).to eq(Set.new([
        :'denial_status_code',
        :'additional_denial_reasons',
        :'cv_token'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TfvStatus created by the build_from_hash method' do
      tfv_status_from_hash = Bandwidth::TfvStatus.build_from_hash({
        phoneNumber: '+18005554321',
        status: Bandwidth::TfvStatusEnum::VERIFIED,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
        declineReasonDescription: 'The reason for declining',
        denialStatusCode: 100,
        additionalDenialReasons: [{ statusCode: 100, reason: 'reason text', resubmitAllowed: true }],
        resubmitAllowed: false,
        createdDateTime: '2024-01-01T00:00:00Z',
        modifiedDateTime: '2024-01-02T00:00:00Z',
        submission: { businessAddress: { name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.bandwidth.com' } },
        blocked: false,
        blockedReason: 'The reason for blocking',
        cvToken: 'cv_token_value'
      })
      expect(tfv_status_from_hash).to be_instance_of(Bandwidth::TfvStatus)
      expect(tfv_status_from_hash.phone_number).to eq('+18005554321')
      expect(tfv_status_from_hash.status).to eq(Bandwidth::TfvStatusEnum::VERIFIED)
      expect(tfv_status_from_hash.internal_ticket_number).to eq('8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3')
      expect(tfv_status_from_hash.decline_reason_description).to eq('The reason for declining')
      expect(tfv_status_from_hash.denial_status_code).to eq(100)
      expect(tfv_status_from_hash.additional_denial_reasons.first).to be_instance_of(Bandwidth::AdditionalDenialReason)
      expect(tfv_status_from_hash.resubmit_allowed).to eq(false)
      expect(tfv_status_from_hash.created_date_time).to eq(Time.parse('2024-01-01T00:00:00Z'))
      expect(tfv_status_from_hash.modified_date_time).to eq(Time.parse('2024-01-02T00:00:00Z'))
      expect(tfv_status_from_hash.submission).to be_instance_of(Bandwidth::TfvSubmissionInfo)
      expect(tfv_status_from_hash.blocked).to eq(false)
      expect(tfv_status_from_hash.blocked_reason).to eq('The reason for blocking')
      expect(tfv_status_from_hash.cv_token).to eq('cv_token_value')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(tfv_status_values.to_s).to eq('{:phoneNumber=>"+18005554321", :status=>"VERIFIED", :internalTicketNumber=>"8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3", :declineReasonDescription=>"The reason for declining", :denialStatusCode=>100, :additionalDenialReasons=>[{:statusCode=>100, :reason=>"reason text", :resubmitAllowed=>true}], :resubmitAllowed=>false, :createdDateTime=>"2024-01-01T00:00:00Z", :modifiedDateTime=>"2024-01-02T00:00:00Z", :submission=>{:businessAddress=>{:name=>"Bandwidth"}}, :blocked=>false, :blockedReason=>"The reason for blocking", :cvToken=>"cv_token_value"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(tfv_status_default.eql?(Bandwidth::TfvStatus.new)).to be true
      expect(tfv_status_default.eql?(tfv_status_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(tfv_status_values.to_body).to eq({
        phoneNumber: '+18005554321',
        status: Bandwidth::TfvStatusEnum::VERIFIED,
        internalTicketNumber: '8c8f33f8-0d72-43c8-8b6c-1da8f0a9e6b3',
        declineReasonDescription: 'The reason for declining',
        denialStatusCode: 100,
        additionalDenialReasons: [{ statusCode: 100, reason: 'reason text', resubmitAllowed: true }],
        resubmitAllowed: false,
        createdDateTime: '2024-01-01T00:00:00Z',
        modifiedDateTime: '2024-01-02T00:00:00Z',
        submission: { businessAddress: { name: 'Bandwidth' } },
        blocked: false,
        blockedReason: 'The reason for blocking',
        cvToken: 'cv_token_value'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_number=' do
      expect {
        Bandwidth::TfvStatus.new({ phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::TfvStatus.new({ phone_number: '+1800555432' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 12.')

      expect {
        Bandwidth::TfvStatus.new({ phone_number: '+180055543210' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.')

      expect {
        Bandwidth::TfvStatus.new({ phone_number: '+12345678901' })
      }.to raise_error(ArgumentError, /invalid value for "phone_number", must conform to the pattern/)
    end

    it '#cv_token=' do
      expect {
        Bandwidth::TfvStatus.new({ cv_token: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "cv_token", the character length must be smaller than or equal to 500.')
    end
  end
end
