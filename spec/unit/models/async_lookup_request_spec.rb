# Unit tests for Bandwidth::AsyncLookupRequest
describe Bandwidth::AsyncLookupRequest do
  let(:async_lookup_request_default) { Bandwidth::AsyncLookupRequest.new({
    phone_numbers: ['+19195551234']
  }) }
  let(:async_lookup_request_values) { Bandwidth::AsyncLookupRequest.new({
    phone_numbers: ['+19195551234', '+19195554321']
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::AsyncLookupRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::AsyncLookupRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::AsyncLookupRequest.acceptable_attributes).to eq(Bandwidth::AsyncLookupRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::AsyncLookupRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of AsyncLookupRequest created by the build_from_hash method' do
      async_lookup_request_from_hash = Bandwidth::AsyncLookupRequest.build_from_hash({
        phoneNumbers: ['+19195551234', '+19195554321']
      })
      expect(async_lookup_request_from_hash).to be_instance_of(Bandwidth::AsyncLookupRequest)
      expect(async_lookup_request_from_hash.phone_numbers).to eq(['+19195551234', '+19195554321'])
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(async_lookup_request_values.to_s).to eq('{:phoneNumbers=>["+19195551234", "+19195554321"]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      async_lookup_request_equal = Bandwidth::AsyncLookupRequest.new({
        phone_numbers: ['+19195551234']
      })
      expect(async_lookup_request_default.eql?(async_lookup_request_equal)).to be true
      expect(async_lookup_request_default.eql?(async_lookup_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(async_lookup_request_values.to_body).to eq({
        phoneNumbers: ['+19195551234', '+19195554321']
      })
    end
  end

  describe 'custom attribute writers' do
    it '#phone_numbers=' do
      expect {
        async_lookup_request_values.phone_numbers = nil
      }.to raise_error(ArgumentError, 'phone_numbers cannot be nil')
    end
  end
end
