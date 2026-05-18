# Unit tests for Bandwidth::SyncLookupRequest
describe Bandwidth::SyncLookupRequest do
  let(:sync_lookup_request_default) { Bandwidth::SyncLookupRequest.new({
    phone_numbers: ['+19195551234']
  }) }
  let(:sync_lookup_request_values) { Bandwidth::SyncLookupRequest.new({
    phone_numbers: ['+19195551234', '+19195554321'],
    rcs_agent: 'my_agent'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::SyncLookupRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::SyncLookupRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::SyncLookupRequest.acceptable_attributes).to eq(Bandwidth::SyncLookupRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::SyncLookupRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of SyncLookupRequest created by the build_from_hash method' do
      sync_lookup_request_from_hash = Bandwidth::SyncLookupRequest.build_from_hash({
        phoneNumbers: ['+19195551234', '+19195554321'],
        rcsAgent: 'my_agent'
      })
      expect(sync_lookup_request_from_hash).to be_instance_of(Bandwidth::SyncLookupRequest)
      expect(sync_lookup_request_from_hash.phone_numbers).to eq(['+19195551234', '+19195554321'])
      expect(sync_lookup_request_from_hash.rcs_agent).to eq('my_agent')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(sync_lookup_request_values.to_s).to eq('{:phoneNumbers=>["+19195551234", "+19195554321"], :rcsAgent=>"my_agent"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      sync_lookup_request_equal = Bandwidth::SyncLookupRequest.new({
        phone_numbers: ['+19195551234']
      })
      expect(sync_lookup_request_default.eql?(sync_lookup_request_equal)).to be true
      expect(sync_lookup_request_default.eql?(sync_lookup_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(sync_lookup_request_values.to_body).to eq({
        phoneNumbers: ['+19195551234', '+19195554321'],
        rcsAgent: 'my_agent'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_numbers=' do
      expect {
        sync_lookup_request_values.phone_numbers = nil
      }.to raise_error(ArgumentError, 'phone_numbers cannot be nil')
    end

    it '#rcs_agent=' do
      expect {
        Bandwidth::SyncLookupRequest.new({ phone_numbers: ['+19195551234'], rcs_agent: nil })
      }.to raise_error(ArgumentError, 'rcs_agent cannot be nil')

      expect {
        Bandwidth::SyncLookupRequest.new({ phone_numbers: ['+19195551234'], rcs_agent: 'invalid agent!' })
      }.to raise_error(ArgumentError, 'invalid value for "rcs_agent", must conform to the pattern (?-mix:^[A-Za-z0-9_-]{1,40}$).')
    end
  end
end
