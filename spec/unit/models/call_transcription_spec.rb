# Unit tests for Bandwidth::CallTranscription
describe Bandwidth::CallTranscription do
  let(:call_transcription_default) { Bandwidth::CallTranscription.new }
  let(:call_transcription_values) { Bandwidth::CallTranscription.new({
    detected_language: Bandwidth::CallTranscriptionDetectedLanguageEnum::EN_US,
    track: Bandwidth::CallTranscriptionTrackEnum::INBOUND,
    transcript: 'Hello world',
    confidence: 0.9
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CallTranscription.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CallTranscription.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CallTranscription.acceptable_attributes).to eq(Bandwidth::CallTranscription.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CallTranscription.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CallTranscription created by the build_from_hash method' do
      call_transcription_from_hash = Bandwidth::CallTranscription.build_from_hash({
        detectedLanguage: 'en-US',
        track: 'inbound',
        transcript: 'Hello world',
        confidence: 0.9
      })
      expect(call_transcription_from_hash).to be_instance_of(Bandwidth::CallTranscription)
      expect(call_transcription_from_hash.detected_language).to eq(Bandwidth::CallTranscriptionDetectedLanguageEnum::EN_US)
      expect(call_transcription_from_hash.track).to eq(Bandwidth::CallTranscriptionTrackEnum::INBOUND)
      expect(call_transcription_from_hash.transcript).to eq('Hello world')
      expect(call_transcription_from_hash.confidence).to eq(0.9)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(call_transcription_values.to_s).to eq('{:detectedLanguage=>"en-US", :track=>"inbound", :transcript=>"Hello world", :confidence=>0.9}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(call_transcription_default.eql?(Bandwidth::CallTranscription.new)).to be true
      expect(call_transcription_default.eql?(call_transcription_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(call_transcription_values.to_body).to eq({
        detectedLanguage: Bandwidth::CallTranscriptionDetectedLanguageEnum::EN_US,
        track: Bandwidth::CallTranscriptionTrackEnum::INBOUND,
        transcript: 'Hello world',
        confidence: 0.9
      })
    end
  end

  describe 'custom attribute writers' do
    it '#confidence=' do
      expect {
        Bandwidth::CallTranscription.new({ confidence: nil })
      }.to raise_error(ArgumentError, 'confidence cannot be nil')

      expect {
        Bandwidth::CallTranscription.new({ confidence: 1.5 })
      }.to raise_error(ArgumentError, 'invalid value for "confidence", must be smaller than or equal to 1.')

      expect {
        Bandwidth::CallTranscription.new({ confidence: -0.5 })
      }.to raise_error(ArgumentError, 'invalid value for "confidence", must be greater than or equal to 0.')
    end
  end
end
