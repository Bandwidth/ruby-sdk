# Unit tests for Bandwidth::CallRecordingMetadata
describe Bandwidth::CallRecordingMetadata do
  let(:call_recording_metadata_default) { Bandwidth::CallRecordingMetadata.new }
  let(:call_recording_metadata_values) { Bandwidth::CallRecordingMetadata.new({
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    account_id: '9900000',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    parent_call_id: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
    recording_id: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
    to: '+19195551234',
    from: '+19195554321',
    transfer_caller_id: '+19195555678',
    transfer_to: '+19195558765',
    duration: 'PT13.67S',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    channels: 1,
    start_time: '2022-06-16T13:15:07.160Z',
    end_time: '2022-06-16T13:15:20.830Z',
    file_format: Bandwidth::FileFormatEnum::WAV,
    status: 'complete',
    media_url: 'https://example.com/recording.wav',
    transcription: { id: 't-123', url: 'https://example.com/t-123', status: 'available', completed_time: '2022-06-16T13:15:31.000Z' },
    recording_name: 'sample-recording'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CallRecordingMetadata.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CallRecordingMetadata.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CallRecordingMetadata.acceptable_attributes).to eq(Bandwidth::CallRecordingMetadata.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::CallRecordingMetadata.openapi_nullable).to eq(Set.new([
        :'media_url',
        :'transcription'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CallRecordingMetadata created by the build_from_hash method' do
      call_recording_metadata_from_hash = Bandwidth::CallRecordingMetadata.build_from_hash({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
        to: '+19195551234',
        from: '+19195554321',
        transferCallerId: '+19195555678',
        transferTo: '+19195558765',
        duration: 'PT13.67S',
        direction: 'inbound',
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:15:20.830Z',
        fileFormat: 'wav',
        status: 'complete',
        mediaUrl: 'https://example.com/recording.wav',
        recordingName: 'sample-recording'
      })
      expect(call_recording_metadata_from_hash).to be_instance_of(Bandwidth::CallRecordingMetadata)
      expect(call_recording_metadata_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(call_recording_metadata_from_hash.account_id).to eq('9900000')
      expect(call_recording_metadata_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_recording_metadata_from_hash.parent_call_id).to eq('c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99')
      expect(call_recording_metadata_from_hash.recording_id).to eq('r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4')
      expect(call_recording_metadata_from_hash.to).to eq('+19195551234')
      expect(call_recording_metadata_from_hash.from).to eq('+19195554321')
      expect(call_recording_metadata_from_hash.transfer_caller_id).to eq('+19195555678')
      expect(call_recording_metadata_from_hash.transfer_to).to eq('+19195558765')
      expect(call_recording_metadata_from_hash.duration).to eq('PT13.67S')
      expect(call_recording_metadata_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(call_recording_metadata_from_hash.channels).to eq(1)
      expect(call_recording_metadata_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(call_recording_metadata_from_hash.end_time).to eq(Time.parse('2022-06-16T13:15:20.830Z'))
      expect(call_recording_metadata_from_hash.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(call_recording_metadata_from_hash.status).to eq('complete')
      expect(call_recording_metadata_from_hash.media_url).to eq('https://example.com/recording.wav')
      expect(call_recording_metadata_from_hash.recording_name).to eq('sample-recording')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(call_recording_metadata_values.to_s).to eq('{:applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :accountId=>"9900000", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :parentCallId=>"c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99", :recordingId=>"r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4", :to=>"+19195551234", :from=>"+19195554321", :transferCallerId=>"+19195555678", :transferTo=>"+19195558765", :duration=>"PT13.67S", :direction=>"inbound", :channels=>1, :startTime=>"2022-06-16T13:15:07.160Z", :endTime=>"2022-06-16T13:15:20.830Z", :fileFormat=>"wav", :status=>"complete", :mediaUrl=>"https://example.com/recording.wav", :transcription=>{:id=>"t-123", :url=>"https://example.com/t-123", :status=>"available", :completed_time=>"2022-06-16T13:15:31.000Z"}, :recordingName=>"sample-recording"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(call_recording_metadata_default.eql?(Bandwidth::CallRecordingMetadata.new)).to be true
      expect(call_recording_metadata_default.eql?(call_recording_metadata_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(call_recording_metadata_values.to_body).to eq({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
        to: '+19195551234',
        from: '+19195554321',
        transferCallerId: '+19195555678',
        transferTo: '+19195558765',
        duration: 'PT13.67S',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:15:20.830Z',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        status: 'complete',
        mediaUrl: 'https://example.com/recording.wav',
        transcription: { id: 't-123', url: 'https://example.com/t-123', status: 'available', completed_time: '2022-06-16T13:15:31.000Z' },
        recordingName: 'sample-recording'
      })
    end
  end
end
