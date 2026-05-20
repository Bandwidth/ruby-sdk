# Unit tests for Bandwidth::CreateAsyncBulkLookupResponseData
describe Bandwidth::CreateAsyncBulkLookupResponseData do
  let(:create_async_bulk_lookup_response_data_default) { Bandwidth::CreateAsyncBulkLookupResponseData.new }
  let(:create_async_bulk_lookup_response_data_values) { Bandwidth::CreateAsyncBulkLookupResponseData.new({
    request_id: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
    status: 'IN_PROGRESS'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateAsyncBulkLookupResponseData.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateAsyncBulkLookupResponseData.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateAsyncBulkLookupResponseData.acceptable_attributes).to eq(Bandwidth::CreateAsyncBulkLookupResponseData.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateAsyncBulkLookupResponseData.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateAsyncBulkLookupResponseData created by the build_from_hash method' do
      create_async_bulk_lookup_response_data_from_hash = Bandwidth::CreateAsyncBulkLookupResponseData.build_from_hash({
        requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
        status: 'IN_PROGRESS'
      })
      expect(create_async_bulk_lookup_response_data_from_hash).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponseData)
      expect(create_async_bulk_lookup_response_data_from_hash.request_id).to eq('00b97c1b-d8b4-4a32-ad14-7d09ce04acb6')
      expect(create_async_bulk_lookup_response_data_from_hash.status).to eq('IN_PROGRESS')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_async_bulk_lookup_response_data_values.to_s).to eq('{:requestId=>"00b97c1b-d8b4-4a32-ad14-7d09ce04acb6", :status=>"IN_PROGRESS"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(create_async_bulk_lookup_response_data_default.eql?(Bandwidth::CreateAsyncBulkLookupResponseData.new)).to be true
      expect(create_async_bulk_lookup_response_data_default.eql?(create_async_bulk_lookup_response_data_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_async_bulk_lookup_response_data_values.to_body).to eq({
        requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
        status: 'IN_PROGRESS'
      })
    end
  end
end
