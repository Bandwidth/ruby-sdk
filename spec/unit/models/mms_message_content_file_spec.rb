# Unit tests for Bandwidth::MmsMessageContentFile
describe Bandwidth::MmsMessageContentFile do
  let(:mms_message_content_file_default) { Bandwidth::MmsMessageContentFile.new({
    file_url: 'https://example.com/baseline.jpg'
  }) }
  let(:mms_message_content_file_values) { Bandwidth::MmsMessageContentFile.new({
    file_url: 'https://example.com/image.jpg'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MmsMessageContentFile.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MmsMessageContentFile.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MmsMessageContentFile.acceptable_attributes).to eq(Bandwidth::MmsMessageContentFile.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MmsMessageContentFile.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MmsMessageContentFile created by the build_from_hash method' do
      mms_message_content_file_from_hash = Bandwidth::MmsMessageContentFile.build_from_hash({
        fileUrl: 'https://example.com/image.jpg'
      })
      expect(mms_message_content_file_from_hash).to be_instance_of(Bandwidth::MmsMessageContentFile)
      expect(mms_message_content_file_from_hash.file_url).to eq('https://example.com/image.jpg')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(mms_message_content_file_values.to_s).to eq('{:fileUrl=>"https://example.com/image.jpg"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      mms_message_content_file_equal = Bandwidth::MmsMessageContentFile.new({
        file_url: 'https://example.com/baseline.jpg'
      })
      expect(mms_message_content_file_default.eql?(mms_message_content_file_equal)).to be true
      expect(mms_message_content_file_default.eql?(mms_message_content_file_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(mms_message_content_file_values.to_body).to eq({
        fileUrl: 'https://example.com/image.jpg'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#file_url=' do
      expect {
        Bandwidth::MmsMessageContentFile.new({ file_url: nil })
      }.to raise_error(ArgumentError, 'file_url cannot be nil')

      expect {
        Bandwidth::MmsMessageContentFile.new({ file_url: 'a' * 1001 })
      }.to raise_error(ArgumentError, 'invalid value for "file_url", the character length must be smaller than or equal to 1000.')
    end
  end
end
