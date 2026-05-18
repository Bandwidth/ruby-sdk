# Unit tests for Bandwidth::ConferenceMemberJoinCallback
describe Bandwidth::ConferenceMemberJoinCallback do
  let(:conference_member_join_callback_default) { Bandwidth::ConferenceMemberJoinCallback.new }
  let(:conference_member_join_callback_values) { Bandwidth::ConferenceMemberJoinCallback.new({
    event_type: 'conferenceMemberJoin',
    event_time: '2022-06-16T13:15:07.160Z',
    conference_id: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    name: 'my-conference-name',
    from: '+19195554321',
    to: '+19195551234',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceMemberJoinCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceMemberJoinCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceMemberJoinCallback.acceptable_attributes).to eq(Bandwidth::ConferenceMemberJoinCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceMemberJoinCallback.openapi_nullable).to eq(Set.new([
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceMemberJoinCallback created by the build_from_hash method' do
      conference_member_join_callback_from_hash = Bandwidth::ConferenceMemberJoinCallback.build_from_hash({
        eventType: 'conferenceMemberJoin',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        from: '+19195554321',
        to: '+19195551234',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        tag: 'custom tag'
      })
      expect(conference_member_join_callback_from_hash).to be_instance_of(Bandwidth::ConferenceMemberJoinCallback)
      expect(conference_member_join_callback_from_hash.event_type).to eq('conferenceMemberJoin')
      expect(conference_member_join_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_member_join_callback_from_hash.conference_id).to eq('conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_member_join_callback_from_hash.name).to eq('my-conference-name')
      expect(conference_member_join_callback_from_hash.from).to eq('+19195554321')
      expect(conference_member_join_callback_from_hash.to).to eq('+19195551234')
      expect(conference_member_join_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_member_join_callback_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_member_join_callback_values.to_s).to eq('{:eventType=>"conferenceMemberJoin", :eventTime=>"2022-06-16T13:15:07.160Z", :conferenceId=>"conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :name=>"my-conference-name", :from=>"+19195554321", :to=>"+19195551234", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_member_join_callback_default.eql?(Bandwidth::ConferenceMemberJoinCallback.new)).to be true
      expect(conference_member_join_callback_default.eql?(conference_member_join_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_member_join_callback_values.to_body).to eq({
        eventType: 'conferenceMemberJoin',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        from: '+19195554321',
        to: '+19195551234',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        tag: 'custom tag'
      })
    end
  end
end
