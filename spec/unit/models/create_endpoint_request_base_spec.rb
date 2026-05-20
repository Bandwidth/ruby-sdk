# Unit tests for Bandwidth::CreateEndpointRequestBase
describe Bandwidth::CreateEndpointRequestBase do
  let(:create_endpoint_request_base_default) { Bandwidth::CreateEndpointRequestBase.new({
    type: 'WEBRTC',
    direction: 'INBOUND'
  }) }
  let(:create_endpoint_request_base_values) { Bandwidth::CreateEndpointRequestBase.new({
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
    event_callback_url: 'https://example.com/event-callback',
    event_fallback_url: 'https://example.com/event-fallback',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateEndpointRequestBase.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateEndpointRequestBase.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateEndpointRequestBase.acceptable_attributes).to eq(Bandwidth::CreateEndpointRequestBase.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateEndpointRequestBase.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateEndpointRequestBase created by the build_from_hash method' do
      create_endpoint_request_base_from_hash = Bandwidth::CreateEndpointRequestBase.build_from_hash({
        type: 'WEBRTC',
        direction: 'BIDIRECTIONAL',
        eventCallbackUrl: 'https://example.com/event-callback',
        eventFallbackUrl: 'https://example.com/event-fallback',
        tag: 'custom tag'
      })
      expect(create_endpoint_request_base_from_hash).to be_instance_of(Bandwidth::CreateEndpointRequestBase)
      expect(create_endpoint_request_base_from_hash.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(create_endpoint_request_base_from_hash.direction).to eq(Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL)
      expect(create_endpoint_request_base_from_hash.event_callback_url).to eq('https://example.com/event-callback')
      expect(create_endpoint_request_base_from_hash.event_fallback_url).to eq('https://example.com/event-fallback')
      expect(create_endpoint_request_base_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_endpoint_request_base_values.to_s).to eq('{:type=>"WEBRTC", :direction=>"BIDIRECTIONAL", :eventCallbackUrl=>"https://example.com/event-callback", :eventFallbackUrl=>"https://example.com/event-fallback", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_endpoint_request_base_equal = Bandwidth::CreateEndpointRequestBase.new({
        type: 'WEBRTC',
        direction: 'INBOUND'
      })
      expect(create_endpoint_request_base_default.eql?(create_endpoint_request_base_equal)).to be true
      expect(create_endpoint_request_base_default.eql?(create_endpoint_request_base_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_endpoint_request_base_values.to_body).to eq({
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
        eventCallbackUrl: 'https://example.com/event-callback',
        eventFallbackUrl: 'https://example.com/event-fallback',
        tag: 'custom tag'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::CreateEndpointRequestBase.new({ type: nil, direction: 'INBOUND' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#direction=' do
      expect {
        Bandwidth::CreateEndpointRequestBase.new({ type: 'WEBRTC', direction: nil })
      }.to raise_error(ArgumentError, 'direction cannot be nil')
    end

    it '#tag=' do
      expect {
        Bandwidth::CreateEndpointRequestBase.new({ type: 'WEBRTC', direction: 'INBOUND', tag: nil })
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end
  end
end
