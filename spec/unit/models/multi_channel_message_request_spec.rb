# Unit tests for Bandwidth::MultiChannelMessageRequest
describe Bandwidth::MultiChannelMessageRequest do
  let(:sms_channel_object) { Bandwidth::MultiChannelChannelListSMSObject.new({
    from: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
    content: Bandwidth::SmsMessageContent.new({ text: 'Hello world' })
  }) }
  let(:multi_channel_message_request_default) { Bandwidth::MultiChannelMessageRequest.new({
    to: '+15554443333',
    channel_list: [sms_channel_object]
  }) }
  let(:multi_channel_message_request_values) { Bandwidth::MultiChannelMessageRequest.new({
    to: '+19195551234',
    channel_list: [sms_channel_object],
    tag: 'custom tag',
    priority: Bandwidth::PriorityEnum::DEFAULT,
    expiration: '2024-06-16T13:45:07.160Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelMessageRequest.acceptable_attributes).to eq(Bandwidth::MultiChannelMessageRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelMessageRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelMessageRequest created by the build_from_hash method' do
      multi_channel_message_request_from_hash = Bandwidth::MultiChannelMessageRequest.build_from_hash({
        to: '+19195551234',
        channelList: [{
          from: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
          content: { text: 'Hello world' }
        }],
        tag: 'custom tag',
        priority: Bandwidth::PriorityEnum::DEFAULT,
        expiration: '2024-06-16T13:45:07.160Z'
      })
      expect(multi_channel_message_request_from_hash).to be_instance_of(Bandwidth::MultiChannelMessageRequest)
      expect(multi_channel_message_request_from_hash.to).to eq('+19195551234')
      expect(multi_channel_message_request_from_hash.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListSMSObject)
      expect(multi_channel_message_request_from_hash.tag).to eq('custom tag')
      expect(multi_channel_message_request_from_hash.priority).to eq(Bandwidth::PriorityEnum::DEFAULT)
      expect(multi_channel_message_request_from_hash.expiration).to eq(Time.parse('2024-06-16T13:45:07.160Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_message_request_values.to_s).to eq('{:to=>"+19195551234", :channelList=>[{:from=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"SMS", :content=>{:text=>"Hello world"}}], :tag=>"custom tag", :priority=>"default", :expiration=>"2024-06-16T13:45:07.160Z"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_message_request_equal = Bandwidth::MultiChannelMessageRequest.new({
        to: '+15554443333',
        channel_list: [sms_channel_object]
      })
      expect(multi_channel_message_request_default.eql?(multi_channel_message_request_equal)).to be true
      expect(multi_channel_message_request_default.eql?(multi_channel_message_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_message_request_values.to_body).to eq({
        to: '+19195551234',
        channelList: [{
          from: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
          content: { text: 'Hello world' }
        }],
        tag: 'custom tag',
        priority: Bandwidth::PriorityEnum::DEFAULT,
        expiration: '2024-06-16T13:45:07.160Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#to=' do
      expect {
        Bandwidth::MultiChannelMessageRequest.new({})
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#channel_list=' do
      expect {
        Bandwidth::MultiChannelMessageRequest.new({ to: '+15554443333' })
      }.to raise_error(ArgumentError, 'channel_list cannot be nil')

      expect {
        multi_channel_message_request_values.channel_list = nil
      }.to raise_error(ArgumentError, 'channel_list cannot be nil')

      expect {
        multi_channel_message_request_values.channel_list = [sms_channel_object] * 5
      }.to raise_error(ArgumentError, 'invalid value for "channel_list", number of items must be less than or equal to 4.')
    end
  end
end
