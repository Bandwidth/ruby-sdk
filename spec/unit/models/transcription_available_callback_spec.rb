# Unit tests for Bandwidth::TranscriptionAvailableCallback
describe Bandwidth::TranscriptionAvailableCallback do
  let(:transcription_available_callback_default) { Bandwidth::TranscriptionAvailableCallback.new }
  let(:transcription_available_callback_values) { Bandwidth::TranscriptionAvailableCallback.new({
    event_type: 'transcriptionAvailable',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    media_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
    parent_call_id: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
    recording_id: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    start_time: '2022-06-16T13:15:07.160Z',
    end_time: '2022-06-16T13:17:07.160Z',
    duration: 'PT2M',
    file_format: Bandwidth::FileFormatEnum::WAV,
    tag: 'custom tag',
    transcription: { text: 'Hello world.', confidence: 0.9 },
    transfer_caller_id: '+19195554321',
    transfer_to: '+19195551234'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TranscriptionAvailableCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TranscriptionAvailableCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TranscriptionAvailableCallback.acceptable_attributes).to eq(Bandwidth::TranscriptionAvailableCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::TranscriptionAvailableCallback.openapi_nullable).to eq(Set.new([
        :'media_url',
        :'enqueued_time',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TranscriptionAvailableCallback created by the build_from_hash method' do
      transcription_available_callback_from_hash = Bandwidth::TranscriptionAvailableCallback.build_from_hash({
        eventType: 'transcriptionAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        tag: 'custom tag',
        transcription: { text: 'Hello world.', confidence: 0.9 },
        transferCallerId: '+19195554321',
        transferTo: '+19195551234'
      })
      expect(transcription_available_callback_from_hash).to be_instance_of(Bandwidth::TranscriptionAvailableCallback)
      expect(transcription_available_callback_from_hash.event_type).to eq('transcriptionAvailable')
      expect(transcription_available_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(transcription_available_callback_from_hash.account_id).to eq('9900000')
      expect(transcription_available_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(transcription_available_callback_from_hash.from).to eq('+19195554321')
      expect(transcription_available_callback_from_hash.to).to eq('+19195551234')
      expect(transcription_available_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(transcription_available_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(transcription_available_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(transcription_available_callback_from_hash.media_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media')
      expect(transcription_available_callback_from_hash.parent_call_id).to eq('c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99')
      expect(transcription_available_callback_from_hash.recording_id).to eq('r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(transcription_available_callback_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(transcription_available_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(transcription_available_callback_from_hash.end_time).to eq(Time.parse('2022-06-16T13:17:07.160Z'))
      expect(transcription_available_callback_from_hash.duration).to eq('PT2M')
      expect(transcription_available_callback_from_hash.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(transcription_available_callback_from_hash.tag).to eq('custom tag')
      expect(transcription_available_callback_from_hash.transcription).to be_instance_of(Bandwidth::Transcription)
      expect(transcription_available_callback_from_hash.transcription.text).to eq('Hello world.')
      expect(transcription_available_callback_from_hash.transcription.confidence).to eq(0.9)
      expect(transcription_available_callback_from_hash.transfer_caller_id).to eq('+19195554321')
      expect(transcription_available_callback_from_hash.transfer_to).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(transcription_available_callback_values.to_s).to eq('{:eventType=>"transcriptionAvailable", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :direction=>"inbound", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :mediaUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media", :parentCallId=>"c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99", :recordingId=>"r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :enqueuedTime=>"2022-06-16T13:15:07.160Z", :startTime=>"2022-06-16T13:15:07.160Z", :endTime=>"2022-06-16T13:17:07.160Z", :duration=>"PT2M", :fileFormat=>"wav", :tag=>"custom tag", :transcription=>{:text=>"Hello world.", :confidence=>0.9}, :transferCallerId=>"+19195554321", :transferTo=>"+19195551234"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(transcription_available_callback_default.eql?(Bandwidth::TranscriptionAvailableCallback.new)).to be true
      expect(transcription_available_callback_default.eql?(transcription_available_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(transcription_available_callback_values.to_body).to eq({
        eventType: 'transcriptionAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        tag: 'custom tag',
        transcription: { text: 'Hello world.', confidence: 0.9 },
        transferCallerId: '+19195554321',
        transferTo: '+19195551234'
      })
    end
  end
end
