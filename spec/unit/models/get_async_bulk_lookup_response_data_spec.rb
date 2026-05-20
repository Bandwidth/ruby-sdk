# Unit tests for Bandwidth::GetAsyncBulkLookupResponseData
describe Bandwidth::GetAsyncBulkLookupResponseData do
  let(:lookup_result) { Bandwidth::LookupResult.new({ phone_number: '+19195551234' }) }
  let(:get_async_bulk_lookup_response_data_default) { Bandwidth::GetAsyncBulkLookupResponseData.new }
  let(:get_async_bulk_lookup_response_data_values) { Bandwidth::GetAsyncBulkLookupResponseData.new({
    request_id: 'abc-123',
    status: Bandwidth::InProgressLookupStatusEnum::COMPLETE,
    results: [lookup_result]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::GetAsyncBulkLookupResponseData.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::GetAsyncBulkLookupResponseData.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::GetAsyncBulkLookupResponseData.acceptable_attributes).to eq(Bandwidth::GetAsyncBulkLookupResponseData.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::GetAsyncBulkLookupResponseData.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of GetAsyncBulkLookupResponseData created by the build_from_hash method' do
      get_async_bulk_lookup_response_data_from_hash = Bandwidth::GetAsyncBulkLookupResponseData.build_from_hash({
        requestId: 'abc-123',
        status: 'COMPLETE',
        results: [{ phoneNumber: '+19195551234' }]
      })
      expect(get_async_bulk_lookup_response_data_from_hash).to be_instance_of(Bandwidth::GetAsyncBulkLookupResponseData)
      expect(get_async_bulk_lookup_response_data_from_hash.request_id).to eq('abc-123')
      expect(get_async_bulk_lookup_response_data_from_hash.status).to eq('COMPLETE')
      expect(get_async_bulk_lookup_response_data_from_hash.results.first).to be_instance_of(Bandwidth::LookupResult)
      expect(get_async_bulk_lookup_response_data_from_hash.results.first.phone_number).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(get_async_bulk_lookup_response_data_values.to_s).to eq('{:requestId=>"abc-123", :status=>"COMPLETE", :results=>[{:phoneNumber=>"+19195551234"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(get_async_bulk_lookup_response_data_default.eql?(Bandwidth::GetAsyncBulkLookupResponseData.new)).to be true
      expect(get_async_bulk_lookup_response_data_default.eql?(get_async_bulk_lookup_response_data_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(get_async_bulk_lookup_response_data_values.to_body).to eq({
        requestId: 'abc-123',
        status: Bandwidth::InProgressLookupStatusEnum::COMPLETE,
        results: [{ phoneNumber: '+19195551234' }]
      })
    end
  end
end
