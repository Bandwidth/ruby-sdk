# Unit tests for Bandwidth::StatusCallbackMessage
describe Bandwidth::StatusCallbackMessage do
  let(:status_callback_message_default) { Bandwidth::StatusCallbackMessage.new({
    id: 'baseline-id',
    owner: '+19195554321',
    application_id: 'baseline-app',
    time: '2022-06-16T13:15:07.160Z',
    segment_count: 1,
    direction: Bandwidth::MessageDirectionEnum::OUT,
    to: ['+19195551234'],
    from: '+19195554321'
  }) }
  let(:status_callback_message_values) { Bandwidth::StatusCallbackMessage.new({
    id: '1589228074636lm4k2je7j7jklbn2',
    owner: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    time: '2022-06-16T13:15:07.160Z',
    segment_count: 2,
    direction: Bandwidth::MessageDirectionEnum::OUT,
    to: ['+19195551234'],
    from: '+19195554321',
    text: 'Hello world',
    tag: 'custom tag',
    media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
    priority: Bandwidth::PriorityEnum::DEFAULT,
    channel: Bandwidth::MultiChannelMessageChannelEnum::SMS
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::StatusCallbackMessage.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::StatusCallbackMessage.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::StatusCallbackMessage.acceptable_attributes).to eq(Bandwidth::StatusCallbackMessage.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::StatusCallbackMessage.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of StatusCallbackMessage created by the build_from_hash method' do
      status_callback_message_from_hash = Bandwidth::StatusCallbackMessage.build_from_hash({
        id: '1589228074636lm4k2je7j7jklbn2',
        owner: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        time: '2022-06-16T13:15:07.160Z',
        segmentCount: 2,
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+19195551234'],
        from: '+19195554321',
        text: 'Hello world',
        tag: 'custom tag',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        priority: Bandwidth::PriorityEnum::DEFAULT,
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS
      })
      expect(status_callback_message_from_hash).to be_instance_of(Bandwidth::StatusCallbackMessage)
      expect(status_callback_message_from_hash.id).to eq('1589228074636lm4k2je7j7jklbn2')
      expect(status_callback_message_from_hash.owner).to eq('+19195554321')
      expect(status_callback_message_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(status_callback_message_from_hash.time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(status_callback_message_from_hash.segment_count).to eq(2)
      expect(status_callback_message_from_hash.direction).to eq(Bandwidth::MessageDirectionEnum::OUT)
      expect(status_callback_message_from_hash.to).to eq(['+19195551234'])
      expect(status_callback_message_from_hash.from).to eq('+19195554321')
      expect(status_callback_message_from_hash.text).to eq('Hello world')
      expect(status_callback_message_from_hash.tag).to eq('custom tag')
      expect(status_callback_message_from_hash.media).to eq(['https://dev.bandwidth.com/images/bandwidth-logo.png'])
      expect(status_callback_message_from_hash.priority).to eq(Bandwidth::PriorityEnum::DEFAULT)
      expect(status_callback_message_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::SMS)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(status_callback_message_values.to_s).to eq('{:id=>"1589228074636lm4k2je7j7jklbn2", :owner=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :time=>"2022-06-16T13:15:07.160Z", :segmentCount=>2, :direction=>"out", :to=>["+19195551234"], :from=>"+19195554321", :text=>"Hello world", :tag=>"custom tag", :media=>["https://dev.bandwidth.com/images/bandwidth-logo.png"], :priority=>"default", :channel=>"SMS"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      status_callback_message_equal = Bandwidth::StatusCallbackMessage.new({
        id: 'baseline-id',
        owner: '+19195554321',
        application_id: 'baseline-app',
        time: '2022-06-16T13:15:07.160Z',
        segment_count: 1,
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+19195551234'],
        from: '+19195554321'
      })
      expect(status_callback_message_default.eql?(status_callback_message_equal)).to be true
      expect(status_callback_message_default.eql?(status_callback_message_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(status_callback_message_values.to_body).to eq({
        id: '1589228074636lm4k2je7j7jklbn2',
        owner: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        time: '2022-06-16T13:15:07.160Z',
        segmentCount: 2,
        direction: Bandwidth::MessageDirectionEnum::OUT,
        to: ['+19195551234'],
        from: '+19195554321',
        text: 'Hello world',
        tag: 'custom tag',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        priority: Bandwidth::PriorityEnum::DEFAULT,
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS
      })
    end
  end

  describe 'custom attribute writers' do
    it '#id=' do
      expect {
        status_callback_message_values.id = nil
      }.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it '#owner=' do
      expect {
        status_callback_message_values.owner = nil
      }.to raise_error(ArgumentError, 'owner cannot be nil')
    end

    it '#application_id=' do
      expect {
        status_callback_message_values.application_id = nil
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#time=' do
      expect {
        status_callback_message_values.time = nil
      }.to raise_error(ArgumentError, 'time cannot be nil')
    end

    it '#segment_count=' do
      expect {
        status_callback_message_values.segment_count = nil
      }.to raise_error(ArgumentError, 'segment_count cannot be nil')
    end

    it '#direction=' do
      expect {
        status_callback_message_values.direction = nil
      }.to raise_error(ArgumentError, 'direction cannot be nil')
    end

    it '#to=' do
      expect {
        status_callback_message_values.to = nil
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#from=' do
      expect {
        status_callback_message_values.from = nil
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end
  end
end
