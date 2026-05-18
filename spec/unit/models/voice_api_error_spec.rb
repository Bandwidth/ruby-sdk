# Unit tests for Bandwidth::VoiceApiError
describe Bandwidth::VoiceApiError do
  let(:voice_api_error_default) { Bandwidth::VoiceApiError.new }
  let(:voice_api_error_values) { Bandwidth::VoiceApiError.new({
    type: 'validation',
    description: 'request body is invalid',
    id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VoiceApiError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VoiceApiError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VoiceApiError.acceptable_attributes).to eq(Bandwidth::VoiceApiError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::VoiceApiError.openapi_nullable).to eq(Set.new([:'id']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VoiceApiError created by the build_from_hash method' do
      voice_api_error_from_hash = Bandwidth::VoiceApiError.build_from_hash({
        type: 'validation',
        description: 'request body is invalid',
        id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
      })
      expect(voice_api_error_from_hash).to be_instance_of(Bandwidth::VoiceApiError)
      expect(voice_api_error_from_hash.type).to eq('validation')
      expect(voice_api_error_from_hash.description).to eq('request body is invalid')
      expect(voice_api_error_from_hash.id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(voice_api_error_values.to_s).to eq('{:type=>"validation", :description=>"request body is invalid", :id=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(voice_api_error_default.eql?(Bandwidth::VoiceApiError.new)).to be true
      expect(voice_api_error_default.eql?(voice_api_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(voice_api_error_values.to_body).to eq({
        type: 'validation',
        description: 'request body is invalid',
        id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85'
      })
    end
  end
end
