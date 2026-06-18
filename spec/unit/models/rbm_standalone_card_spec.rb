# Unit tests for Bandwidth::RbmStandaloneCard
describe Bandwidth::RbmStandaloneCard do
  let(:card_content) { Bandwidth::RbmCardContent.new({
    title: 'Card Title',
    description: 'Card Description'
  }) }
  let(:reply_action) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }
  let(:rbm_standalone_card_default) { Bandwidth::RbmStandaloneCard.new({
    orientation: Bandwidth::StandaloneCardOrientationEnum::HORIZONTAL,
    thumbnail_image_alignment: Bandwidth::ThumbnailAlignmentEnum::LEFT,
    card_content: card_content
  }) }
  let(:rbm_standalone_card_values) { Bandwidth::RbmStandaloneCard.new({
    orientation: Bandwidth::StandaloneCardOrientationEnum::VERTICAL,
    thumbnail_image_alignment: Bandwidth::ThumbnailAlignmentEnum::RIGHT,
    card_content: card_content,
    suggestions: [reply_action]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmStandaloneCard.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmStandaloneCard.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmStandaloneCard.acceptable_attributes).to eq(Bandwidth::RbmStandaloneCard.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmStandaloneCard.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmStandaloneCard created by the build_from_hash method' do
      rbm_standalone_card_from_hash = Bandwidth::RbmStandaloneCard.build_from_hash({
        orientation: Bandwidth::StandaloneCardOrientationEnum::VERTICAL,
        thumbnailImageAlignment: Bandwidth::ThumbnailAlignmentEnum::RIGHT,
        cardContent: { title: 'Card Title', description: 'Card Description' },
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
      expect(rbm_standalone_card_from_hash).to be_instance_of(Bandwidth::RbmStandaloneCard)
      expect(rbm_standalone_card_from_hash.orientation).to eq(Bandwidth::StandaloneCardOrientationEnum::VERTICAL)
      expect(rbm_standalone_card_from_hash.thumbnail_image_alignment).to eq(Bandwidth::ThumbnailAlignmentEnum::RIGHT)
      expect(rbm_standalone_card_from_hash.card_content).to be_instance_of(Bandwidth::RbmCardContent)
      expect(rbm_standalone_card_from_hash.suggestions.first).to be_instance_of(Bandwidth::RbmActionBase)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_standalone_card_values.to_s).to eq('{:orientation=>"VERTICAL", :thumbnailImageAlignment=>"RIGHT", :cardContent=>{:title=>"Card Title", :description=>"Card Description"}, :suggestions=>[{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_standalone_card_equal = Bandwidth::RbmStandaloneCard.new({
        orientation: Bandwidth::StandaloneCardOrientationEnum::HORIZONTAL,
        thumbnail_image_alignment: Bandwidth::ThumbnailAlignmentEnum::LEFT,
        card_content: card_content
      })
      expect(rbm_standalone_card_default.eql?(rbm_standalone_card_equal)).to be true
      expect(rbm_standalone_card_default.eql?(rbm_standalone_card_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_standalone_card_values.to_body).to eq({
        orientation: Bandwidth::StandaloneCardOrientationEnum::VERTICAL,
        thumbnailImageAlignment: Bandwidth::ThumbnailAlignmentEnum::RIGHT,
        cardContent: { title: 'Card Title', description: 'Card Description' },
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#orientation=' do
      expect {
        Bandwidth::RbmStandaloneCard.new({ orientation: nil })
      }.to raise_error(ArgumentError, 'orientation cannot be nil')
    end

    it '#card_content=' do
      expect {
        Bandwidth::RbmStandaloneCard.new({ orientation: 'HORIZONTAL', thumbnail_image_alignment: 'LEFT', card_content: nil })
      }.to raise_error(ArgumentError, 'card_content cannot be nil')
    end

    it '#suggestions=' do
      expect {
        rbm_standalone_card_values.suggestions = nil
      }.to raise_error(ArgumentError, 'suggestions cannot be nil')

      expect {
        rbm_standalone_card_values.suggestions = [reply_action] * 12
      }.to raise_error(ArgumentError, 'invalid value for "suggestions", number of items must be less than or equal to 11.')
    end
  end
end
