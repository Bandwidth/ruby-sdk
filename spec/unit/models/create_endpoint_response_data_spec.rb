# Unit tests for Bandwidth::CreateEndpointResponseData
describe Bandwidth::CreateEndpointResponseData do
  let(:create_endpoint_response_data_default) { Bandwidth::CreateEndpointResponseData.new({
    endpoint_id: 'baseline-endpoint',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2022-06-16T13:15:07.160Z',
    expiration_timestamp: '2022-06-17T13:15:07.160Z',
    token: 'baseline-token'
  }) }
  let(:create_endpoint_response_data_values) { Bandwidth::CreateEndpointResponseData.new({
    endpoint_id: 'ep-abc-123',
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    status: Bandwidth::EndpointStatusEnum::CONNECTED,
    creation_timestamp: '2022-06-16T13:15:07.160Z',
    expiration_timestamp: '2022-06-17T13:15:07.160Z',
    tag: 'custom tag',
    devices: [Bandwidth::Device.new({ device_id: 'd-1', status: 'CONNECTED', creation_timestamp: '2022-06-16T13:15:08.000Z' })],
    token: 'eyJhbGciOiJIUzI1NiJ9'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateEndpointResponseData.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateEndpointResponseData.acceptable_attributes).to eq(Bandwidth::CreateEndpointResponseData.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateEndpointResponseData.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateEndpointResponseData created by the build_from_hash method' do
      create_endpoint_response_data_from_hash = Bandwidth::CreateEndpointResponseData.build_from_hash({
        endpointId: 'ep-abc-123',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creationTimestamp: '2022-06-16T13:15:07.160Z',
        expirationTimestamp: '2022-06-17T13:15:07.160Z',
        tag: 'custom tag',
        devices: [{ deviceId: 'd-1', status: 'CONNECTED', creationTimestamp: '2022-06-16T13:15:08.000Z' }],
        token: 'eyJhbGciOiJIUzI1NiJ9'
      })
      expect(create_endpoint_response_data_from_hash).to be_instance_of(Bandwidth::CreateEndpointResponseData)
      expect(create_endpoint_response_data_from_hash.endpoint_id).to eq('ep-abc-123')
      expect(create_endpoint_response_data_from_hash.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(create_endpoint_response_data_from_hash.status).to eq(Bandwidth::EndpointStatusEnum::CONNECTED)
      expect(create_endpoint_response_data_from_hash.creation_timestamp).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(create_endpoint_response_data_from_hash.expiration_timestamp).to eq(Time.parse('2022-06-17T13:15:07.160Z'))
      expect(create_endpoint_response_data_from_hash.tag).to eq('custom tag')
      expect(create_endpoint_response_data_from_hash.devices.first).to be_instance_of(Bandwidth::Device)
      expect(create_endpoint_response_data_from_hash.token).to eq('eyJhbGciOiJIUzI1NiJ9')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_endpoint_response_data_values.to_s).to eq('{:endpointId=>"ep-abc-123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:07.160Z", :expirationTimestamp=>"2022-06-17T13:15:07.160Z", :tag=>"custom tag", :devices=>[{:deviceId=>"d-1", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:08.000Z"}], :token=>"eyJhbGciOiJIUzI1NiJ9"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_endpoint_response_data_equal = Bandwidth::CreateEndpointResponseData.new({
        endpoint_id: 'baseline-endpoint',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creation_timestamp: '2022-06-16T13:15:07.160Z',
        expiration_timestamp: '2022-06-17T13:15:07.160Z',
        token: 'baseline-token'
      })
      expect(create_endpoint_response_data_default.eql?(create_endpoint_response_data_equal)).to be true
      expect(create_endpoint_response_data_default.eql?(create_endpoint_response_data_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_endpoint_response_data_values.to_body).to eq({
        endpointId: 'ep-abc-123',
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        status: Bandwidth::EndpointStatusEnum::CONNECTED,
        creationTimestamp: '2022-06-16T13:15:07.160Z',
        expirationTimestamp: '2022-06-17T13:15:07.160Z',
        tag: 'custom tag',
        devices: [{ deviceId: 'd-1', status: 'CONNECTED', creationTimestamp: '2022-06-16T13:15:08.000Z' }],
        token: 'eyJhbGciOiJIUzI1NiJ9'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#endpoint_id=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: nil, type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', token: 'a' })
      }.to raise_error(ArgumentError, 'endpoint_id cannot be nil')
    end

    it '#type=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: nil, status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', token: 'a' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#status=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: 'WEBRTC', status: nil, creation_timestamp: 'a', expiration_timestamp: 'a', token: 'a' })
      }.to raise_error(ArgumentError, 'status cannot be nil')
    end

    it '#creation_timestamp=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: nil, expiration_timestamp: 'a', token: 'a' })
      }.to raise_error(ArgumentError, 'creation_timestamp cannot be nil')
    end

    it '#expiration_timestamp=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: nil, token: 'a' })
      }.to raise_error(ArgumentError, 'expiration_timestamp cannot be nil')
    end

    it '#tag=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', token: 'a', tag: nil })
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end

    it '#token=' do
      expect {
        Bandwidth::CreateEndpointResponseData.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', token: nil })
      }.to raise_error(ArgumentError, 'token cannot be nil')
    end
  end
end
