# Unit tests for Bandwidth::ConferenceCompletedCallback
describe Bandwidth::ConferenceCompletedCallback do
  let(:conference_completed_callback_default) { Bandwidth::ConferenceCompletedCallback.new }
  let(:conference_completed_callback_values) { Bandwidth::ConferenceCompletedCallback.new({
    event_type: 'conferenceCompleted',
    event_time: '2022-06-16T13:15:07.160Z',
    conference_id: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    name: 'my-conference-name',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceCompletedCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceCompletedCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceCompletedCallback.acceptable_attributes).to eq(Bandwidth::ConferenceCompletedCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceCompletedCallback.openapi_nullable).to eq(Set.new([
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceCompletedCallback created by the build_from_hash method' do
      conference_completed_callback_from_hash = Bandwidth::ConferenceCompletedCallback.build_from_hash({
        eventType: 'conferenceCompleted',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        tag: 'custom tag'
      })
      expect(conference_completed_callback_from_hash).to be_instance_of(Bandwidth::ConferenceCompletedCallback)
      expect(conference_completed_callback_from_hash.event_type).to eq('conferenceCompleted')
      expect(conference_completed_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_completed_callback_from_hash.conference_id).to eq('conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_completed_callback_from_hash.name).to eq('my-conference-name')
      expect(conference_completed_callback_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_completed_callback_values.to_s).to eq('{:eventType=>"conferenceCompleted", :eventTime=>"2022-06-16T13:15:07.160Z", :conferenceId=>"conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :name=>"my-conference-name", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_completed_callback_default.eql?(Bandwidth::ConferenceCompletedCallback.new)).to be true
      expect(conference_completed_callback_default.eql?(conference_completed_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_completed_callback_values.to_body).to eq({
        eventType: 'conferenceCompleted',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        tag: 'custom tag'
      })
    end
  end
end
