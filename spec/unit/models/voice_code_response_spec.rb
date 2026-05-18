# Unit tests for Bandwidth::VoiceCodeResponse
describe Bandwidth::VoiceCodeResponse do
  let(:voice_code_response_default) { Bandwidth::VoiceCodeResponse.new }
  let(:voice_code_response_values) { Bandwidth::VoiceCodeResponse.new({
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VoiceCodeResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VoiceCodeResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VoiceCodeResponse.acceptable_attributes).to eq(Bandwidth::VoiceCodeResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::VoiceCodeResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VoiceCodeResponse created by the build_from_hash method' do
      voice_code_response_from_hash = Bandwidth::VoiceCodeResponse.build_from_hash({
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
      })
      expect(voice_code_response_from_hash).to be_instance_of(Bandwidth::VoiceCodeResponse)
      expect(voice_code_response_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(voice_code_response_values.to_s).to eq('{:callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(voice_code_response_default.eql?(Bandwidth::VoiceCodeResponse.new)).to be true
      expect(voice_code_response_default.eql?(voice_code_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(voice_code_response_values.to_body).to eq({
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
      })
    end
  end
end
