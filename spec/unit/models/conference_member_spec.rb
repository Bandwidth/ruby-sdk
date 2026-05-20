# Unit tests for Bandwidth::ConferenceMember
describe Bandwidth::ConferenceMember do
  let(:conference_member_default) { Bandwidth::ConferenceMember.new }
  let(:conference_member_values) { Bandwidth::ConferenceMember.new({
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    conference_id: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
    member_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-1/members/c-1',
    mute: false,
    hold: false,
    call_ids_to_coach: ['c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d86']
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceMember.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceMember.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceMember.acceptable_attributes).to eq(Bandwidth::ConferenceMember.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceMember.openapi_nullable).to eq(Set.new([:'call_ids_to_coach']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceMember created by the build_from_hash method' do
      conference_member_from_hash = Bandwidth::ConferenceMember.build_from_hash({
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        conferenceId: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        memberUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-1/members/c-1',
        mute: false,
        hold: false,
        callIdsToCoach: ['c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d86']
      })
      expect(conference_member_from_hash).to be_instance_of(Bandwidth::ConferenceMember)
      expect(conference_member_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_member_from_hash.conference_id).to eq('conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c')
      expect(conference_member_from_hash.member_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-1/members/c-1')
      expect(conference_member_from_hash.mute).to eq(false)
      expect(conference_member_from_hash.hold).to eq(false)
      expect(conference_member_from_hash.call_ids_to_coach).to eq(['c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d86'])
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_member_values.to_s).to eq('{:callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :conferenceId=>"conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c", :memberUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-1/members/c-1", :mute=>false, :hold=>false, :callIdsToCoach=>["c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d86"]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_member_default.eql?(Bandwidth::ConferenceMember.new)).to be true
      expect(conference_member_default.eql?(conference_member_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_member_values.to_body).to eq({
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        conferenceId: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        memberUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-1/members/c-1',
        mute: false,
        hold: false,
        callIdsToCoach: ['c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d86']
      })
    end
  end
end
