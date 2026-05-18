# Unit tests for Bandwidth::BlockedWebhook
describe Bandwidth::BlockedWebhook do
  let(:blocked_webhook_default) { Bandwidth::BlockedWebhook.new }
  let(:blocked_webhook_values) { Bandwidth::BlockedWebhook.new({
    account_id: '9900000',
    phone_number: '+18005551234',
    status: 'VERIFIED',
    internal_ticket_number: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee',
    blocked: true,
    blocked_reason: 'spam'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BlockedWebhook.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BlockedWebhook.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::BlockedWebhook.acceptable_attributes).to eq(Bandwidth::BlockedWebhook.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::BlockedWebhook.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BlockedWebhook created by the build_from_hash method' do
      blocked_webhook_from_hash = Bandwidth::BlockedWebhook.build_from_hash({
        accountId: '9900000',
        phoneNumber: '+18005551234',
        status: 'VERIFIED',
        internalTicketNumber: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee',
        blocked: true,
        blockedReason: 'spam'
      })
      expect(blocked_webhook_from_hash).to be_instance_of(Bandwidth::BlockedWebhook)
      expect(blocked_webhook_from_hash.account_id).to eq('9900000')
      expect(blocked_webhook_from_hash.phone_number).to eq('+18005551234')
      expect(blocked_webhook_from_hash.status).to eq('VERIFIED')
      expect(blocked_webhook_from_hash.internal_ticket_number).to eq('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee')
      expect(blocked_webhook_from_hash.blocked).to eq(true)
      expect(blocked_webhook_from_hash.blocked_reason).to eq('spam')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(blocked_webhook_values.to_s).to eq('{:accountId=>"9900000", :phoneNumber=>"+18005551234", :status=>"VERIFIED", :internalTicketNumber=>"aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee", :blocked=>true, :blockedReason=>"spam"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(blocked_webhook_default.eql?(Bandwidth::BlockedWebhook.new)).to be true
      expect(blocked_webhook_default.eql?(blocked_webhook_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(blocked_webhook_values.to_body).to eq({
        accountId: '9900000',
        phoneNumber: '+18005551234',
        status: 'VERIFIED',
        internalTicketNumber: 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee',
        blocked: true,
        blockedReason: 'spam'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_number=' do
      expect {
        Bandwidth::BlockedWebhook.new({ phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::BlockedWebhook.new({ phone_number: '+1800555123456' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 12.')

      expect {
        Bandwidth::BlockedWebhook.new({ phone_number: '+1800555' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 12.')

      expect {
        Bandwidth::BlockedWebhook.new({ phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, /invalid value for "phone_number", must conform to the pattern/)
    end
  end
end
