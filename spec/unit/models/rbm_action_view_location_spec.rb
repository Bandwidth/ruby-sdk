# Unit tests for Bandwidth::RbmActionViewLocation
describe Bandwidth::RbmActionViewLocation do
  let(:rbm_action_view_location_default) { Bandwidth::RbmActionViewLocation.new({
    type: Bandwidth::RbmActionTypeEnum::SHOW_LOCATION,
    text: 'baseline',
    postback_data: 'baseline_postback',
    latitude: 0.0,
    longitude: 0.0
  }) }
  let(:rbm_action_view_location_values) { Bandwidth::RbmActionViewLocation.new({
    type: Bandwidth::RbmActionTypeEnum::SHOW_LOCATION,
    text: 'View location',
    postback_data: 'location_postback',
    latitude: 35.7796,
    longitude: -78.6382,
    label: 'Bandwidth HQ'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmActionViewLocation.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmActionViewLocation.acceptable_attributes).to eq(Bandwidth::RbmActionViewLocation.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmActionViewLocation.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmActionViewLocation created by the build_from_hash method' do
      rbm_action_view_location_from_hash = Bandwidth::RbmActionViewLocation.build_from_hash({
        type: Bandwidth::RbmActionTypeEnum::SHOW_LOCATION,
        text: 'View location',
        postbackData: 'location_postback',
        latitude: 35.7796,
        longitude: -78.6382,
        label: 'Bandwidth HQ'
      })
      expect(rbm_action_view_location_from_hash).to be_instance_of(Bandwidth::RbmActionViewLocation)
      expect(rbm_action_view_location_from_hash.type).to eq(Bandwidth::RbmActionTypeEnum::SHOW_LOCATION)
      expect(rbm_action_view_location_from_hash.text).to eq('View location')
      expect(rbm_action_view_location_from_hash.postback_data).to eq('location_postback')
      expect(rbm_action_view_location_from_hash.latitude).to eq(35.7796)
      expect(rbm_action_view_location_from_hash.longitude).to eq(-78.6382)
      expect(rbm_action_view_location_from_hash.label).to eq('Bandwidth HQ')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_action_view_location_values.to_s).to eq('{:type=>"SHOW_LOCATION", :text=>"View location", :postbackData=>"location_postback", :latitude=>35.7796, :longitude=>-78.6382, :label=>"Bandwidth HQ"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_action_view_location_equal = Bandwidth::RbmActionViewLocation.new({
        type: Bandwidth::RbmActionTypeEnum::SHOW_LOCATION,
        text: 'baseline',
        postback_data: 'baseline_postback',
        latitude: 0.0,
        longitude: 0.0
      })
      expect(rbm_action_view_location_default.eql?(rbm_action_view_location_equal)).to be true
      expect(rbm_action_view_location_default.eql?(rbm_action_view_location_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_action_view_location_values.to_body).to eq({
        type: Bandwidth::RbmActionTypeEnum::SHOW_LOCATION,
        text: 'View location',
        postbackData: 'location_postback',
        latitude: 35.7796,
        longitude: -78.6382,
        label: 'Bandwidth HQ'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#text=' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: 'a' * 26 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 25.')
    end

    it '#postback_data=' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: 'a', postback_data: nil })
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: 'a', postback_data: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end

    it '#latitude=' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: 'a', postback_data: 'a', latitude: nil })
      }.to raise_error(ArgumentError, 'latitude cannot be nil')
    end

    it '#longitude=' do
      expect {
        Bandwidth::RbmActionViewLocation.new({ type: 'SHOW_LOCATION', text: 'a', postback_data: 'a', latitude: 0.0, longitude: nil })
      }.to raise_error(ArgumentError, 'longitude cannot be nil')
    end

    it '#label=' do
      expect {
        rbm_action_view_location_values.label = nil
      }.to raise_error(ArgumentError, 'label cannot be nil')

      expect {
        rbm_action_view_location_values.label = 'a' * 101
      }.to raise_error(ArgumentError, 'invalid value for "label", the character length must be smaller than or equal to 100.')
    end
  end
end
