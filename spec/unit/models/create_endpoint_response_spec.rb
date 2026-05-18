# Unit tests for Bandwidth::CreateEndpointResponse
describe Bandwidth::CreateEndpointResponse do
  let(:create_endpoint_response_default) { Bandwidth::CreateEndpointResponse.new({
    links: [],
    data: {},
    errors: []
  }) }
  let(:create_endpoint_response_values) { Bandwidth::CreateEndpointResponse.new({
    links: [Bandwidth::BrtcLink.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: Bandwidth::CreateEndpointResponseData.new({
      endpoint_id: 'ep-abc-123',
      type: 'WEBRTC',
      status: 'CONNECTED',
      creation_timestamp: '2022-06-16T13:15:07.160Z',
      expiration_timestamp: '2022-06-17T13:15:07.160Z',
      token: 'eyJhbGciOiJIUzI1NiJ9'
    }),
    errors: [Bandwidth::BrtcError.new({ type: 'validation', description: 'bad input' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateEndpointResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateEndpointResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateEndpointResponse.acceptable_attributes).to eq(Bandwidth::CreateEndpointResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateEndpointResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateEndpointResponse created by the build_from_hash method' do
      create_endpoint_response_from_hash = Bandwidth::CreateEndpointResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: {
          endpointId: 'ep-abc-123',
          type: 'WEBRTC',
          status: 'CONNECTED',
          creationTimestamp: '2022-06-16T13:15:07.160Z',
          expirationTimestamp: '2022-06-17T13:15:07.160Z',
          token: 'eyJhbGciOiJIUzI1NiJ9'
        },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
      expect(create_endpoint_response_from_hash).to be_instance_of(Bandwidth::CreateEndpointResponse)
      expect(create_endpoint_response_from_hash.links.first).to be_instance_of(Bandwidth::BrtcLink)
      expect(create_endpoint_response_from_hash.data).to be_instance_of(Bandwidth::CreateEndpointResponseData)
      expect(create_endpoint_response_from_hash.errors.first).to be_instance_of(Bandwidth::BrtcError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_endpoint_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:endpointId=>"ep-abc-123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:07.160Z", :expirationTimestamp=>"2022-06-17T13:15:07.160Z", :token=>"eyJhbGciOiJIUzI1NiJ9"}, :errors=>[{:type=>"validation", :description=>"bad input"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_endpoint_response_equal = Bandwidth::CreateEndpointResponse.new({
        links: [],
        data: {},
        errors: []
      })
      expect(create_endpoint_response_default.eql?(create_endpoint_response_equal)).to be true
      expect(create_endpoint_response_default.eql?(create_endpoint_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_endpoint_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: {
          endpointId: 'ep-abc-123',
          type: Bandwidth::EndpointTypeEnum::WEBRTC,
          status: Bandwidth::EndpointStatusEnum::CONNECTED,
          creationTimestamp: '2022-06-16T13:15:07.160Z',
          expirationTimestamp: '2022-06-17T13:15:07.160Z',
          token: 'eyJhbGciOiJIUzI1NiJ9'
        },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#links=' do
      expect {
        create_endpoint_response_values.links = nil
      }.to raise_error(ArgumentError, 'links cannot be nil')
    end

    it '#data=' do
      expect {
        create_endpoint_response_values.data = nil
      }.to raise_error(ArgumentError, 'data cannot be nil')
    end

    it '#errors=' do
      expect {
        create_endpoint_response_values.errors = nil
      }.to raise_error(ArgumentError, 'errors cannot be nil')
    end
  end
end
