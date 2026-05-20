# Unit tests for Bandwidth::BrtcErrorResponse
describe Bandwidth::BrtcErrorResponse do
  let(:brtc_error_response_default) { Bandwidth::BrtcErrorResponse.new({
    links: [],
    errors: []
  }) }
  let(:brtc_error_response_values) { Bandwidth::BrtcErrorResponse.new({
    links: [Bandwidth::BrtcLink.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: { foo: 'bar' },
    errors: [Bandwidth::BrtcError.new({ type: 'validation', description: 'bad input' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BrtcErrorResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BrtcErrorResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::BrtcErrorResponse.acceptable_attributes).to eq(Bandwidth::BrtcErrorResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::BrtcErrorResponse.openapi_nullable).to eq(Set.new([:'data']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BrtcErrorResponse created by the build_from_hash method' do
      brtc_error_response_from_hash = Bandwidth::BrtcErrorResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { foo: 'bar' },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
      expect(brtc_error_response_from_hash).to be_instance_of(Bandwidth::BrtcErrorResponse)
      expect(brtc_error_response_from_hash.links.first).to be_instance_of(Bandwidth::BrtcLink)
      expect(brtc_error_response_from_hash.data).to eq({ foo: 'bar' })
      expect(brtc_error_response_from_hash.errors.first).to be_instance_of(Bandwidth::BrtcError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(brtc_error_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:foo=>"bar"}, :errors=>[{:type=>"validation", :description=>"bad input"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      brtc_error_response_equal = Bandwidth::BrtcErrorResponse.new({
        links: [],
        errors: []
      })
      expect(brtc_error_response_default.eql?(brtc_error_response_equal)).to be true
      expect(brtc_error_response_default.eql?(brtc_error_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(brtc_error_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { foo: 'bar' },
        errors: [{ type: 'validation', description: 'bad input' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#links=' do
      expect {
        brtc_error_response_values.links = nil
      }.to raise_error(ArgumentError, 'links cannot be nil')
    end

    it '#errors=' do
      expect {
        brtc_error_response_values.errors = nil
      }.to raise_error(ArgumentError, 'errors cannot be nil')
    end
  end
end
