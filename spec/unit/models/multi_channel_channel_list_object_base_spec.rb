# Unit tests for Bandwidth::MultiChannelChannelListObjectBase
describe Bandwidth::MultiChannelChannelListObjectBase do
  let(:multi_channel_channel_list_object_base_default) { Bandwidth::MultiChannelChannelListObjectBase.new({
    from: '+15554443333',
    application_id: 'baseline-app-id',
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS
  }) }
  let(:multi_channel_channel_list_object_base_values) { Bandwidth::MultiChannelChannelListObjectBase.new({
    from: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::MMS
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListObjectBase.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListObjectBase.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListObjectBase.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListObjectBase.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListObjectBase.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListObjectBase created by the build_from_hash method' do
      multi_channel_channel_list_object_base_from_hash = Bandwidth::MultiChannelChannelListObjectBase.build_from_hash({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS
      })
      expect(multi_channel_channel_list_object_base_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListObjectBase)
      expect(multi_channel_channel_list_object_base_from_hash.from).to eq('+19195554321')
      expect(multi_channel_channel_list_object_base_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(multi_channel_channel_list_object_base_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::MMS)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_object_base_values.to_s).to eq('{:from=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"MMS"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_object_base_equal = Bandwidth::MultiChannelChannelListObjectBase.new({
        from: '+15554443333',
        application_id: 'baseline-app-id',
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS
      })
      expect(multi_channel_channel_list_object_base_default.eql?(multi_channel_channel_list_object_base_equal)).to be true
      expect(multi_channel_channel_list_object_base_default.eql?(multi_channel_channel_list_object_base_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_object_base_values.to_body).to eq({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS
      })
    end
  end

  describe 'custom attribute writers' do
    it '#from=' do
      expect {
        Bandwidth::MultiChannelChannelListObjectBase.new({ from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#application_id=' do
      expect {
        Bandwidth::MultiChannelChannelListObjectBase.new({ from: '+15554443333', application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#channel=' do
      expect {
        Bandwidth::MultiChannelChannelListObjectBase.new({ from: '+15554443333', application_id: 'a', channel: nil })
      }.to raise_error(ArgumentError, 'channel cannot be nil')
    end
  end
end
