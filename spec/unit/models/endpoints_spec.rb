# Unit tests for Bandwidth::Endpoints
describe Bandwidth::Endpoints do
  let(:endpoints_default) { Bandwidth::Endpoints.new({
    endpoint_id: 'baseline',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2024-01-01T00:00:00Z',
    expiration_timestamp: '2024-01-02T00:00:00Z'
  }) }
  let(:endpoints_values) { Bandwidth::Endpoints.new({
    endpoint_id: 'abc123',
    type: 'WEBRTC',
    status: 'CONNECTED',
    creation_timestamp: '2024-01-01T00:00:00Z',
    expiration_timestamp: '2024-01-02T00:00:00Z',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Endpoints.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Endpoints.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Endpoints.acceptable_attributes).to eq(Bandwidth::Endpoints.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Endpoints.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Endpoints created by the build_from_hash method' do
      endpoints_from_hash = Bandwidth::Endpoints.build_from_hash({
        endpointId: 'abc123',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creationTimestamp: '2024-01-01T00:00:00Z',
        expirationTimestamp: '2024-01-02T00:00:00Z',
        tag: 'custom tag'
      })
      expect(endpoints_from_hash).to be_instance_of(Bandwidth::Endpoints)
      expect(endpoints_from_hash.endpoint_id).to eq('abc123')
      expect(endpoints_from_hash.type).to eq('WEBRTC')
      expect(endpoints_from_hash.status).to eq('CONNECTED')
      expect(endpoints_from_hash.creation_timestamp).to eq(Time.parse('2024-01-01T00:00:00Z'))
      expect(endpoints_from_hash.expiration_timestamp).to eq(Time.parse('2024-01-02T00:00:00Z'))
      expect(endpoints_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(endpoints_values.to_s).to eq('{:endpointId=>"abc123", :type=>"WEBRTC", :status=>"CONNECTED", :creationTimestamp=>"2024-01-01T00:00:00Z", :expirationTimestamp=>"2024-01-02T00:00:00Z", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      endpoints_equal = Bandwidth::Endpoints.new({
        endpoint_id: 'baseline',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creation_timestamp: '2024-01-01T00:00:00Z',
        expiration_timestamp: '2024-01-02T00:00:00Z'
      })
      expect(endpoints_default.eql?(endpoints_equal)).to be true
      expect(endpoints_default.eql?(endpoints_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(endpoints_values.to_body).to eq({
        endpointId: 'abc123',
        type: 'WEBRTC',
        status: 'CONNECTED',
        creationTimestamp: '2024-01-01T00:00:00Z',
        expirationTimestamp: '2024-01-02T00:00:00Z',
        tag: 'custom tag'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#endpoint_id=' do
      expect {
        Bandwidth::Endpoints.new({ endpoint_id: nil })
      }.to raise_error(ArgumentError, 'endpoint_id cannot be nil')
    end

    it '#type=' do
      expect {
        Bandwidth::Endpoints.new({ endpoint_id: 'a', type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#status=' do
      expect {
        Bandwidth::Endpoints.new({ endpoint_id: 'a', type: 'WEBRTC', status: nil })
      }.to raise_error(ArgumentError, 'status cannot be nil')
    end

    it '#creation_timestamp=' do
      expect {
        Bandwidth::Endpoints.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: nil })
      }.to raise_error(ArgumentError, 'creation_timestamp cannot be nil')
    end

    it '#expiration_timestamp=' do
      expect {
        Bandwidth::Endpoints.new({ endpoint_id: 'a', type: 'WEBRTC', status: 'CONNECTED', creation_timestamp: '2024-01-01T00:00:00Z', expiration_timestamp: nil })
      }.to raise_error(ArgumentError, 'expiration_timestamp cannot be nil')
    end

    it '#tag=' do
      expect {
        endpoints_values.tag = nil
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end
  end
end
