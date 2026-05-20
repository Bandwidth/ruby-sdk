# Unit tests for Bandwidth::ConferenceCreatedCallback
describe Bandwidth::ConferenceCreatedCallback do
  let(:conference_created_callback_default) { Bandwidth::ConferenceCreatedCallback.new }
  let(:conference_created_callback_values) { Bandwidth::ConferenceCreatedCallback.new({
    event_type: 'conferenceCreated',
    event_time: '2022-06-16T13:15:07.160Z',
    conference_id: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    name: 'my-conference-name',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceCreatedCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceCreatedCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceCreatedCallback.acceptable_attributes).to eq(Bandwidth::ConferenceCreatedCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceCreatedCallback.openapi_nullable).to eq(Set.new([
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceCreatedCallback created by the build_from_hash method' do
      conference_created_callback_from_hash = Bandwidth::ConferenceCreatedCallback.build_from_hash({
        eventType: 'conferenceCreated',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        tag: 'custom tag'
      })
      expect(conference_created_callback_from_hash).to be_instance_of(Bandwidth::ConferenceCreatedCallback)
      expect(conference_created_callback_from_hash.event_type).to eq('conferenceCreated')
      expect(conference_created_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_created_callback_from_hash.conference_id).to eq('conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_created_callback_from_hash.name).to eq('my-conference-name')
      expect(conference_created_callback_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_created_callback_values.to_s).to eq('{:eventType=>"conferenceCreated", :eventTime=>"2022-06-16T13:15:07.160Z", :conferenceId=>"conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :name=>"my-conference-name", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_created_callback_default.eql?(Bandwidth::ConferenceCreatedCallback.new)).to be true
      expect(conference_created_callback_default.eql?(conference_created_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_created_callback_values.to_body).to eq({
        eventType: 'conferenceCreated',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        tag: 'custom tag'
      })
    end
  end
end
