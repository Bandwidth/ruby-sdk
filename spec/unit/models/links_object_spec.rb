# Unit tests for Bandwidth::LinksObject
describe Bandwidth::LinksObject do
  let(:links_object_default) { Bandwidth::LinksObject.new }
  let(:links_object_values) { Bandwidth::LinksObject.new({
    first: 'https://example.com/page/1',
    _next: 'https://example.com/page/2',
    previous: 'https://example.com/page/0',
    last: 'https://example.com/page/9'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LinksObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LinksObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LinksObject.acceptable_attributes).to eq(Bandwidth::LinksObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LinksObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LinksObject created by the build_from_hash method' do
      links_object_from_hash = Bandwidth::LinksObject.build_from_hash({
        first: 'https://example.com/page/1',
        next: 'https://example.com/page/2',
        previous: 'https://example.com/page/0',
        last: 'https://example.com/page/9'
      })
      expect(links_object_from_hash).to be_instance_of(Bandwidth::LinksObject)
      expect(links_object_from_hash.first).to eq('https://example.com/page/1')
      expect(links_object_from_hash._next).to eq('https://example.com/page/2')
      expect(links_object_from_hash.previous).to eq('https://example.com/page/0')
      expect(links_object_from_hash.last).to eq('https://example.com/page/9')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(links_object_values.to_s).to eq('{:first=>"https://example.com/page/1", :next=>"https://example.com/page/2", :previous=>"https://example.com/page/0", :last=>"https://example.com/page/9"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(links_object_default.eql?(Bandwidth::LinksObject.new)).to be true
      expect(links_object_default.eql?(links_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(links_object_values.to_body).to eq({
        first: 'https://example.com/page/1',
        next: 'https://example.com/page/2',
        previous: 'https://example.com/page/0',
        last: 'https://example.com/page/9'
      })
    end
  end
end
