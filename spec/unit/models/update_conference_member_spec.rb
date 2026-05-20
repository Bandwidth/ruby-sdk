# Unit tests for Bandwidth::UpdateConferenceMember
describe Bandwidth::UpdateConferenceMember do
  let(:update_conference_member_default) { Bandwidth::UpdateConferenceMember.new }
  let(:update_conference_member_values) { Bandwidth::UpdateConferenceMember.new({
    mute: true,
    hold: false,
    call_ids_to_coach: ['c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85']
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::UpdateConferenceMember.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::UpdateConferenceMember.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::UpdateConferenceMember.acceptable_attributes).to eq(Bandwidth::UpdateConferenceMember.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::UpdateConferenceMember.openapi_nullable).to eq(Set.new([:'call_ids_to_coach']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of UpdateConferenceMember created by the build_from_hash method' do
      update_conference_member_from_hash = Bandwidth::UpdateConferenceMember.build_from_hash({
        mute: true,
        hold: false,
        callIdsToCoach: ['c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85']
      })
      expect(update_conference_member_from_hash).to be_instance_of(Bandwidth::UpdateConferenceMember)
      expect(update_conference_member_from_hash.mute).to eq(true)
      expect(update_conference_member_from_hash.hold).to eq(false)
      expect(update_conference_member_from_hash.call_ids_to_coach).to eq(['c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'])
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(update_conference_member_values.to_s).to eq('{:mute=>true, :hold=>false, :callIdsToCoach=>["c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85"]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(update_conference_member_default.eql?(Bandwidth::UpdateConferenceMember.new)).to be true
      expect(update_conference_member_default.eql?(update_conference_member_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(update_conference_member_values.to_body).to eq({
        mute: true,
        hold: false,
        callIdsToCoach: ['c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85']
      })
    end
  end
end
