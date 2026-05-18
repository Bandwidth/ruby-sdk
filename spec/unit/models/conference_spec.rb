# Unit tests for Bandwidth::Conference
describe Bandwidth::Conference do
  let(:conference_default) { Bandwidth::Conference.new }
  let(:conference_values) { Bandwidth::Conference.new({
    id: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
    name: 'weekly-stand-up',
    created_time: '2022-06-16T13:15:07.160Z',
    completed_time: '2022-06-16T13:45:07.160Z',
    conference_event_url: 'https://example.com/conference-event',
    conference_event_method: Bandwidth::CallbackMethodEnum::POST,
    tag: 'custom tag',
    active_members: [Bandwidth::ConferenceMember.new({ call_id: 'c-1', conference_id: 'conf-1' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Conference.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Conference.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Conference.acceptable_attributes).to eq(Bandwidth::Conference.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::Conference.openapi_nullable).to eq(Set.new([
        :'completed_time',
        :'conference_event_url',
        :'conference_event_method',
        :'tag',
        :'active_members'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Conference created by the build_from_hash method' do
      conference_from_hash = Bandwidth::Conference.build_from_hash({
        id: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        name: 'weekly-stand-up',
        createdTime: '2022-06-16T13:15:07.160Z',
        completedTime: '2022-06-16T13:45:07.160Z',
        conferenceEventUrl: 'https://example.com/conference-event',
        conferenceEventMethod: 'POST',
        tag: 'custom tag',
        activeMembers: [{ callId: 'c-1', conferenceId: 'conf-1' }]
      })
      expect(conference_from_hash).to be_instance_of(Bandwidth::Conference)
      expect(conference_from_hash.id).to eq('conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c')
      expect(conference_from_hash.name).to eq('weekly-stand-up')
      expect(conference_from_hash.created_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_from_hash.completed_time).to eq(Time.parse('2022-06-16T13:45:07.160Z'))
      expect(conference_from_hash.conference_event_url).to eq('https://example.com/conference-event')
      expect(conference_from_hash.conference_event_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(conference_from_hash.tag).to eq('custom tag')
      expect(conference_from_hash.active_members.first).to be_instance_of(Bandwidth::ConferenceMember)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_values.to_s).to eq('{:id=>"conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c", :name=>"weekly-stand-up", :createdTime=>"2022-06-16T13:15:07.160Z", :completedTime=>"2022-06-16T13:45:07.160Z", :conferenceEventUrl=>"https://example.com/conference-event", :conferenceEventMethod=>"POST", :tag=>"custom tag", :activeMembers=>[{:callId=>"c-1", :conferenceId=>"conf-1"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_default.eql?(Bandwidth::Conference.new)).to be true
      expect(conference_default.eql?(conference_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_values.to_body).to eq({
        id: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        name: 'weekly-stand-up',
        createdTime: '2022-06-16T13:15:07.160Z',
        completedTime: '2022-06-16T13:45:07.160Z',
        conferenceEventUrl: 'https://example.com/conference-event',
        conferenceEventMethod: Bandwidth::CallbackMethodEnum::POST,
        tag: 'custom tag',
        activeMembers: [{ callId: 'c-1', conferenceId: 'conf-1' }]
      })
    end
  end
end
