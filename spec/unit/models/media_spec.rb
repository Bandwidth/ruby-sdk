# Unit tests for Bandwidth::Media
describe Bandwidth::Media do
  let(:media_default) { Bandwidth::Media.new }
  let(:media_values) { Bandwidth::Media.new({
    content: 'https://example.com/media/1.jpg',
    content_length: 12345,
    media_name: 'image.jpg'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Media.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Media.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Media.acceptable_attributes).to eq(Bandwidth::Media.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Media.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Media created by the build_from_hash method' do
      media_from_hash = Bandwidth::Media.build_from_hash({
        content: 'https://example.com/media/1.jpg',
        contentLength: 12345,
        mediaName: 'image.jpg'
      })
      expect(media_from_hash).to be_instance_of(Bandwidth::Media)
      expect(media_from_hash.content).to eq('https://example.com/media/1.jpg')
      expect(media_from_hash.content_length).to eq(12345)
      expect(media_from_hash.media_name).to eq('image.jpg')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(media_values.to_s).to eq('{:content=>"https://example.com/media/1.jpg", :contentLength=>12345, :mediaName=>"image.jpg"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(media_default.eql?(Bandwidth::Media.new)).to be true
      expect(media_default.eql?(media_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(media_values.to_body).to eq({
        content: 'https://example.com/media/1.jpg',
        contentLength: 12345,
        mediaName: 'image.jpg'
      })
    end
  end
end
