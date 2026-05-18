# Unit tests for Bandwidth::EndpointResponse
describe Bandwidth::EndpointResponse do
  let(:endpoint_data) { Bandwidth::Endpoint.new({
    endpoint_id: 'abc123',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2024-01-01T00:00:00Z',
    expiration_timestamp: '2024-01-02T00:00:00Z'
  }) }
  let(:endpoint_response_default) { Bandwidth::EndpointResponse.new({
    links: [],
    data: endpoint_data,
    errors: []
  }) }
  let(:endpoint_response_values) { Bandwidth::EndpointResponse.new({
    links: [Bandwidth::BrtcLink.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: endpoint_data,
    errors: [Bandwidth::BrtcError.new({ type: 'validation', description: 'bad input' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::EndpointResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::EndpointResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::EndpointResponse.acceptable_attributes).to eq(Bandwidth::EndpointResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::EndpointResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of EndpointResponse created by the build_from_hash method' do
      endpoint_response_from_hash = Bandwidth::EndpointResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { endpointId: 'abc123', type: 'WEBRTC', status: 'CONNECTED', creationTimestamp: '2024-01-01T00:00:00Z', expirationTimestamp: '2024-01-02T00:00:00Z' },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
      expect(endpoint_response_from_hash).to be_instance_of(Bandwidth::EndpointResponse)
      expect(endpoint_response_from_hash.links.first).to be_instance_of(Bandwidth::BrtcLink)
      expect(endpoint_response_from_hash.data).to be_instance_of(Bandwidth::Endpoint)
      expect(endpoint_response_from_hash.errors.first).to be_instance_of(Bandwidth::BrtcError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(endpoint_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:endpointId=>"abc123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2024-01-01T00:00:00Z", :expirationTimestamp=>"2024-01-02T00:00:00Z"}, :errors=>[{:type=>"validation", :description=>"bad input"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      endpoint_response_equal = Bandwidth::EndpointResponse.new({
        links: [],
        data: endpoint_data,
        errors: []
      })
      expect(endpoint_response_default.eql?(endpoint_response_equal)).to be true
      expect(endpoint_response_default.eql?(endpoint_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(endpoint_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { endpointId: 'abc123', type: 'WEBRTC', status: 'CONNECTED', creationTimestamp: '2024-01-01T00:00:00Z', expirationTimestamp: '2024-01-02T00:00:00Z' },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#links=' do
      expect {
        endpoint_response_values.links = nil
      }.to raise_error(ArgumentError, 'links cannot be nil')
    end

    it '#data=' do
      expect {
        endpoint_response_values.data = nil
      }.to raise_error(ArgumentError, 'data cannot be nil')
    end

    it '#errors=' do
      expect {
        endpoint_response_values.errors = nil
      }.to raise_error(ArgumentError, 'errors cannot be nil')
    end
  end
end
