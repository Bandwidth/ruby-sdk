# Unit tests for Bandwidth::StatusCallback
describe Bandwidth::StatusCallback do
  let(:status_callback_default) { Bandwidth::StatusCallback.new({
    time: '2022-06-16T13:15:07.160Z',
    type: Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED,
    to: '+19195551234',
    description: 'baseline description',
    message: { id: 'baseline' }
  }) }
  let(:status_callback_values) { Bandwidth::StatusCallback.new({
    time: '2022-06-16T13:15:07.160Z',
    event_time: '2022-06-16T13:16:07.160Z',
    type: Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED,
    to: '+19195551234',
    description: 'Message delivered to carrier',
    message: {
      id: '1589228074636lm4k2je7j7jklbn2',
      owner: '+19195554321',
      applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
      time: '2022-06-16T13:15:07.160Z',
      segmentCount: 1,
      direction: 'out',
      to: ['+19195551234'],
      from: '+19195554321',
      text: 'Hello world'
    },
    error_code: 0,
    carrier_name: 'Verizon'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::StatusCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::StatusCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::StatusCallback.acceptable_attributes).to eq(Bandwidth::StatusCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::StatusCallback.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of StatusCallback created by the build_from_hash method' do
      status_callback_from_hash = Bandwidth::StatusCallback.build_from_hash({
        time: '2022-06-16T13:15:07.160Z',
        eventTime: '2022-06-16T13:16:07.160Z',
        type: Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED,
        to: '+19195551234',
        description: 'Message delivered to carrier',
        message: {
          id: '1589228074636lm4k2je7j7jklbn2',
          owner: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          time: '2022-06-16T13:15:07.160Z',
          segmentCount: 1,
          direction: Bandwidth::MessageDirectionEnum::OUT,
          to: ['+19195551234'],
          from: '+19195554321',
          text: 'Hello world'
        },
        errorCode: 0,
        carrierName: 'Verizon'
      })
      expect(status_callback_from_hash).to be_instance_of(Bandwidth::StatusCallback)
      expect(status_callback_from_hash.time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(status_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:16:07.160Z'))
      expect(status_callback_from_hash.type).to eq(Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED)
      expect(status_callback_from_hash.to).to eq('+19195551234')
      expect(status_callback_from_hash.description).to eq('Message delivered to carrier')
      expect(status_callback_from_hash.message).to be_instance_of(Bandwidth::StatusCallbackMessage)
      expect(status_callback_from_hash.message.id).to eq('1589228074636lm4k2je7j7jklbn2')
      expect(status_callback_from_hash.message.text).to eq('Hello world')
      expect(status_callback_from_hash.error_code).to eq(0)
      expect(status_callback_from_hash.carrier_name).to eq('Verizon')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(status_callback_values.to_s).to eq('{:time=>"2022-06-16T13:15:07.160Z", :eventTime=>"2022-06-16T13:16:07.160Z", :type=>"message-delivered", :to=>"+19195551234", :description=>"Message delivered to carrier", :message=>{:id=>"1589228074636lm4k2je7j7jklbn2", :owner=>"+19195554321", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :time=>"2022-06-16T13:15:07.160Z", :segmentCount=>1, :direction=>"out", :to=>["+19195551234"], :from=>"+19195554321", :text=>"Hello world"}, :errorCode=>0, :carrierName=>"Verizon"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      status_callback_equal = Bandwidth::StatusCallback.new({
        time: '2022-06-16T13:15:07.160Z',
        type: Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED,
        to: '+19195551234',
        description: 'baseline description',
        message: { id: 'baseline' }
      })
      expect(status_callback_default.eql?(status_callback_equal)).to be true
      expect(status_callback_default.eql?(status_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(status_callback_values.to_body).to eq({
        time: '2022-06-16T13:15:07.160Z',
        eventTime: '2022-06-16T13:16:07.160Z',
        type: Bandwidth::StatusCallbackTypeEnum::MESSAGE_DELIVERED,
        to: '+19195551234',
        description: 'Message delivered to carrier',
        message: {
          id: '1589228074636lm4k2je7j7jklbn2',
          owner: '+19195554321',
          applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
          time: '2022-06-16T13:15:07.160Z',
          segmentCount: 1,
          direction: 'out',
          to: ['+19195551234'],
          from: '+19195554321',
          text: 'Hello world'
        },
        errorCode: 0,
        carrierName: 'Verizon'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#time=' do
      expect {
        status_callback_values.time = nil
      }.to raise_error(ArgumentError, 'time cannot be nil')
    end

    it '#type=' do
      expect {
        status_callback_values.type = nil
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#to=' do
      expect {
        status_callback_values.to = nil
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#description=' do
      expect {
        status_callback_values.description = nil
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end

    it '#message=' do
      expect {
        status_callback_values.message = nil
      }.to raise_error(ArgumentError, 'message cannot be nil')
    end
  end
end
