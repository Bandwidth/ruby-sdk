# Unit tests for Bandwidth::Device
describe Bandwidth::Device do
  let(:device_default) { Bandwidth::Device.new({
    device_id: 'baseline-device',
    status: 'CONNECTED',
    creation_timestamp: '2022-06-16T13:15:07.160Z'
  }) }
  let(:device_values) { Bandwidth::Device.new({
    device_id: 'd-abc-123',
    device_name: 'Chrome on macOS',
    status: Bandwidth::DeviceStatusEnum::CONNECTED,
    creation_timestamp: '2022-06-16T13:15:07.160Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Device.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Device.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Device.acceptable_attributes).to eq(Bandwidth::Device.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Device.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Device created by the build_from_hash method' do
      device_from_hash = Bandwidth::Device.build_from_hash({
        deviceId: 'd-abc-123',
        deviceName: 'Chrome on macOS',
        status: 'CONNECTED',
        creationTimestamp: '2022-06-16T13:15:07.160Z'
      })
      expect(device_from_hash).to be_instance_of(Bandwidth::Device)
      expect(device_from_hash.device_id).to eq('d-abc-123')
      expect(device_from_hash.device_name).to eq('Chrome on macOS')
      expect(device_from_hash.status).to eq(Bandwidth::DeviceStatusEnum::CONNECTED)
      expect(device_from_hash.creation_timestamp).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(device_values.to_s).to eq('{:deviceId=>"d-abc-123", :deviceName=>"Chrome on macOS", :status=>"CONNECTED", :creationTimestamp=>"2022-06-16T13:15:07.160Z"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      device_equal = Bandwidth::Device.new({
        device_id: 'baseline-device',
        status: 'CONNECTED',
        creation_timestamp: '2022-06-16T13:15:07.160Z'
      })
      expect(device_default.eql?(device_equal)).to be true
      expect(device_default.eql?(device_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(device_values.to_body).to eq({
        deviceId: 'd-abc-123',
        deviceName: 'Chrome on macOS',
        status: Bandwidth::DeviceStatusEnum::CONNECTED,
        creationTimestamp: '2022-06-16T13:15:07.160Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#device_id=' do
      expect {
        Bandwidth::Device.new({ device_id: nil, status: 'CONNECTED', creation_timestamp: 'a' })
      }.to raise_error(ArgumentError, 'device_id cannot be nil')
    end

    it '#device_name=' do
      expect {
        Bandwidth::Device.new({ device_id: 'a', device_name: nil, status: 'CONNECTED', creation_timestamp: 'a' })
      }.to raise_error(ArgumentError, 'device_name cannot be nil')
    end

    it '#status=' do
      expect {
        Bandwidth::Device.new({ device_id: 'a', status: nil, creation_timestamp: 'a' })
      }.to raise_error(ArgumentError, 'status cannot be nil')
    end

    it '#creation_timestamp=' do
      expect {
        Bandwidth::Device.new({ device_id: 'a', status: 'CONNECTED', creation_timestamp: nil })
      }.to raise_error(ArgumentError, 'creation_timestamp cannot be nil')
    end
  end
end
