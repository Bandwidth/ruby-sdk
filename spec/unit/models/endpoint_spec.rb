# Unit tests for Bandwidth::Endpoint
describe Bandwidth::Endpoint do
  let(:endpoint_default) { Bandwidth::Endpoint.new({
    endpoint_id: 'endpoint-1',
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    status: Bandwidth::EndpointStatusEnum::CONNECTED,
    creation_timestamp: '2024-01-01T00:00:00Z',
    expiration_timestamp: '2024-01-02T00:00:00Z'
  }) }
  let(:endpoint_values) { Bandwidth::Endpoint.new({
    endpoint_id: 'endpoint-2',
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    status: Bandwidth::EndpointStatusEnum::DISCONNECTED,
    creation_timestamp: '2024-02-01T00:00:00Z',
    expiration_timestamp: '2024-02-02T00:00:00Z',
    tag: 'custom tag',
    devices: [{ device_id: 'device-1', device_name: 'Phone', status: 'CONNECTED', creation_timestamp: '2024-02-01T00:00:00Z' }]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Endpoint.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Endpoint.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Endpoint.acceptable_attributes).to eq(Bandwidth::Endpoint.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Endpoint.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Endpoint created by the build_from_hash method' do
      endpoint_from_hash = Bandwidth::Endpoint.build_from_hash({
        endpointId: 'endpoint-2',
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        status: Bandwidth::EndpointStatusEnum::DISCONNECTED,
        creationTimestamp: '2024-02-01T00:00:00Z',
        expirationTimestamp: '2024-02-02T00:00:00Z',
        tag: 'custom tag',
        devices: [{ deviceId: 'device-1', deviceName: 'Phone', status: 'CONNECTED', creationTimestamp: '2024-02-01T00:00:00Z' }]
      })
      expect(endpoint_from_hash).to be_instance_of(Bandwidth::Endpoint)
      expect(endpoint_from_hash.endpoint_id).to eq('endpoint-2')
      expect(endpoint_from_hash.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(endpoint_from_hash.status).to eq(Bandwidth::EndpointStatusEnum::DISCONNECTED)
      expect(endpoint_from_hash.creation_timestamp).to eq(Time.parse('2024-02-01T00:00:00Z'))
      expect(endpoint_from_hash.expiration_timestamp).to eq(Time.parse('2024-02-02T00:00:00Z'))
      expect(endpoint_from_hash.tag).to eq('custom tag')
      expect(endpoint_from_hash.devices).to be_instance_of(Array)
      expect(endpoint_from_hash.devices.first).to be_instance_of(Bandwidth::Device)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(endpoint_values.to_s).to eq('{:endpointId=>"endpoint-2", :type=>"WEBRTC", :status=>"DISCONNECTED", :creationTimestamp=>"2024-02-01T00:00:00Z", :expirationTimestamp=>"2024-02-02T00:00:00Z", :tag=>"custom tag", :devices=>[{:device_id=>"device-1", :device_name=>"Phone", :status=>"CONNECTED", :creation_timestamp=>"2024-02-01T00:00:00Z"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      endpoint_equal = Bandwidth::Endpoint.new({
        endpoint_id: 'endpoint-1',
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        status: Bandwidth::EndpointStatusEnum::CONNECTED,
        creation_timestamp: '2024-01-01T00:00:00Z',
        expiration_timestamp: '2024-01-02T00:00:00Z'
      })
      expect(endpoint_default.eql?(endpoint_equal)).to be true
      expect(endpoint_default.eql?(endpoint_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(endpoint_values.to_body).to eq({
        endpointId: 'endpoint-2',
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        status: Bandwidth::EndpointStatusEnum::DISCONNECTED,
        creationTimestamp: '2024-02-01T00:00:00Z',
        expirationTimestamp: '2024-02-02T00:00:00Z',
        tag: 'custom tag',
        devices: [{ device_id: 'device-1', device_name: 'Phone', status: 'CONNECTED', creation_timestamp: '2024-02-01T00:00:00Z' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#endpoint_id=' do
      expect {
        Bandwidth::Endpoint.new({ endpoint_id: nil })
      }.to raise_error(ArgumentError, 'endpoint_id cannot be nil')
    end

    it '#type=' do
      expect {
        Bandwidth::Endpoint.new({ endpoint_id: 'endpoint-1', type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#status=' do
      expect {
        Bandwidth::Endpoint.new({ endpoint_id: 'endpoint-1', type: Bandwidth::EndpointTypeEnum::WEBRTC, status: nil })
      }.to raise_error(ArgumentError, 'status cannot be nil')
    end

    it '#creation_timestamp=' do
      expect {
        Bandwidth::Endpoint.new({ endpoint_id: 'endpoint-1', type: Bandwidth::EndpointTypeEnum::WEBRTC, status: Bandwidth::EndpointStatusEnum::CONNECTED, creation_timestamp: nil })
      }.to raise_error(ArgumentError, 'creation_timestamp cannot be nil')
    end

    it '#expiration_timestamp=' do
      expect {
        Bandwidth::Endpoint.new({ endpoint_id: 'endpoint-1', type: Bandwidth::EndpointTypeEnum::WEBRTC, status: Bandwidth::EndpointStatusEnum::CONNECTED, creation_timestamp: '2024-01-01T00:00:00Z', expiration_timestamp: nil })
      }.to raise_error(ArgumentError, 'expiration_timestamp cannot be nil')
    end

    it '#tag=' do
      expect {
        endpoint_values.tag = nil
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end
  end
end
