# Unit tests for Bandwidth::RbmMessageContentRichCard
describe Bandwidth::RbmMessageContentRichCard do
  describe '.openapi_one_of' do
    it 'lists the classes defined in oneOf' do
      expect(Bandwidth::RbmMessageContentRichCard.openapi_one_of).to eq([
        :'RbmMessageCarouselCard',
        :'RbmStandaloneCard'
      ])
    end
  end

  describe '.build' do
    it 'routes payloads matching RbmMessageCarouselCard attributes to RbmMessageCarouselCard.build_from_hash' do
      data = { cardWidth: 'SMALL', cardContents: [] }
      expect(Bandwidth::RbmMessageContentRichCard.build(data)).to be_instance_of(Bandwidth::RbmMessageCarouselCard)
    end

    it 'routes payloads matching RbmStandaloneCard attributes to RbmStandaloneCard.build_from_hash' do
      data = { orientation: 'HORIZONTAL', thumbnailImageAlignment: 'LEFT', cardContent: { title: 'Card Title' } }
      expect(Bandwidth::RbmMessageContentRichCard.build(data)).to be_instance_of(Bandwidth::RbmStandaloneCard)
    end

    it 'returns nil when the payload does not match any oneOf schema' do
      expect(Bandwidth::RbmMessageContentRichCard.build({ unknown: 'value' })).to be_nil
    end
  end
end
