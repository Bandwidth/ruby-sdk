# Unit tests for Bandwidth::MessageRequest
describe Bandwidth::MessageRequest do
  let(:message_request_default) { Bandwidth::MessageRequest.new({
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    to: ['+19195551234'],
    from: '+19195554321'
  }) }
  let(:message_request_values) { Bandwidth::MessageRequest.new({
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    to: ['+19195551234'],
    from: '+19195554321',
    text: 'Hello world',
    media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
    tag: 'custom tag',
    priority: Bandwidth::PriorityEnum::DEFAULT,
    expiration: '2022-06-16T13:45:07.160Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MessageRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MessageRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MessageRequest.acceptable_attributes).to eq(Bandwidth::MessageRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MessageRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MessageRequest created by the build_from_hash method' do
      message_request_from_hash = Bandwidth::MessageRequest.build_from_hash({
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        to: ['+19195551234'],
        from: '+19195554321',
        text: 'Hello world',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        tag: 'custom tag',
        priority: 'default',
        expiration: '2022-06-16T13:45:07.160Z'
      })
      expect(message_request_from_hash).to be_instance_of(Bandwidth::MessageRequest)
      expect(message_request_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(message_request_from_hash.to).to eq(['+19195551234'])
      expect(message_request_from_hash.from).to eq('+19195554321')
      expect(message_request_from_hash.text).to eq('Hello world')
      expect(message_request_from_hash.media).to eq(['https://dev.bandwidth.com/images/bandwidth-logo.png'])
      expect(message_request_from_hash.tag).to eq('custom tag')
      expect(message_request_from_hash.priority).to eq('default')
      expect(message_request_from_hash.expiration).to eq(Time.parse('2022-06-16T13:45:07.160Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(message_request_values.to_s).to eq('{:applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :to=>["+19195551234"], :from=>"+19195554321", :text=>"Hello world", :media=>["https://dev.bandwidth.com/images/bandwidth-logo.png"], :tag=>"custom tag", :priority=>"default", :expiration=>"2022-06-16T13:45:07.160Z"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      message_request_equal = Bandwidth::MessageRequest.new({
        application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
        to: ['+19195551234'],
        from: '+19195554321'
      })
      expect(message_request_default.eql?(message_request_equal)).to be true
      expect(message_request_default.eql?(message_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(message_request_values.to_body).to eq({
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        to: ['+19195551234'],
        from: '+19195554321',
        text: 'Hello world',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        tag: 'custom tag',
        priority: Bandwidth::PriorityEnum::DEFAULT,
        expiration: '2022-06-16T13:45:07.160Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#application_id=' do
      expect {
        Bandwidth::MessageRequest.new({ application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#to=' do
      expect {
        message_request_values.to = nil
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#from=' do
      expect {
        Bandwidth::MessageRequest.new({ application_id: 'a', to: ['+19195551234'], from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#text=' do
      expect {
        message_request_values.text = nil
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        message_request_values.text = 'a' * 2049
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 2048.')
    end
  end
end
