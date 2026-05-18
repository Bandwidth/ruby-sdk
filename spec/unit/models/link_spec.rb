# Unit tests for Bandwidth::Link
describe Bandwidth::Link do
  let(:link_default) { Bandwidth::Link.new }
  let(:link_values) { Bandwidth::Link.new({
    rel: 'next',
    href: 'https://example.com/page/2'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Link.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Link.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Link.acceptable_attributes).to eq(Bandwidth::Link.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Link.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Link created by the build_from_hash method' do
      link_from_hash = Bandwidth::Link.build_from_hash({
        rel: 'next',
        href: 'https://example.com/page/2'
      })
      expect(link_from_hash).to be_instance_of(Bandwidth::Link)
      expect(link_from_hash.rel).to eq('next')
      expect(link_from_hash.href).to eq('https://example.com/page/2')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(link_values.to_s).to eq('{:rel=>"next", :href=>"https://example.com/page/2"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(link_default.eql?(Bandwidth::Link.new)).to be true
      expect(link_default.eql?(link_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(link_values.to_body).to eq({
        rel: 'next',
        href: 'https://example.com/page/2'
      })
    end
  end
end
