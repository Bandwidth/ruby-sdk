# Unit tests for Bandwidth::CallTranscriptionMetadata
describe Bandwidth::CallTranscriptionMetadata do
  let(:call_transcription_metadata_default) { Bandwidth::CallTranscriptionMetadata.new }
  let(:call_transcription_metadata_values) { Bandwidth::CallTranscriptionMetadata.new({
    transcription_id: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    transcription_name: 'live-transcription',
    transcription_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1/transcriptions/t-1'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CallTranscriptionMetadata.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CallTranscriptionMetadata.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CallTranscriptionMetadata.acceptable_attributes).to eq(Bandwidth::CallTranscriptionMetadata.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CallTranscriptionMetadata.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CallTranscriptionMetadata created by the build_from_hash method' do
      call_transcription_metadata_from_hash = Bandwidth::CallTranscriptionMetadata.build_from_hash({
        transcriptionId: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        transcriptionName: 'live-transcription',
        transcriptionUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1/transcriptions/t-1'
      })
      expect(call_transcription_metadata_from_hash).to be_instance_of(Bandwidth::CallTranscriptionMetadata)
      expect(call_transcription_metadata_from_hash.transcription_id).to eq('t-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_transcription_metadata_from_hash.transcription_name).to eq('live-transcription')
      expect(call_transcription_metadata_from_hash.transcription_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1/transcriptions/t-1')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(call_transcription_metadata_values.to_s).to eq('{:transcriptionId=>"t-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :transcriptionName=>"live-transcription", :transcriptionUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1/transcriptions/t-1"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(call_transcription_metadata_default.eql?(Bandwidth::CallTranscriptionMetadata.new)).to be true
      expect(call_transcription_metadata_default.eql?(call_transcription_metadata_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(call_transcription_metadata_values.to_body).to eq({
        transcriptionId: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        transcriptionName: 'live-transcription',
        transcriptionUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1/transcriptions/t-1'
      })
    end
  end
end
