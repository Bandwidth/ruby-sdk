# Unit tests for Bandwidth::Message
describe Bandwidth::Message do
  let(:message_default) { Bandwidth::Message.new }
  let(:message_values) { Bandwidth::Message.new({
    id: '1589228074636lm4k2je7j7jklbn2',
    owner: '+19195554321',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    time: '2022-06-16T13:15:07.160Z',
    segment_count: 2,
    direction: Bandwidth::MessageDirectionEnum::IN,
    to: ['+19195551234'],
    from: '+19195554321',
    media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
    text: 'Hello world',
    tag: 'custom tag',
    priority: 'default',
    expiration: '2022-06-16T13:45:07.160Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Message.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Message.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Message.acceptable_attributes).to eq(Bandwidth::Message.attribute_map.values)
    end
  end

  describe 'enum validation' do
    it 'works' do
      
    end
  end

  describe 'EnumAttributeValidator' do
    it 'validates string enum' do
      validator = Bandwidth::Message::EnumAttributeValidator.new(String, ['valid'])
      expect(validator.valid?('valid')).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates integer enum' do
      validator = Bandwidth::Message::EnumAttributeValidator.new(Integer, [1])
      expect(validator.valid?(1)).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates float enum' do
      validator = Bandwidth::Message::EnumAttributeValidator.new(Float, [1.0])
      expect(validator.valid?(1.0)).to be true
      expect(validator.valid?('invalid')).to be false
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Message created by the build_from_hash method' do
      message_from_hash = Bandwidth::Message.build_from_hash({
        id: '1589228074636lm4k2je7j7jklbn2',
        owner: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        time: '2022-06-16T13:15:07.160Z',
        segmentCount: 2,
        direction: Bandwidth::MessageDirectionEnum::IN,
        to: ['+19195551234'],
        from: '+19195554321',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        text: 'Hello world',
        tag: 'custom tag',
        priority: 'default',
        expiration: '2022-06-16T13:45:07.160Z'
      })
      expect(message_from_hash).to be_instance_of(Bandwidth::Message)
      expect(message_from_hash.id).to eq('1589228074636lm4k2je7j7jklbn2')
      expect(message_from_hash.owner).to eq('+19195554321')
      expect(message_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(message_from_hash.time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(message_from_hash.segment_count).to eq(2)
      expect(message_from_hash.direction).to eq(Bandwidth::MessageDirectionEnum::IN)
      expect(message_from_hash.to).to eq(['+19195551234'])
      expect(message_from_hash.from).to eq('+19195554321')
      expect(message_from_hash.media).to eq(['https://dev.bandwidth.com/images/bandwidth-logo.png'])
      expect(message_from_hash.text).to eq('Hello world')
      expect(message_from_hash.tag).to eq('custom tag')
      expect(message_from_hash.priority).to eq('default')
      expect(message_from_hash.expiration).to eq(Time.parse('2022-06-16T13:45:07.160Z'))
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(message_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(message_default.to_s).to eq('{}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(message_default.eql?(Bandwidth::Message.new)).to be true
      expect(message_default.eql?(message_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(message_values.to_body).to eq({
        id: '1589228074636lm4k2je7j7jklbn2',
        owner: '+19195554321',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        time: '2022-06-16T13:15:07.160Z',
        segmentCount: 2,
        direction: Bandwidth::MessageDirectionEnum::IN,
        to: ['+19195551234'],
        from: '+19195554321',
        media: ['https://dev.bandwidth.com/images/bandwidth-logo.png'],
        text: 'Hello world',
        tag: 'custom tag',
        priority: 'default',
        expiration: '2022-06-16T13:45:07.160Z'
      })
    end
  end
end
