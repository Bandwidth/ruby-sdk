# Unit tests for Bandwidth::MultiChannelMessageContent
describe Bandwidth::MultiChannelMessageContent do
  let(:multi_channel_message_content_default) { Bandwidth::MultiChannelMessageContent.new }
  let(:multi_channel_message_content_values) { Bandwidth::MultiChannelMessageContent.new({
    text: 'Hello world',
    media: Bandwidth::RbmMessageContentFile.new({ file_url: 'https://dev.bandwidth.com/images/bandwidth-logo.png' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageContent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelMessageContent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelMessageContent.acceptable_attributes).to eq(Bandwidth::MultiChannelMessageContent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelMessageContent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelMessageContent created by the build_from_hash method' do
      multi_channel_message_content_from_hash = Bandwidth::MultiChannelMessageContent.build_from_hash({
        text: 'Hello world',
        media: { fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }
      })
      expect(multi_channel_message_content_from_hash).to be_instance_of(Bandwidth::MultiChannelMessageContent)
      expect(multi_channel_message_content_from_hash.text).to eq('Hello world')
      expect(multi_channel_message_content_from_hash.media).to be_instance_of(Bandwidth::RbmMessageContentFile)
      expect(multi_channel_message_content_from_hash.media.file_url).to eq('https://dev.bandwidth.com/images/bandwidth-logo.png')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_message_content_values.to_s).to eq('{:text=>"Hello world", :media=>{:fileUrl=>"https://dev.bandwidth.com/images/bandwidth-logo.png"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(multi_channel_message_content_default.eql?(Bandwidth::MultiChannelMessageContent.new)).to be true
      expect(multi_channel_message_content_default.eql?(multi_channel_message_content_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_message_content_values.to_body).to eq({
        text: 'Hello world',
        media: { fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }
      })
    end
  end
end
