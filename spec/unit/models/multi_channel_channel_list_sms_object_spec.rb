# Unit tests for Bandwidth::MultiChannelChannelListSMSObject
describe Bandwidth::MultiChannelChannelListSMSObject do
  let(:multi_channel_channel_list_sms_object_default) { Bandwidth::MultiChannelChannelListSMSObject.new({
    from: '+15554443333',
    application_id: 'baseline-app-id',
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
    content: Bandwidth::SmsMessageContent.new({ text: 'baseline' })
  }) }
  let(:multi_channel_channel_list_sms_object_values) { Bandwidth::MultiChannelChannelListSMSObject.new({
    from: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
    content: Bandwidth::SmsMessageContent.new({ text: 'Hello world' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListSMSObject.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListSMSObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListSMSObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListSMSObject created by the build_from_hash method' do
      multi_channel_channel_list_sms_object_from_hash = Bandwidth::MultiChannelChannelListSMSObject.build_from_hash({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
        content: { text: 'Hello world' }
      })
      expect(multi_channel_channel_list_sms_object_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListSMSObject)
      expect(multi_channel_channel_list_sms_object_from_hash.from).to eq('+19195554321')
      expect(multi_channel_channel_list_sms_object_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(multi_channel_channel_list_sms_object_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::SMS)
      expect(multi_channel_channel_list_sms_object_from_hash.content).to be_instance_of(Bandwidth::SmsMessageContent)
      expect(multi_channel_channel_list_sms_object_from_hash.content.text).to eq('Hello world')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_sms_object_values.to_s).to eq('{:from=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"SMS", :content=>{:text=>"Hello world"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_sms_object_equal = Bandwidth::MultiChannelChannelListSMSObject.new({
        from: '+15554443333',
        application_id: 'baseline-app-id',
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
        content: Bandwidth::SmsMessageContent.new({ text: 'baseline' })
      })
      expect(multi_channel_channel_list_sms_object_default.eql?(multi_channel_channel_list_sms_object_equal)).to be true
      expect(multi_channel_channel_list_sms_object_default.eql?(multi_channel_channel_list_sms_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_sms_object_values.to_body).to eq({
        from: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
        content: { text: 'Hello world' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#from=' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new({ from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#application_id=' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new({ from: '+15554443333', application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#channel=' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new({ from: '+15554443333', application_id: 'a', channel: nil })
      }.to raise_error(ArgumentError, 'channel cannot be nil')
    end

    it '#content=' do
      expect {
        Bandwidth::MultiChannelChannelListSMSObject.new({ from: '+15554443333', application_id: 'a', channel: 'SMS', content: nil })
      }.to raise_error(ArgumentError, 'content cannot be nil')
    end
  end
end
