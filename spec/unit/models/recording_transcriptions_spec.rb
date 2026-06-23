# Unit tests for Bandwidth::RecordingTranscriptions
describe Bandwidth::RecordingTranscriptions do
  let(:recording_transcriptions_default) { Bandwidth::RecordingTranscriptions.new }
  let(:recording_transcriptions_values) { Bandwidth::RecordingTranscriptions.new({
    transcripts: [
      Bandwidth::Transcription.new({
        speaker: 1,
        text: 'Hello World! Thank you for calling.',
        confidence: 0.9
      })
    ],
    clips: [
      Bandwidth::RecordingTranscriptionClip.new({
        speaker: 1,
        text: 'Hello World! Thank you for calling.',
        confidence: 0.9,
        start_time_seconds: 1.0,
        end_time_seconds: 5.0
      })
    ]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptions.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptions.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RecordingTranscriptions.acceptable_attributes).to eq(Bandwidth::RecordingTranscriptions.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RecordingTranscriptions.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RecordingTranscriptions created by the build_from_hash method' do
      recording_transcriptions_from_hash = Bandwidth::RecordingTranscriptions.build_from_hash({
        transcripts: [{ text: 'Hello World! Thank you for calling.', confidence: 0.9, speaker: 1 }],
        clips: [{ text: 'Hello World! Thank you for calling.', confidence: 0.9, speaker: 1, startTimeSeconds: 1.0, endTimeSeconds: 5.0 }]
      })
      expect(recording_transcriptions_from_hash).to be_instance_of(Bandwidth::RecordingTranscriptions)
      expect(recording_transcriptions_from_hash.transcripts).to be_instance_of(Array)
      expect(recording_transcriptions_from_hash.transcripts.first).to be_instance_of(Bandwidth::Transcription)
      expect(recording_transcriptions_from_hash.transcripts.first.speaker).to eq(1)
      expect(recording_transcriptions_from_hash.transcripts.first.text).to eq('Hello World! Thank you for calling.')
      expect(recording_transcriptions_from_hash.transcripts.first.confidence).to eq(0.9)
      expect(recording_transcriptions_from_hash.clips).to be_instance_of(Array)
      expect(recording_transcriptions_from_hash.clips.first).to be_instance_of(Bandwidth::RecordingTranscriptionClip)
      expect(recording_transcriptions_from_hash.clips.first.speaker).to eq(1)
      expect(recording_transcriptions_from_hash.clips.first.text).to eq('Hello World! Thank you for calling.')
      expect(recording_transcriptions_from_hash.clips.first.confidence).to eq(0.9)
      expect(recording_transcriptions_from_hash.clips.first.start_time_seconds).to eq(1.0)
      expect(recording_transcriptions_from_hash.clips.first.end_time_seconds).to eq(5.0)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(recording_transcriptions_values.to_s).to eq('{:transcripts=>[{:speaker=>1, :text=>"Hello World! Thank you for calling.", :confidence=>0.9}], :clips=>[{:speaker=>1, :text=>"Hello World! Thank you for calling.", :confidence=>0.9, :startTimeSeconds=>1.0, :endTimeSeconds=>5.0}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(recording_transcriptions_default.eql?(Bandwidth::RecordingTranscriptions.new)).to be true
      expect(recording_transcriptions_default.eql?(recording_transcriptions_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(recording_transcriptions_values.to_body).to eq({
        transcripts: [{ text: 'Hello World! Thank you for calling.', confidence: 0.9, speaker: 1 }],
        clips: [{ text: 'Hello World! Thank you for calling.', confidence: 0.9, speaker: 1, startTimeSeconds: 1.0, endTimeSeconds: 5.0 }]
      })
    end
  end
end
