# Unit tests for Bandwidth::GetAsyncBulkLookupResponse
describe Bandwidth::GetAsyncBulkLookupResponse do
  let(:get_async_bulk_lookup_response_default) { Bandwidth::GetAsyncBulkLookupResponse.new }
  let(:get_async_bulk_lookup_response_values) { Bandwidth::GetAsyncBulkLookupResponse.new({
    links: [Bandwidth::LinkSchema.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: Bandwidth::GetAsyncBulkLookupResponseData.new({ request_id: 'abc-123' }),
    errors: [Bandwidth::LookupErrorSchema.new({ code: '400', description: 'bad request', type: 'validation' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::GetAsyncBulkLookupResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::GetAsyncBulkLookupResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::GetAsyncBulkLookupResponse.acceptable_attributes).to eq(Bandwidth::GetAsyncBulkLookupResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::GetAsyncBulkLookupResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of GetAsyncBulkLookupResponse created by the build_from_hash method' do
      get_async_bulk_lookup_response_from_hash = Bandwidth::GetAsyncBulkLookupResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: 'abc-123' },
        errors: [{ code: '400', description: 'bad request', type: 'validation' }]
      })
      expect(get_async_bulk_lookup_response_from_hash).to be_instance_of(Bandwidth::GetAsyncBulkLookupResponse)
      expect(get_async_bulk_lookup_response_from_hash.links.first).to be_instance_of(Bandwidth::LinkSchema)
      expect(get_async_bulk_lookup_response_from_hash.data).to be_instance_of(Bandwidth::GetAsyncBulkLookupResponseData)
      expect(get_async_bulk_lookup_response_from_hash.errors.first).to be_instance_of(Bandwidth::LookupErrorSchema)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(get_async_bulk_lookup_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:requestId=>"abc-123"}, :errors=>[{:code=>"400", :description=>"bad request", :type=>"validation"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(get_async_bulk_lookup_response_default.eql?(Bandwidth::GetAsyncBulkLookupResponse.new)).to be true
      expect(get_async_bulk_lookup_response_default.eql?(get_async_bulk_lookup_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(get_async_bulk_lookup_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: 'abc-123' },
        errors: [{ code: '400', description: 'bad request', type: 'validation' }]
      })
    end
  end
end
