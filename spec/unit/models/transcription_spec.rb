# Unit tests for Bandwidth::Transcription
describe Bandwidth::Transcription do
  let(:transcription_default) { Bandwidth::Transcription.new }
  let(:transcription_values) { Bandwidth::Transcription.new({
    text: 'Hello World! Thank you for calling.',
    confidence: 0.9
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Transcription.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Transcription.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Transcription.acceptable_attributes).to eq(Bandwidth::Transcription.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Transcription.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Transcription created by the build_from_hash method' do
      transcription_from_hash = Bandwidth::Transcription.build_from_hash({
        text: 'Hello World! Thank you for calling.',
        confidence: 0.9
      })
      expect(transcription_from_hash).to be_instance_of(Bandwidth::Transcription)
      expect(transcription_from_hash.text).to eq('Hello World! Thank you for calling.')
      expect(transcription_from_hash.confidence).to eq(0.9)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(transcription_values.to_s).to eq('{:text=>"Hello World! Thank you for calling.", :confidence=>0.9}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(transcription_default.eql?(Bandwidth::Transcription.new)).to be true
      expect(transcription_default.eql?(transcription_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(transcription_values.to_body).to eq({
        text: 'Hello World! Thank you for calling.',
        confidence: 0.9
      })
    end
  end
end
