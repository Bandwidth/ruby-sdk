# Unit tests for Bandwidth::MultiChannelMessageResponseData
describe Bandwidth::MultiChannelMessageResponseData do
  let(:sms_channel_response) { Bandwidth::MultiChannelChannelListSMSResponseObject.new({
    from: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
    content: Bandwidth::SmsMessageContent.new({ text: 'Hello world' }),
    owner: '+19195554321'
  }) }
  let(:multi_channel_message_response_data_default) { Bandwidth::MultiChannelMessageResponseData.new({
    id: 'baseline-id',
    time: '2024-01-01T00:00:00Z',
    direction: Bandwidth::MessageDirectionEnum::OUT,
    to: ['+15554443333'],
    channel_list: [sms_channel_response]
  }) }
  let(:multi_channel_message_response_data_values) { Bandwidth::MultiChannelMessageResponseData.new({
    id: '1589228074636lm4k2je7j7jklbn2',
    time: '2024-06-16T13:15:07.160Z',
    direction: Bandwidth::MessageDirectionEnum::OUT,
    to: ['+19195551234'],
    channel_list: [sms_channel_response],
    tag: 'custom tag',
    priority: Bandwidth::PriorityEnum::DEFAULT,
    expiration: '2024-06-16T13:45:07.160Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelMessageResponseData.acceptable_attributes).to eq(Bandwidth::MultiChannelMessageResponseData.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelMessageResponseData.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelMessageResponseData created by the build_from_hash method' do
      multi_channel_message_response_data_from_hash = Bandwidth::MultiChannelMessageResponseData.build_from_hash({
        id: '1589228074636lm4k2je7j7jklbn2',
        time: '2024-06-16T13:15:07.160Z',
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+19195551234'],
        channelList: [{
          from: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
          content: { text: 'Hello world' },
          owner: '+19195554321'
        }],
        tag: 'custom tag',
        priority: Bandwidth::PriorityEnum::DEFAULT,
        expiration: '2024-06-16T13:45:07.160Z'
      })
      expect(multi_channel_message_response_data_from_hash).to be_instance_of(Bandwidth::MultiChannelMessageResponseData)
      expect(multi_channel_message_response_data_from_hash.id).to eq('1589228074636lm4k2je7j7jklbn2')
      expect(multi_channel_message_response_data_from_hash.time).to eq(Time.parse('2024-06-16T13:15:07.160Z'))
      expect(multi_channel_message_response_data_from_hash.direction).to eq(Bandwidth::MessageDirectionEnum::OUT)
      expect(multi_channel_message_response_data_from_hash.to).to eq(['+19195551234'])
      expect(multi_channel_message_response_data_from_hash.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListSMSResponseObject)
      expect(multi_channel_message_response_data_from_hash.tag).to eq('custom tag')
      expect(multi_channel_message_response_data_from_hash.priority).to eq(Bandwidth::PriorityEnum::DEFAULT)
      expect(multi_channel_message_response_data_from_hash.expiration).to eq(Time.parse('2024-06-16T13:45:07.160Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_message_response_data_values.to_s).to eq('{:id=>"1589228074636lm4k2je7j7jklbn2", :time=>"2024-06-16T13:15:07.160Z", :direction=>"out", :to=>["+19195551234"], :channelList=>[{:from=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"SMS", :content=>{:text=>"Hello world"}, :owner=>"+19195554321"}], :tag=>"custom tag", :priority=>"default", :expiration=>"2024-06-16T13:45:07.160Z"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_message_response_data_equal = Bandwidth::MultiChannelMessageResponseData.new({
        id: 'baseline-id',
        time: '2024-01-01T00:00:00Z',
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+15554443333'],
        channel_list: [sms_channel_response]
      })
      expect(multi_channel_message_response_data_default.eql?(multi_channel_message_response_data_equal)).to be true
      expect(multi_channel_message_response_data_default.eql?(multi_channel_message_response_data_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_message_response_data_values.to_body).to eq({
        id: '1589228074636lm4k2je7j7jklbn2',
        time: '2024-06-16T13:15:07.160Z',
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+19195551234'],
        channelList: [{
          from: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
          content: { text: 'Hello world' },
          owner: '+19195554321'
        }],
        tag: 'custom tag',
        priority: Bandwidth::PriorityEnum::DEFAULT,
        expiration: '2024-06-16T13:45:07.160Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#id=' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ id: nil })
      }.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it '#time=' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ id: 'a', time: nil })
      }.to raise_error(ArgumentError, 'time cannot be nil')
    end

    it '#direction=' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ id: 'a', time: 't', direction: nil })
      }.to raise_error(ArgumentError, 'direction cannot be nil')
    end

    it '#to=' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ id: 'a', time: 't', direction: 'out' })
      }.to raise_error(ArgumentError, 'to cannot be nil')

      expect {
        multi_channel_message_response_data_values.to = nil
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#channel_list=' do
      expect {
        Bandwidth::MultiChannelMessageResponseData.new({ id: 'a', time: 't', direction: 'out', to: ['x'] })
      }.to raise_error(ArgumentError, 'channel_list cannot be nil')

      expect {
        multi_channel_message_response_data_values.channel_list = nil
      }.to raise_error(ArgumentError, 'channel_list cannot be nil')

      expect {
        multi_channel_message_response_data_values.channel_list = [sms_channel_response] * 5
      }.to raise_error(ArgumentError, 'invalid value for "channel_list", number of items must be less than or equal to 4.')
    end
  end
end
