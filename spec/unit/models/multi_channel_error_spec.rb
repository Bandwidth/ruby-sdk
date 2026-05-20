# Unit tests for Bandwidth::MultiChannelError
describe Bandwidth::MultiChannelError do
  let(:multi_channel_error_default) { Bandwidth::MultiChannelError.new }
  let(:multi_channel_error_values) { Bandwidth::MultiChannelError.new({
    links: [Bandwidth::Link.new({ rel: 'next', href: 'https://example.com/next' })],
    data: { someKey: 'someValue' },
    errors: [Bandwidth::ErrorObject.new({ type: 'invalid', description: 'Something went wrong', source: { parameter: 'foo' } })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelError.acceptable_attributes).to eq(Bandwidth::MultiChannelError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::MultiChannelError.openapi_nullable).to eq(Set.new([:'data']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelError created by the build_from_hash method' do
      multi_channel_error_from_hash = Bandwidth::MultiChannelError.build_from_hash({
        links: [{ rel: 'next', href: 'https://example.com/next' }],
        data: { someKey: 'someValue' },
        errors: [{ type: 'invalid', description: 'Something went wrong', source: { parameter: 'foo' } }]
      })
      expect(multi_channel_error_from_hash).to be_instance_of(Bandwidth::MultiChannelError)
      expect(multi_channel_error_from_hash.links.first).to be_instance_of(Bandwidth::Link)
      expect(multi_channel_error_from_hash.links.first.rel).to eq('next')
      expect(multi_channel_error_from_hash.links.first.href).to eq('https://example.com/next')
      expect(multi_channel_error_from_hash.data).to eq({ someKey: 'someValue' })
      expect(multi_channel_error_from_hash.errors.first).to be_instance_of(Bandwidth::ErrorObject)
      expect(multi_channel_error_from_hash.errors.first.type).to eq('invalid')
      expect(multi_channel_error_from_hash.errors.first.description).to eq('Something went wrong')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_error_values.to_s).to eq('{:links=>[{:rel=>"next", :href=>"https://example.com/next"}], :data=>{:someKey=>"someValue"}, :errors=>[{:type=>"invalid", :description=>"Something went wrong", :source=>{:parameter=>"foo"}}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(multi_channel_error_default.eql?(Bandwidth::MultiChannelError.new)).to be true
      expect(multi_channel_error_default.eql?(multi_channel_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_error_values.to_body).to eq({
        links: [{ rel: 'next', href: 'https://example.com/next' }],
        data: { someKey: 'someValue' },
        errors: [{ type: 'invalid', description: 'Something went wrong', source: { parameter: 'foo' } }]
      })
    end
  end
end
