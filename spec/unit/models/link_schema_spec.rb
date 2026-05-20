# Unit tests for Bandwidth::LinkSchema
describe Bandwidth::LinkSchema do
  let(:link_schema_default) { Bandwidth::LinkSchema.new }
  let(:link_schema_values) { Bandwidth::LinkSchema.new({
    href: 'https://example.com',
    rel: 'self',
    method: 'GET'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LinkSchema.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LinkSchema.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LinkSchema.acceptable_attributes).to eq(Bandwidth::LinkSchema.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LinkSchema.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LinkSchema created by the build_from_hash method' do
      link_schema_from_hash = Bandwidth::LinkSchema.build_from_hash({
        href: 'https://example.com',
        rel: 'self',
        method: 'GET'
      })
      expect(link_schema_from_hash).to be_instance_of(Bandwidth::LinkSchema)
      expect(link_schema_from_hash.href).to eq('https://example.com')
      expect(link_schema_from_hash.rel).to eq('self')
      expect(link_schema_from_hash.method).to eq('GET')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(link_schema_values.to_s).to eq('{:href=>"https://example.com", :rel=>"self", :method=>"GET"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(link_schema_default.eql?(Bandwidth::LinkSchema.new)).to be true
      expect(link_schema_default.eql?(link_schema_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(link_schema_values.to_body).to eq({
        href: 'https://example.com',
        rel: 'self',
        method: 'GET'
      })
    end
  end
end
