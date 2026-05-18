# Unit tests for Bandwidth::RecordingTranscriptionMetadata
describe Bandwidth::RecordingTranscriptionMetadata do
  let(:recording_transcription_metadata_default) { Bandwidth::RecordingTranscriptionMetadata.new }
  let(:recording_transcription_metadata_values) { Bandwidth::RecordingTranscriptionMetadata.new({
    id: 't-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c',
    status: 'available',
    completed_time: '2022-06-17T22:21:30Z',
    url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcriptions/t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptionMetadata.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RecordingTranscriptionMetadata.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RecordingTranscriptionMetadata.acceptable_attributes).to eq(Bandwidth::RecordingTranscriptionMetadata.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RecordingTranscriptionMetadata.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RecordingTranscriptionMetadata created by the build_from_hash method' do
      recording_transcription_metadata_from_hash = Bandwidth::RecordingTranscriptionMetadata.build_from_hash({
        id: 't-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c',
        status: 'available',
        completedTime: '2022-06-17T22:21:30Z',
        url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcriptions/t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c'
      })
      expect(recording_transcription_metadata_from_hash).to be_instance_of(Bandwidth::RecordingTranscriptionMetadata)
      expect(recording_transcription_metadata_from_hash.id).to eq('t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c')
      expect(recording_transcription_metadata_from_hash.status).to eq('available')
      expect(recording_transcription_metadata_from_hash.completed_time).to eq(Time.parse('2022-06-17T22:21:30Z'))
      expect(recording_transcription_metadata_from_hash.url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcriptions/t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(recording_transcription_metadata_values.to_s).to eq('{:id=>"t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c", :status=>"available", :completedTime=>"2022-06-17T22:21:30Z", :url=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcriptions/t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(recording_transcription_metadata_default.eql?(Bandwidth::RecordingTranscriptionMetadata.new)).to be true
      expect(recording_transcription_metadata_default.eql?(recording_transcription_metadata_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(recording_transcription_metadata_values.to_body).to eq({
        id: 't-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c',
        status: 'available',
        completedTime: '2022-06-17T22:21:30Z',
        url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcriptions/t-3f758f24-c7a2fdac-7c2e-4d83-bf28-c7c1ed29563c'
      })
    end
  end
end
