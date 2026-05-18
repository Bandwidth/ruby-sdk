# Unit tests for Bandwidth::BrtcLink
describe Bandwidth::BrtcLink do
  let(:brtc_link_default) { Bandwidth::BrtcLink.new }
  let(:brtc_link_values) { Bandwidth::BrtcLink.new({
    href: 'https://example.com',
    rel: 'self',
    method: 'GET'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BrtcLink.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BrtcLink.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::BrtcLink.acceptable_attributes).to eq(Bandwidth::BrtcLink.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::BrtcLink.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BrtcLink created by the build_from_hash method' do
      brtc_link_from_hash = Bandwidth::BrtcLink.build_from_hash({
        href: 'https://example.com',
        rel: 'self',
        method: 'GET'
      })
      expect(brtc_link_from_hash).to be_instance_of(Bandwidth::BrtcLink)
      expect(brtc_link_from_hash.href).to eq('https://example.com')
      expect(brtc_link_from_hash.rel).to eq('self')
      expect(brtc_link_from_hash.method).to eq('GET')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(brtc_link_values.to_s).to eq('{:href=>"https://example.com", :rel=>"self", :method=>"GET"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(brtc_link_default.eql?(Bandwidth::BrtcLink.new)).to be true
      expect(brtc_link_default.eql?(brtc_link_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(brtc_link_values.to_body).to eq({
        href: 'https://example.com',
        rel: 'self',
        method: 'GET'
      })
    end
  end
end
