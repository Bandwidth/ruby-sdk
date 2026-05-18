# Unit tests for Bandwidth::RbmLocationResponse
describe Bandwidth::RbmLocationResponse do
  let(:rbm_location_response_default) { Bandwidth::RbmLocationResponse.new }
  let(:rbm_location_response_values) { Bandwidth::RbmLocationResponse.new({
    latitude: 35.7796,
    longitude: -78.6382
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmLocationResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmLocationResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmLocationResponse.acceptable_attributes).to eq(Bandwidth::RbmLocationResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmLocationResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmLocationResponse created by the build_from_hash method' do
      rbm_location_response_from_hash = Bandwidth::RbmLocationResponse.build_from_hash({
        latitude: 35.7796,
        longitude: -78.6382
      })
      expect(rbm_location_response_from_hash).to be_instance_of(Bandwidth::RbmLocationResponse)
      expect(rbm_location_response_from_hash.latitude).to eq(35.7796)
      expect(rbm_location_response_from_hash.longitude).to eq(-78.6382)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_location_response_values.to_s).to eq('{:latitude=>35.7796, :longitude=>-78.6382}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(rbm_location_response_default.eql?(Bandwidth::RbmLocationResponse.new)).to be true
      expect(rbm_location_response_default.eql?(rbm_location_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_location_response_values.to_body).to eq({
        latitude: 35.7796,
        longitude: -78.6382
      })
    end
  end
end
