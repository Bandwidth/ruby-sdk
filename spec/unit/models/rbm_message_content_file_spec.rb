# Unit tests for Bandwidth::RbmMessageContentFile
describe Bandwidth::RbmMessageContentFile do
  let(:rbm_message_content_file_default) { Bandwidth::RbmMessageContentFile.new({
    file_url: 'https://example.com/baseline.png'
  }) }
  let(:rbm_message_content_file_values) { Bandwidth::RbmMessageContentFile.new({
    file_url: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
    thumbnail_url: 'https://dev.bandwidth.com/images/bandwidth-logo-thumb.png'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmMessageContentFile.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmMessageContentFile.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmMessageContentFile.acceptable_attributes).to eq(Bandwidth::RbmMessageContentFile.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmMessageContentFile.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmMessageContentFile created by the build_from_hash method' do
      rbm_message_content_file_from_hash = Bandwidth::RbmMessageContentFile.build_from_hash({
        fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
        thumbnailUrl: 'https://dev.bandwidth.com/images/bandwidth-logo-thumb.png'
      })
      expect(rbm_message_content_file_from_hash).to be_instance_of(Bandwidth::RbmMessageContentFile)
      expect(rbm_message_content_file_from_hash.file_url).to eq('https://dev.bandwidth.com/images/bandwidth-logo.png')
      expect(rbm_message_content_file_from_hash.thumbnail_url).to eq('https://dev.bandwidth.com/images/bandwidth-logo-thumb.png')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_message_content_file_values.to_s).to eq('{:fileUrl=>"https://dev.bandwidth.com/images/bandwidth-logo.png", :thumbnailUrl=>"https://dev.bandwidth.com/images/bandwidth-logo-thumb.png"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_message_content_file_equal = Bandwidth::RbmMessageContentFile.new({
        file_url: 'https://example.com/baseline.png'
      })
      expect(rbm_message_content_file_default.eql?(rbm_message_content_file_equal)).to be true
      expect(rbm_message_content_file_default.eql?(rbm_message_content_file_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_message_content_file_values.to_body).to eq({
        fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
        thumbnailUrl: 'https://dev.bandwidth.com/images/bandwidth-logo-thumb.png'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#file_url=' do
      expect {
        Bandwidth::RbmMessageContentFile.new({ file_url: nil })
      }.to raise_error(ArgumentError, 'file_url cannot be nil')

      expect {
        Bandwidth::RbmMessageContentFile.new({ file_url: 'a' * 1001 })
      }.to raise_error(ArgumentError, 'invalid value for "file_url", the character length must be smaller than or equal to 1000.')
    end

    it '#thumbnail_url=' do
      expect {
        rbm_message_content_file_values.thumbnail_url = nil
      }.to raise_error(ArgumentError, 'thumbnail_url cannot be nil')

      expect {
        rbm_message_content_file_values.thumbnail_url = 'a' * 1001
      }.to raise_error(ArgumentError, 'invalid value for "thumbnail_url", the character length must be smaller than or equal to 1000.')
    end
  end
end
