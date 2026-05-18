# Unit tests for Bandwidth::CreateMultiChannelMessageResponse
describe Bandwidth::CreateMultiChannelMessageResponse do
  let(:create_multi_channel_message_response_default) { Bandwidth::CreateMultiChannelMessageResponse.new }
  let(:create_multi_channel_message_response_values) { Bandwidth::CreateMultiChannelMessageResponse.new({
    links: [Bandwidth::Link.new({ rel: 'self', href: 'https://example.com' })],
    errors: [Bandwidth::ErrorObject.new({ type: 'validation', description: 'bad input', source: Bandwidth::ErrorSource.new })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateMultiChannelMessageResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateMultiChannelMessageResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateMultiChannelMessageResponse.acceptable_attributes).to eq(Bandwidth::CreateMultiChannelMessageResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateMultiChannelMessageResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateMultiChannelMessageResponse created by the build_from_hash method' do
      create_multi_channel_message_response_from_hash = Bandwidth::CreateMultiChannelMessageResponse.build_from_hash({
        links: [{ rel: 'self', href: 'https://example.com' }],
        errors: [{ type: 'validation', description: 'bad input', source: {} }]
      })
      expect(create_multi_channel_message_response_from_hash).to be_instance_of(Bandwidth::CreateMultiChannelMessageResponse)
      expect(create_multi_channel_message_response_from_hash.links.first).to be_instance_of(Bandwidth::Link)
      expect(create_multi_channel_message_response_from_hash.errors.first).to be_instance_of(Bandwidth::ErrorObject)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_multi_channel_message_response_values.to_s).to eq('{:links=>[{:rel=>"self", :href=>"https://example.com"}], :errors=>[{:type=>"validation", :description=>"bad input", :source=>{}}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(create_multi_channel_message_response_default.eql?(Bandwidth::CreateMultiChannelMessageResponse.new)).to be true
      expect(create_multi_channel_message_response_default.eql?(create_multi_channel_message_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_multi_channel_message_response_values.to_body).to eq({
        links: [{ rel: 'self', href: 'https://example.com' }],
        errors: [{ type: 'validation', description: 'bad input', source: {} }]
      })
    end
  end
end
