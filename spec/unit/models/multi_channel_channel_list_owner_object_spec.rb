# Unit tests for Bandwidth::MultiChannelChannelListOwnerObject
describe Bandwidth::MultiChannelChannelListOwnerObject do
  let(:multi_channel_channel_list_owner_object_default) { Bandwidth::MultiChannelChannelListOwnerObject.new({
    owner: '+15554443333'
  }) }
  let(:multi_channel_channel_list_owner_object_values) { Bandwidth::MultiChannelChannelListOwnerObject.new({
    owner: '+19195554321'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListOwnerObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListOwnerObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListOwnerObject.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListOwnerObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListOwnerObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListOwnerObject created by the build_from_hash method' do
      multi_channel_channel_list_owner_object_from_hash = Bandwidth::MultiChannelChannelListOwnerObject.build_from_hash({
        owner: '+19195554321'
      })
      expect(multi_channel_channel_list_owner_object_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListOwnerObject)
      expect(multi_channel_channel_list_owner_object_from_hash.owner).to eq('+19195554321')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_owner_object_values.to_s).to eq('{:owner=>"+19195554321"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_owner_object_equal = Bandwidth::MultiChannelChannelListOwnerObject.new({
        owner: '+15554443333'
      })
      expect(multi_channel_channel_list_owner_object_default.eql?(multi_channel_channel_list_owner_object_equal)).to be true
      expect(multi_channel_channel_list_owner_object_default.eql?(multi_channel_channel_list_owner_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_owner_object_values.to_body).to eq({
        owner: '+19195554321'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#owner=' do
      expect {
        Bandwidth::MultiChannelChannelListOwnerObject.new({ owner: nil })
      }.to raise_error(ArgumentError, 'owner cannot be nil')
    end
  end
end
