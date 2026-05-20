# Unit tests for Bandwidth::EndpointEvent
describe Bandwidth::EndpointEvent do
  let(:endpoint_event_default) { Bandwidth::EndpointEvent.new({
    endpoint_id: 'baseline-endpoint',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2022-06-16T13:15:07.160Z',
    expiration_timestamp: '2022-06-17T13:15:07.160Z',
    event_time: '2022-06-16T13:15:08.000Z',
    event_type: 'DEVICE_CONNECTED'
  }) }
  let(:endpoint_event_values) { Bandwidth::EndpointEvent.new({
    endpoint_id: 'ep-abc-123',
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    status: Bandwidth::EndpointStatusEnum::CONNECTED,
    creation_timestamp: '2022-06-16T13:15:07.160Z',
    expiration_timestamp: '2022-06-17T13:15:07.160Z',
    tag: 'custom tag',
    event_time: '2022-06-16T13:15:08.000Z',
    event_type: Bandwidth::EndpointEventTypeEnum::DEVICE_CONNECTED,
    device: Bandwidth::Device.new({ device_id: 'd-1', status: 'CONNECTED', creation_timestamp: '2022-06-16T13:15:08.000Z' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::EndpointEvent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::EndpointEvent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::EndpointEvent.acceptable_attributes).to eq(Bandwidth::EndpointEvent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::EndpointEvent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of EndpointEvent created by the build_from_hash method' do
      endpoint_event_from_hash = Bandwidth::EndpointEvent.build_from_hash({
        endpointId: 'ep-abc-123',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creationTimestamp: '2022-06-16T13:15:07.160Z',
        expirationTimestamp: '2022-06-17T13:15:07.160Z',
        tag: 'custom tag',
        eventTime: '2022-06-16T13:15:08.000Z',
        eventType: 'DEVICE_CONNECTED',
        device: { deviceId: 'd-1', status: 'CONNECTED', creationTimestamp: '2022-06-16T13:15:08.000Z' }
      })
      expect(endpoint_event_from_hash).to be_instance_of(Bandwidth::EndpointEvent)
      expect(endpoint_event_from_hash.endpoint_id).to eq('ep-abc-123')
      expect(endpoint_event_from_hash.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(endpoint_event_from_hash.status).to eq(Bandwidth::EndpointStatusEnum::CONNECTED)
      expect(endpoint_event_from_hash.creation_timestamp).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(endpoint_event_from_hash.expiration_timestamp).to eq(Time.parse('2022-06-17T13:15:07.160Z'))
      expect(endpoint_event_from_hash.tag).to eq('custom tag')
      expect(endpoint_event_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:08.000Z'))
      expect(endpoint_event_from_hash.event_type).to eq(Bandwidth::EndpointEventTypeEnum::DEVICE_CONNECTED)
      expect(endpoint_event_from_hash.device).to be_instance_of(Bandwidth::Device)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(endpoint_event_values.to_s).to eq('{:endpointId=>"ep-abc-123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:07.160Z", :expirationTimestamp=>"2022-06-17T13:15:07.160Z", :tag=>"custom tag", :eventTime=>"2022-06-16T13:15:08.000Z", :eventType=>"DEVICE_CONNECTED", :device=>{:deviceId=>"d-1", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:08.000Z"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      endpoint_event_equal = Bandwidth::EndpointEvent.new({
        endpoint_id: 'baseline-endpoint',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creation_timestamp: '2022-06-16T13:15:07.160Z',
        expiration_timestamp: '2022-06-17T13:15:07.160Z',
        event_time: '2022-06-16T13:15:08.000Z',
        event_type: 'DEVICE_CONNECTED'
      })
      expect(endpoint_event_default.eql?(endpoint_event_equal)).to be true
      expect(endpoint_event_default.eql?(endpoint_event_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(endpoint_event_values.to_body).to eq({
        endpointId: 'ep-abc-123',
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        status: Bandwidth::EndpointStatusEnum::CONNECTED,
        creationTimestamp: '2022-06-16T13:15:07.160Z',
        expirationTimestamp: '2022-06-17T13:15:07.160Z',
        tag: 'custom tag',
        eventTime: '2022-06-16T13:15:08.000Z',
        eventType: Bandwidth::EndpointEventTypeEnum::DEVICE_CONNECTED,
        device: { deviceId: 'd-1', status: 'CONNECTED', creationTimestamp: '2022-06-16T13:15:08.000Z' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#endpoint_id=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: nil, type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', event_time: 'a', event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'endpoint_id cannot be nil')
    end

    it '#type=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: nil, status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', event_time: 'a', event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#status=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: nil, creation_timestamp: 'a', expiration_timestamp: 'a', event_time: 'a', event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'status cannot be nil')
    end

    it '#creation_timestamp=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: nil, expiration_timestamp: 'a', event_time: 'a', event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'creation_timestamp cannot be nil')
    end

    it '#expiration_timestamp=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: nil, event_time: 'a', event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'expiration_timestamp cannot be nil')
    end

    it '#tag=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', event_time: 'a', event_type: 'DEVICE_CONNECTED', tag: nil })
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end

    it '#event_time=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', event_time: nil, event_type: 'DEVICE_CONNECTED' })
      }.to raise_error(ArgumentError, 'event_time cannot be nil')
    end

    it '#event_type=' do
      expect {
        Bandwidth::EndpointEvent.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: 'a', expiration_timestamp: 'a', event_time: 'a', event_type: nil })
      }.to raise_error(ArgumentError, 'event_type cannot be nil')
    end
  end
end
