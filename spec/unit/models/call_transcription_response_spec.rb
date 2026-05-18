# Unit tests for Bandwidth::CallTranscriptionResponse
describe Bandwidth::CallTranscriptionResponse do
  let(:call_transcription_response_default) { Bandwidth::CallTranscriptionResponse.new }
  let(:call_transcription_response_values) { Bandwidth::CallTranscriptionResponse.new({
    account_id: '9900000',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    transcription_id: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    tracks: [Bandwidth::CallTranscription.new({ detected_language: 'en-US', track: 'inbound', transcript: 'Hello', confidence: 0.9 })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CallTranscriptionResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CallTranscriptionResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CallTranscriptionResponse.acceptable_attributes).to eq(Bandwidth::CallTranscriptionResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CallTranscriptionResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CallTranscriptionResponse created by the build_from_hash method' do
      call_transcription_response_from_hash = Bandwidth::CallTranscriptionResponse.build_from_hash({
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        transcriptionId: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        tracks: [{ detectedLanguage: 'en-US', track: 'inbound', transcript: 'Hello', confidence: 0.9 }]
      })
      expect(call_transcription_response_from_hash).to be_instance_of(Bandwidth::CallTranscriptionResponse)
      expect(call_transcription_response_from_hash.account_id).to eq('9900000')
      expect(call_transcription_response_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_transcription_response_from_hash.transcription_id).to eq('t-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_transcription_response_from_hash.tracks.first).to be_instance_of(Bandwidth::CallTranscription)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(call_transcription_response_values.to_s).to eq('{:accountId=>"9900000", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :transcriptionId=>"t-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :tracks=>[{:detectedLanguage=>"en-US", :track=>"inbound", :transcript=>"Hello", :confidence=>0.9}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(call_transcription_response_default.eql?(Bandwidth::CallTranscriptionResponse.new)).to be true
      expect(call_transcription_response_default.eql?(call_transcription_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(call_transcription_response_values.to_body).to eq({
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        transcriptionId: 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        tracks: [{ detectedLanguage: 'en-US', track: 'inbound', transcript: 'Hello', confidence: 0.9 }]
      })
    end
  end
end
