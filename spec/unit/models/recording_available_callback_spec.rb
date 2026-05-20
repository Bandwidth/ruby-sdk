# Unit tests for Bandwidth::RecordingAvailableCallback
describe Bandwidth::RecordingAvailableCallback do
  let(:recording_available_callback_default) { Bandwidth::RecordingAvailableCallback.new }
  let(:recording_available_callback_values) { Bandwidth::RecordingAvailableCallback.new({
    event_type: 'recordingAvailable',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    parent_call_id: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
    recording_id: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    media_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    start_time: '2022-06-16T13:15:07.160Z',
    end_time: '2022-06-16T13:17:07.160Z',
    duration: 'PT2M',
    file_format: Bandwidth::FileFormatEnum::WAV,
    channels: 1,
    tag: 'custom tag',
    status: 'complete',
    transfer_caller_id: '+19195554321',
    transfer_to: '+19195551234'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RecordingAvailableCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RecordingAvailableCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RecordingAvailableCallback.acceptable_attributes).to eq(Bandwidth::RecordingAvailableCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::RecordingAvailableCallback.openapi_nullable).to eq(Set.new([
        :'media_url',
        :'enqueued_time',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RecordingAvailableCallback created by the build_from_hash method' do
      recording_available_callback_from_hash = Bandwidth::RecordingAvailableCallback.build_from_hash({
        eventType: 'recordingAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        channels: 1,
        tag: 'custom tag',
        status: 'complete',
        transferCallerId: '+19195554321',
        transferTo: '+19195551234'
      })
      expect(recording_available_callback_from_hash).to be_instance_of(Bandwidth::RecordingAvailableCallback)
      expect(recording_available_callback_from_hash.event_type).to eq('recordingAvailable')
      expect(recording_available_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(recording_available_callback_from_hash.account_id).to eq('9900000')
      expect(recording_available_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(recording_available_callback_from_hash.from).to eq('+19195554321')
      expect(recording_available_callback_from_hash.to).to eq('+19195551234')
      expect(recording_available_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(recording_available_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(recording_available_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(recording_available_callback_from_hash.parent_call_id).to eq('c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99')
      expect(recording_available_callback_from_hash.recording_id).to eq('r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(recording_available_callback_from_hash.media_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media')
      expect(recording_available_callback_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(recording_available_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(recording_available_callback_from_hash.end_time).to eq(Time.parse('2022-06-16T13:17:07.160Z'))
      expect(recording_available_callback_from_hash.duration).to eq('PT2M')
      expect(recording_available_callback_from_hash.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(recording_available_callback_from_hash.channels).to eq(1)
      expect(recording_available_callback_from_hash.tag).to eq('custom tag')
      expect(recording_available_callback_from_hash.status).to eq('complete')
      expect(recording_available_callback_from_hash.transfer_caller_id).to eq('+19195554321')
      expect(recording_available_callback_from_hash.transfer_to).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(recording_available_callback_values.to_s).to eq('{:eventType=>"recordingAvailable", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :direction=>"inbound", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :parentCallId=>"c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99", :recordingId=>"r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :mediaUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media", :enqueuedTime=>"2022-06-16T13:15:07.160Z", :startTime=>"2022-06-16T13:15:07.160Z", :endTime=>"2022-06-16T13:17:07.160Z", :duration=>"PT2M", :fileFormat=>"wav", :channels=>1, :tag=>"custom tag", :status=>"complete", :transferCallerId=>"+19195554321", :transferTo=>"+19195551234"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(recording_available_callback_default.eql?(Bandwidth::RecordingAvailableCallback.new)).to be true
      expect(recording_available_callback_default.eql?(recording_available_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(recording_available_callback_values.to_body).to eq({
        eventType: 'recordingAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        channels: 1,
        tag: 'custom tag',
        status: 'complete',
        transferCallerId: '+19195554321',
        transferTo: '+19195551234'
      })
    end
  end
end
