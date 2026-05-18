# Unit tests for Bandwidth::CreateSyncLookupResponse
describe Bandwidth::CreateSyncLookupResponse do
  let(:create_sync_lookup_response_default) { Bandwidth::CreateSyncLookupResponse.new }
  let(:create_sync_lookup_response_values) { Bandwidth::CreateSyncLookupResponse.new({
    links: [Bandwidth::LinkSchema.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: Bandwidth::CreateSyncLookupResponseData.new({ request_id: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'COMPLETE' }),
    errors: [Bandwidth::LookupErrorSchema.new({ code: 'E1', description: 'bad', type: 'validation' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateSyncLookupResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateSyncLookupResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateSyncLookupResponse.acceptable_attributes).to eq(Bandwidth::CreateSyncLookupResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateSyncLookupResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateSyncLookupResponse created by the build_from_hash method' do
      create_sync_lookup_response_from_hash = Bandwidth::CreateSyncLookupResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'COMPLETE' },
        errors: [{ code: 'E1', description: 'bad', type: 'validation' }]
      })
      expect(create_sync_lookup_response_from_hash).to be_instance_of(Bandwidth::CreateSyncLookupResponse)
      expect(create_sync_lookup_response_from_hash.links.first).to be_instance_of(Bandwidth::LinkSchema)
      expect(create_sync_lookup_response_from_hash.data).to be_instance_of(Bandwidth::CreateSyncLookupResponseData)
      expect(create_sync_lookup_response_from_hash.errors.first).to be_instance_of(Bandwidth::LookupErrorSchema)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_sync_lookup_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:requestId=>"00b97c1b-d8b4-4a32-ad14-7d09ce04acb6", :status=>"COMPLETE"}, :errors=>[{:code=>"E1", :description=>"bad", :type=>"validation"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(create_sync_lookup_response_default.eql?(Bandwidth::CreateSyncLookupResponse.new)).to be true
      expect(create_sync_lookup_response_default.eql?(create_sync_lookup_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_sync_lookup_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6', status: 'COMPLETE' },
        errors: [{ code: 'E1', description: 'bad', type: 'validation' }]
      })
    end
  end
end
