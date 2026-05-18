# Unit tests for Bandwidth::RbmMessageCarouselCard
describe Bandwidth::RbmMessageCarouselCard do
  let(:card_content) { Bandwidth::RbmCardContent.new({
    title: 'Card Title',
    description: 'Card Description'
  }) }
  let(:reply_action) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }
  let(:rbm_message_carousel_card_default) { Bandwidth::RbmMessageCarouselCard.new({
    card_width: Bandwidth::CardWidthEnum::SMALL,
    card_contents: [card_content]
  }) }
  let(:rbm_message_carousel_card_values) { Bandwidth::RbmMessageCarouselCard.new({
    card_width: Bandwidth::CardWidthEnum::MEDIUM,
    card_contents: [card_content, card_content],
    suggestions: [reply_action]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmMessageCarouselCard.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmMessageCarouselCard.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmMessageCarouselCard.acceptable_attributes).to eq(Bandwidth::RbmMessageCarouselCard.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmMessageCarouselCard.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmMessageCarouselCard created by the build_from_hash method' do
      rbm_message_carousel_card_from_hash = Bandwidth::RbmMessageCarouselCard.build_from_hash({
        cardWidth: Bandwidth::CardWidthEnum::MEDIUM,
        cardContents: [{ title: 'Card Title', description: 'Card Description' }],
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
      expect(rbm_message_carousel_card_from_hash).to be_instance_of(Bandwidth::RbmMessageCarouselCard)
      expect(rbm_message_carousel_card_from_hash.card_width).to eq(Bandwidth::CardWidthEnum::MEDIUM)
      expect(rbm_message_carousel_card_from_hash.card_contents.first).to be_instance_of(Bandwidth::RbmCardContent)
      expect(rbm_message_carousel_card_from_hash.suggestions.first).to be_instance_of(Bandwidth::RbmActionBase)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_message_carousel_card_values.to_s).to eq('{:cardWidth=>"MEDIUM", :cardContents=>[{:title=>"Card Title", :description=>"Card Description"}, {:title=>"Card Title", :description=>"Card Description"}], :suggestions=>[{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_message_carousel_card_equal = Bandwidth::RbmMessageCarouselCard.new({
        card_width: Bandwidth::CardWidthEnum::SMALL,
        card_contents: [card_content]
      })
      expect(rbm_message_carousel_card_default.eql?(rbm_message_carousel_card_equal)).to be true
      expect(rbm_message_carousel_card_default.eql?(rbm_message_carousel_card_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_message_carousel_card_values.to_body).to eq({
        cardWidth: Bandwidth::CardWidthEnum::MEDIUM,
        cardContents: [
          { title: 'Card Title', description: 'Card Description' },
          { title: 'Card Title', description: 'Card Description' }
        ],
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#card_width=' do
      expect {
        Bandwidth::RbmMessageCarouselCard.new({ card_width: nil })
      }.to raise_error(ArgumentError, 'card_width cannot be nil')
    end

    it '#card_contents=' do
      expect {
        Bandwidth::RbmMessageCarouselCard.new({ card_width: 'SMALL' })
      }.to raise_error(ArgumentError, 'card_contents cannot be nil')

      expect {
        rbm_message_carousel_card_values.card_contents = nil
      }.to raise_error(ArgumentError, 'card_contents cannot be nil')

      expect {
        rbm_message_carousel_card_values.card_contents = [card_content] * 11
      }.to raise_error(ArgumentError, 'invalid value for "card_contents", number of items must be less than or equal to 10.')
    end

    it '#suggestions=' do
      expect {
        rbm_message_carousel_card_values.suggestions = nil
      }.to raise_error(ArgumentError, 'suggestions cannot be nil')

      expect {
        rbm_message_carousel_card_values.suggestions = [reply_action] * 12
      }.to raise_error(ArgumentError, 'invalid value for "suggestions", number of items must be less than or equal to 11.')
    end
  end
end
