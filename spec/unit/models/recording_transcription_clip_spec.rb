# Unit tests for Bandwidth::RecordingTranscriptionClip
describe Bandwidth::RecordingTranscriptionClip do
  let(:recording_transcription_clip_default) { Bandwidth::RecordingTranscriptionClip.new }
  let(:recording_transcription_clip_values) { Bandwidth::RecordingTranscriptionClip.new({
    speaker: 0,
    text: 'Hello world',
    confidence: 0.9,
    start_time_seconds: 1.5,
    end_time_seconds: 3.2
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptionClip.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptionClip.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RecordingTranscriptionClip.acceptable_attributes).to eq(Bandwidth::RecordingTranscriptionClip.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RecordingTranscriptionClip.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RecordingTranscriptionClip created by the build_from_hash method' do
      recording_transcription_clip_from_hash = Bandwidth::RecordingTranscriptionClip.build_from_hash({
        speaker: 0,
        text: 'Hello world',
        confidence: 0.9,
        startTimeSeconds: 1.5,
        endTimeSeconds: 3.2
      })
      expect(recording_transcription_clip_from_hash).to be_instance_of(Bandwidth::RecordingTranscriptionClip)
      expect(recording_transcription_clip_from_hash.speaker).to eq(0)
      expect(recording_transcription_clip_from_hash.text).to eq('Hello world')
      expect(recording_transcription_clip_from_hash.confidence).to eq(0.9)
      expect(recording_transcription_clip_from_hash.start_time_seconds).to eq(1.5)
      expect(recording_transcription_clip_from_hash.end_time_seconds).to eq(3.2)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(recording_transcription_clip_values.to_s).to eq('{:speaker=>0, :text=>"Hello world", :confidence=>0.9, :startTimeSeconds=>1.5, :endTimeSeconds=>3.2}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(recording_transcription_clip_default.eql?(Bandwidth::RecordingTranscriptionClip.new)).to be true
      expect(recording_transcription_clip_default.eql?(recording_transcription_clip_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(recording_transcription_clip_values.to_body).to eq({
        speaker: 0,
        text: 'Hello world',
        confidence: 0.9,
        startTimeSeconds: 1.5,
        endTimeSeconds: 3.2
      })
    end
  end

  describe 'custom attribute writers' do
    it '#confidence=' do
      expect {
        Bandwidth::RecordingTranscriptionClip.new({ confidence: nil })
      }.to raise_error(ArgumentError, 'confidence cannot be nil')

      expect {
        Bandwidth::RecordingTranscriptionClip.new({ confidence: 1.5 })
      }.to raise_error(ArgumentError, 'invalid value for "confidence", must be smaller than or equal to 1.')

      expect {
        Bandwidth::RecordingTranscriptionClip.new({ confidence: -0.5 })
      }.to raise_error(ArgumentError, 'invalid value for "confidence", must be greater than or equal to 0.')
    end
  end
end
