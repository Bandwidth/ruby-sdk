# Unit tests for Bandwidth::MultiChannelActionCalendarEvent
describe Bandwidth::MultiChannelActionCalendarEvent do
  let(:multi_channel_action_calendar_event_default) { Bandwidth::MultiChannelActionCalendarEvent.new({
    type: Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT,
    text: 'baseline',
    postback_data: 'baseline_postback',
    title: 'Baseline Event',
    start_time: '2024-01-01T00:00:00Z',
    end_time: '2024-01-01T01:00:00Z'
  }) }
  let(:multi_channel_action_calendar_event_values) { Bandwidth::MultiChannelActionCalendarEvent.new({
    type: Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT,
    text: 'Add to calendar',
    postback_data: 'calendar_postback',
    title: 'Bandwidth Demo',
    start_time: '2024-06-16T13:15:07.160Z',
    end_time: '2024-06-16T14:15:07.160Z',
    description: 'A demo of the Bandwidth API'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelActionCalendarEvent.acceptable_attributes).to eq(Bandwidth::MultiChannelActionCalendarEvent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelActionCalendarEvent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelActionCalendarEvent created by the build_from_hash method' do
      multi_channel_action_calendar_event_from_hash = Bandwidth::MultiChannelActionCalendarEvent.build_from_hash({
        type: Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT,
        text: 'Add to calendar',
        postbackData: 'calendar_postback',
        title: 'Bandwidth Demo',
        startTime: '2024-06-16T13:15:07.160Z',
        endTime: '2024-06-16T14:15:07.160Z',
        description: 'A demo of the Bandwidth API'
      })
      expect(multi_channel_action_calendar_event_from_hash).to be_instance_of(Bandwidth::MultiChannelActionCalendarEvent)
      expect(multi_channel_action_calendar_event_from_hash.type).to eq(Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT)
      expect(multi_channel_action_calendar_event_from_hash.text).to eq('Add to calendar')
      expect(multi_channel_action_calendar_event_from_hash.postback_data).to eq('calendar_postback')
      expect(multi_channel_action_calendar_event_from_hash.title).to eq('Bandwidth Demo')
      expect(multi_channel_action_calendar_event_from_hash.start_time).to eq(Time.parse('2024-06-16T13:15:07.160Z'))
      expect(multi_channel_action_calendar_event_from_hash.end_time).to eq(Time.parse('2024-06-16T14:15:07.160Z'))
      expect(multi_channel_action_calendar_event_from_hash.description).to eq('A demo of the Bandwidth API')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_action_calendar_event_values.to_s).to eq('{:type=>"CREATE_CALENDAR_EVENT", :text=>"Add to calendar", :postbackData=>"calendar_postback", :title=>"Bandwidth Demo", :startTime=>"2024-06-16T13:15:07.160Z", :endTime=>"2024-06-16T14:15:07.160Z", :description=>"A demo of the Bandwidth API"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_action_calendar_event_equal = Bandwidth::MultiChannelActionCalendarEvent.new({
        type: Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT,
        text: 'baseline',
        postback_data: 'baseline_postback',
        title: 'Baseline Event',
        start_time: '2024-01-01T00:00:00Z',
        end_time: '2024-01-01T01:00:00Z'
      })
      expect(multi_channel_action_calendar_event_default.eql?(multi_channel_action_calendar_event_equal)).to be true
      expect(multi_channel_action_calendar_event_default.eql?(multi_channel_action_calendar_event_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_action_calendar_event_values.to_body).to eq({
        type: Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT,
        text: 'Add to calendar',
        postbackData: 'calendar_postback',
        title: 'Bandwidth Demo',
        startTime: '2024-06-16T13:15:07.160Z',
        endTime: '2024-06-16T14:15:07.160Z',
        description: 'A demo of the Bandwidth API'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#text=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a' * 26 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 25.')
    end

    it '#postback_data=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: nil })
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end

    it '#title=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: 'a', title: nil })
      }.to raise_error(ArgumentError, 'title cannot be nil')

      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: 'a', title: 'a' * 101 })
      }.to raise_error(ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 100.')
    end

    it '#start_time=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: 'a', title: 'a', start_time: nil })
      }.to raise_error(ArgumentError, 'start_time cannot be nil')
    end

    it '#end_time=' do
      expect {
        Bandwidth::MultiChannelActionCalendarEvent.new({ type: 'CREATE_CALENDAR_EVENT', text: 'a', postback_data: 'a', title: 'a', start_time: '2024-01-01T00:00:00Z', end_time: nil })
      }.to raise_error(ArgumentError, 'end_time cannot be nil')
    end

    it '#description=' do
      expect {
        multi_channel_action_calendar_event_values.description = nil
      }.to raise_error(ArgumentError, 'description cannot be nil')

      expect {
        multi_channel_action_calendar_event_values.description = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 500.')
    end
  end
end
