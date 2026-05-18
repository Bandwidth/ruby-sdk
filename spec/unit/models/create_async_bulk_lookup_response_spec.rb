# Unit tests for Bandwidth::CreateAsyncBulkLookupResponse
describe Bandwidth::CreateAsyncBulkLookupResponse do
  let(:create_async_bulk_lookup_response_default) { Bandwidth::CreateAsyncBulkLookupResponse.new }
  let(:create_async_bulk_lookup_response_values) { Bandwidth::CreateAsyncBulkLookupResponse.new({
    links: [Bandwidth::LinkSchema.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: Bandwidth::CreateAsyncBulkLookupResponseData.new({ request_id: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'IN_PROGRESS' }),
    errors: [Bandwidth::LookupErrorSchema.new({ code: 'E1', description: 'bad', type: 'validation' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateAsyncBulkLookupResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateAsyncBulkLookupResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateAsyncBulkLookupResponse.acceptable_attributes).to eq(Bandwidth::CreateAsyncBulkLookupResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateAsyncBulkLookupResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateAsyncBulkLookupResponse created by the build_from_hash method' do
      create_async_bulk_lookup_response_from_hash = Bandwidth::CreateAsyncBulkLookupResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'IN_PROGRESS' },
        errors: [{ code: 'E1', description: 'bad', type: 'validation' }]
      })
      expect(create_async_bulk_lookup_response_from_hash).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponse)
      expect(create_async_bulk_lookup_response_from_hash.links.first).to be_instance_of(Bandwidth::LinkSchema)
      expect(create_async_bulk_lookup_response_from_hash.data).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponseData)
      expect(create_async_bulk_lookup_response_from_hash.errors.first).to be_instance_of(Bandwidth::LookupErrorSchema)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_async_bulk_lookup_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:requestId=>"00b97c1b-d8b4-4a32-ad14-7d09ce04acb6", :status=>"IN_PROGRESS"}, :errors=>[{:code=>"E1", :description=>"bad", :type=>"validation"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(create_async_bulk_lookup_response_default.eql?(Bandwidth::CreateAsyncBulkLookupResponse.new)).to be true
      expect(create_async_bulk_lookup_response_default.eql?(create_async_bulk_lookup_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_async_bulk_lookup_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'IN_PROGRESS' },
        errors: [{ code: 'E1', description: 'bad', type: 'validation' }]
      })
    end
  end
end
