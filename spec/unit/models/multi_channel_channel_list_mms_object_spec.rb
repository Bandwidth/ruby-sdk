# Unit tests for Bandwidth::MultiChannelChannelListMMSObject
describe Bandwidth::MultiChannelChannelListMMSObject do
  let(:multi_channel_channel_list_mms_object_default) { Bandwidth::MultiChannelChannelListMMSObject.new({
    from: '+15554443333',
    application_id: 'baseline-app-id',
    channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
    content: Bandwidth::MmsMessageContent.new({ text: 'baseline' })
  }) }
  let(:multi_channel_channel_list_mms_object_values) { Bandwidth::MultiChannelChannelListMMSObject.new({
    from: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
    content: Bandwidth::MmsMessageContent.new({ text: 'Hello world' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListMMSObject.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListMMSObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListMMSObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListMMSObject created by the build_from_hash method' do
      multi_channel_channel_list_mms_object_from_hash = Bandwidth::MultiChannelChannelListMMSObject.build_from_hash({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
        content: { text: 'Hello world' }
      })
      expect(multi_channel_channel_list_mms_object_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListMMSObject)
      expect(multi_channel_channel_list_mms_object_from_hash.from).to eq('+19195554321')
      expect(multi_channel_channel_list_mms_object_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(multi_channel_channel_list_mms_object_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::MMS)
      expect(multi_channel_channel_list_mms_object_from_hash.content).to be_instance_of(Bandwidth::MmsMessageContent)
      expect(multi_channel_channel_list_mms_object_from_hash.content.text).to eq('Hello world')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_mms_object_values.to_s).to eq('{:from=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"MMS", :content=>{:text=>"Hello world"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_mms_object_equal = Bandwidth::MultiChannelChannelListMMSObject.new({
        from: '+15554443333',
        application_id: 'baseline-app-id',
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
        content: Bandwidth::MmsMessageContent.new({ text: 'baseline' })
      })
      expect(multi_channel_channel_list_mms_object_default.eql?(multi_channel_channel_list_mms_object_equal)).to be true
      expect(multi_channel_channel_list_mms_object_default.eql?(multi_channel_channel_list_mms_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_mms_object_values.to_body).to eq({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
        content: { text: 'Hello world' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#from=' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new({ from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#application_id=' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new({ from: '+15554443333', application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#channel=' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new({ from: '+15554443333', application_id: 'a', channel: nil })
      }.to raise_error(ArgumentError, 'channel cannot be nil')
    end

    it '#content=' do
      expect {
        Bandwidth::MultiChannelChannelListMMSObject.new({ from: '+15554443333', application_id: 'a', channel: 'MMS', content: nil })
      }.to raise_error(ArgumentError, 'content cannot be nil')
    end
  end
end
