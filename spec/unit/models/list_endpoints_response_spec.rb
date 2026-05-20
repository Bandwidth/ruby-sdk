# Unit tests for Bandwidth::ListEndpointsResponse
describe Bandwidth::ListEndpointsResponse do
  let(:page) { Bandwidth::Page.new({ page_size: 25, total_elements: 100, total_pages: 4, page_number: 1 }) }
  let(:endpoint) { Bandwidth::Endpoints.new({
    endpoint_id: 'abc123',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2024-01-01T00:00:00Z',
    expiration_timestamp: '2024-01-02T00:00:00Z'
  }) }
  let(:list_endpoints_response_default) { Bandwidth::ListEndpointsResponse.new({
    links: [],
    data: [],
    errors: []
  }) }
  let(:list_endpoints_response_values) { Bandwidth::ListEndpointsResponse.new({
    links: [Bandwidth::BrtcLink.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    page: page,
    data: [endpoint],
    errors: [Bandwidth::BrtcError.new({ type: 'validation', description: 'bad input' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ListEndpointsResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ListEndpointsResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ListEndpointsResponse.acceptable_attributes).to eq(Bandwidth::ListEndpointsResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::ListEndpointsResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ListEndpointsResponse created by the build_from_hash method' do
      list_endpoints_response_from_hash = Bandwidth::ListEndpointsResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        page: { pageSize: 25, totalElements: 100, totalPages: 4, pageNumber: 1 },
        data: [{ endpointId: 'abc123', type: 'WEBRTC', status: 'CONNECTED', creationTimestamp: '2024-01-01T00:00:00Z', expirationTimestamp: '2024-01-02T00:00:00Z' }],
        errors: [{ type: 'validation', description: 'bad input' }]
      })
      expect(list_endpoints_response_from_hash).to be_instance_of(Bandwidth::ListEndpointsResponse)
      expect(list_endpoints_response_from_hash.links.first).to be_instance_of(Bandwidth::BrtcLink)
      expect(list_endpoints_response_from_hash.page).to be_instance_of(Bandwidth::Page)
      expect(list_endpoints_response_from_hash.data.first).to be_instance_of(Bandwidth::Endpoints)
      expect(list_endpoints_response_from_hash.errors.first).to be_instance_of(Bandwidth::BrtcError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(list_endpoints_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :page=>{:pageSize=>25, :totalElements=>100, :totalPages=>4, :pageNumber=>1}, :data=>[{:endpointId=>"abc123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2024-01-01T00:00:00Z", :expirationTimestamp=>"2024-01-02T00:00:00Z"}], :errors=>[{:type=>"validation", :description=>"bad input"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      list_endpoints_response_equal = Bandwidth::ListEndpointsResponse.new({
        links: [],
        data: [],
        errors: []
      })
      expect(list_endpoints_response_default.eql?(list_endpoints_response_equal)).to be true
      expect(list_endpoints_response_default.eql?(list_endpoints_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(list_endpoints_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        page: { pageSize: 25, totalElements: 100, totalPages: 4, pageNumber: 1 },
        data: [{ endpointId: 'abc123', type: 'WEBRTC', status: 'CONNECTED', creationTimestamp: '2024-01-01T00:00:00Z', expirationTimestamp: '2024-01-02T00:00:00Z' }],
        errors: [{ type: 'validation', description: 'bad input' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#links=' do
      expect {
        list_endpoints_response_values.links = nil
      }.to raise_error(ArgumentError, 'links cannot be nil')
    end

    it '#data=' do
      expect {
        list_endpoints_response_values.data = nil
      }.to raise_error(ArgumentError, 'data cannot be nil')
    end

    it '#errors=' do
      expect {
        list_endpoints_response_values.errors = nil
      }.to raise_error(ArgumentError, 'errors cannot be nil')
    end
  end
end
