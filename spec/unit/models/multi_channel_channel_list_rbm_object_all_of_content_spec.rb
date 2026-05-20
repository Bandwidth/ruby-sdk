# Unit tests for Bandwidth::MultiChannelChannelListRBMObjectAllOfContent
describe Bandwidth::MultiChannelChannelListRBMObjectAllOfContent do
  describe '.openapi_one_of' do
    it 'lists the classes defined in oneOf' do
      expect(Bandwidth::MultiChannelChannelListRBMObjectAllOfContent.openapi_one_of).to eq([
        :'RbmMessageContentRichCard',
        :'RbmMessageContentText',
        :'RbmMessageMedia'
      ])
    end
  end

  describe '.build' do
    it 'routes payloads matching RbmMessageContentText attributes to RbmMessageContentText.build_from_hash' do
      data = { text: 'Hello world' }
      expect(Bandwidth::MultiChannelChannelListRBMObjectAllOfContent.build(data)).to be_instance_of(Bandwidth::RbmMessageContentText)
    end

    it 'routes payloads matching RbmMessageMedia attributes to RbmMessageMedia.build_from_hash' do
      data = { media: [{ fileUrl: 'https://example.com/image.png' }] }
      expect(Bandwidth::MultiChannelChannelListRBMObjectAllOfContent.build(data)).to be_instance_of(Bandwidth::RbmMessageMedia)
    end

    it 'returns nil when the payload does not match any oneOf schema' do
      expect(Bandwidth::MultiChannelChannelListRBMObjectAllOfContent.build({ unknown: 'value' })).to be_nil
    end
  end
end
