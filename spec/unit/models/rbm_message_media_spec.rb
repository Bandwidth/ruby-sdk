# Unit tests for Bandwidth::RbmMessageMedia
describe Bandwidth::RbmMessageMedia do
  let(:media_file) { Bandwidth::RbmMessageContentFile.new({
    file_url: 'https://dev.bandwidth.com/images/bandwidth-logo.png'
  }) }
  let(:reply_action) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }
  let(:rbm_message_media_default) { Bandwidth::RbmMessageMedia.new({
    media: [media_file]
  }) }
  let(:rbm_message_media_values) { Bandwidth::RbmMessageMedia.new({
    media: [media_file],
    suggestions: [reply_action]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmMessageMedia.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmMessageMedia.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmMessageMedia.acceptable_attributes).to eq(Bandwidth::RbmMessageMedia.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmMessageMedia.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmMessageMedia created by the build_from_hash method' do
      rbm_message_media_from_hash = Bandwidth::RbmMessageMedia.build_from_hash({
        media: [{ fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }],
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
      expect(rbm_message_media_from_hash).to be_instance_of(Bandwidth::RbmMessageMedia)
      expect(rbm_message_media_from_hash.media.first).to be_instance_of(Bandwidth::RbmMessageContentFile)
      expect(rbm_message_media_from_hash.suggestions.first).to be_instance_of(Bandwidth::RbmActionBase)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_message_media_values.to_s).to eq('{:media=>[{:fileUrl=>"https://dev.bandwidth.com/images/bandwidth-logo.png"}], :suggestions=>[{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_message_media_equal = Bandwidth::RbmMessageMedia.new({
        media: [media_file]
      })
      expect(rbm_message_media_default.eql?(rbm_message_media_equal)).to be true
      expect(rbm_message_media_default.eql?(rbm_message_media_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_message_media_values.to_body).to eq({
        media: [{ fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }],
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#media=' do
      expect {
        Bandwidth::RbmMessageMedia.new({})
      }.to raise_error(ArgumentError, 'media cannot be nil')

      expect {
        rbm_message_media_values.media = nil
      }.to raise_error(ArgumentError, 'media cannot be nil')
    end

    it '#suggestions=' do
      expect {
        rbm_message_media_values.suggestions = nil
      }.to raise_error(ArgumentError, 'suggestions cannot be nil')

      expect {
        rbm_message_media_values.suggestions = [reply_action] * 12
      }.to raise_error(ArgumentError, 'invalid value for "suggestions", number of items must be less than or equal to 11.')
    end
  end
end
