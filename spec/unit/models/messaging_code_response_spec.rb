# Unit tests for Bandwidth::MessagingCodeResponse
describe Bandwidth::MessagingCodeResponse do
  let(:messaging_code_response_default) { Bandwidth::MessagingCodeResponse.new }
  let(:messaging_code_response_values) { Bandwidth::MessagingCodeResponse.new({
    message_id: '1589228074636lm4k2je7j7jklbn2'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MessagingCodeResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MessagingCodeResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MessagingCodeResponse.acceptable_attributes).to eq(Bandwidth::MessagingCodeResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MessagingCodeResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MessagingCodeResponse created by the build_from_hash method' do
      messaging_code_response_from_hash = Bandwidth::MessagingCodeResponse.build_from_hash({
        messageId: '1589228074636lm4k2je7j7jklbn2'
      })
      expect(messaging_code_response_from_hash).to be_instance_of(Bandwidth::MessagingCodeResponse)
      expect(messaging_code_response_from_hash.message_id).to eq('1589228074636lm4k2je7j7jklbn2')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(messaging_code_response_values.to_s).to eq('{:messageId=>"1589228074636lm4k2je7j7jklbn2"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(messaging_code_response_default.eql?(Bandwidth::MessagingCodeResponse.new)).to be true
      expect(messaging_code_response_default.eql?(messaging_code_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(messaging_code_response_values.to_body).to eq({
        messageId: '1589228074636lm4k2je7j7jklbn2'
      })
    end
  end
end
