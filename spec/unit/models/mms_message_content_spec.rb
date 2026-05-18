# Unit tests for Bandwidth::MmsMessageContent
describe Bandwidth::MmsMessageContent do
  let(:mms_message_content_default) { Bandwidth::MmsMessageContent.new }
  let(:mms_message_content_values) { Bandwidth::MmsMessageContent.new({
    text: 'Hello world',
    media: [Bandwidth::MmsMessageContentFile.new({ file_url: 'https://dev.bandwidth.com/images/bandwidth-logo.png' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MmsMessageContent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MmsMessageContent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MmsMessageContent.acceptable_attributes).to eq(Bandwidth::MmsMessageContent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MmsMessageContent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MmsMessageContent created by the build_from_hash method' do
      mms_message_content_from_hash = Bandwidth::MmsMessageContent.build_from_hash({
        text: 'Hello world',
        media: [{ fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }]
      })
      expect(mms_message_content_from_hash).to be_instance_of(Bandwidth::MmsMessageContent)
      expect(mms_message_content_from_hash.text).to eq('Hello world')
      expect(mms_message_content_from_hash.media).to be_instance_of(Array)
      expect(mms_message_content_from_hash.media.first).to be_instance_of(Bandwidth::MmsMessageContentFile)
      expect(mms_message_content_from_hash.media.first.file_url).to eq('https://dev.bandwidth.com/images/bandwidth-logo.png')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(mms_message_content_values.to_s).to eq('{:text=>"Hello world", :media=>[{:fileUrl=>"https://dev.bandwidth.com/images/bandwidth-logo.png"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(mms_message_content_default.eql?(Bandwidth::MmsMessageContent.new)).to be true
      expect(mms_message_content_default.eql?(mms_message_content_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(mms_message_content_values.to_body).to eq({
        text: 'Hello world',
        media: [{ fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#text=' do
      expect {
        Bandwidth::MmsMessageContent.new({ text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::MmsMessageContent.new({ text: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 2048.')
    end
  end
end
