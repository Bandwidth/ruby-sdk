# Unit tests for Bandwidth::LookupErrorResponse
describe Bandwidth::LookupErrorResponse do
  let(:lookup_error_response_default) { Bandwidth::LookupErrorResponse.new }
  let(:lookup_error_response_values) { Bandwidth::LookupErrorResponse.new({
    links: [Bandwidth::LinkSchema.new({ href: 'https://example.com', rel: 'self', method: 'GET' })],
    data: { foo: 'bar' },
    errors: [Bandwidth::LookupErrorSchema.new({ code: '400', description: 'bad request', type: 'validation' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LookupErrorResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LookupErrorResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LookupErrorResponse.acceptable_attributes).to eq(Bandwidth::LookupErrorResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LookupErrorResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LookupErrorResponse created by the build_from_hash method' do
      lookup_error_response_from_hash = Bandwidth::LookupErrorResponse.build_from_hash({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { foo: 'bar' },
        errors: [{ code: '400', description: 'bad request', type: 'validation' }]
      })
      expect(lookup_error_response_from_hash).to be_instance_of(Bandwidth::LookupErrorResponse)
      expect(lookup_error_response_from_hash.links.first).to be_instance_of(Bandwidth::LinkSchema)
      expect(lookup_error_response_from_hash.data).to eq({ foo: 'bar' })
      expect(lookup_error_response_from_hash.errors.first).to be_instance_of(Bandwidth::LookupErrorSchema)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(lookup_error_response_values.to_s).to eq('{:links=>[{:href=>"https://example.com", :rel=>"self", :method=>"GET"}], :data=>{:foo=>"bar"}, :errors=>[{:code=>"400", :description=>"bad request", :type=>"validation"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(lookup_error_response_default.eql?(Bandwidth::LookupErrorResponse.new)).to be true
      expect(lookup_error_response_default.eql?(lookup_error_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(lookup_error_response_values.to_body).to eq({
        links: [{ href: 'https://example.com', rel: 'self', method: 'GET' }],
        data: { foo: 'bar' },
        errors: [{ code: '400', description: 'bad request', type: 'validation' }]
      })
    end
  end
end
