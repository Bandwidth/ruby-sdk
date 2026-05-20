# Unit tests for Bandwidth::ConferenceRecordingAvailableCallback
describe Bandwidth::ConferenceRecordingAvailableCallback do
  let(:conference_recording_available_callback_default) { Bandwidth::ConferenceRecordingAvailableCallback.new }
  let(:conference_recording_available_callback_values) { Bandwidth::ConferenceRecordingAvailableCallback.new({
    event_type: 'conferenceRecordingAvailable',
    event_time: '2022-06-16T13:15:07.160Z',
    conference_id: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    name: 'my-conference-name',
    account_id: '9900000',
    recording_id: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    channels: 1,
    start_time: '2022-06-16T13:15:07.160Z',
    end_time: '2022-06-16T13:17:07.160Z',
    duration: 'PT2M',
    file_format: Bandwidth::FileFormatEnum::WAV,
    media_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
    tag: 'custom tag',
    status: 'complete'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceRecordingAvailableCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceRecordingAvailableCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceRecordingAvailableCallback.acceptable_attributes).to eq(Bandwidth::ConferenceRecordingAvailableCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceRecordingAvailableCallback.openapi_nullable).to eq(Set.new([
        :'media_url',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceRecordingAvailableCallback created by the build_from_hash method' do
      conference_recording_available_callback_from_hash = Bandwidth::ConferenceRecordingAvailableCallback.build_from_hash({
        eventType: 'conferenceRecordingAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        accountId: '9900000',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        tag: 'custom tag',
        status: 'complete'
      })
      expect(conference_recording_available_callback_from_hash).to be_instance_of(Bandwidth::ConferenceRecordingAvailableCallback)
      expect(conference_recording_available_callback_from_hash.event_type).to eq('conferenceRecordingAvailable')
      expect(conference_recording_available_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_recording_available_callback_from_hash.conference_id).to eq('conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_recording_available_callback_from_hash.name).to eq('my-conference-name')
      expect(conference_recording_available_callback_from_hash.account_id).to eq('9900000')
      expect(conference_recording_available_callback_from_hash.recording_id).to eq('r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(conference_recording_available_callback_from_hash.channels).to eq(1)
      expect(conference_recording_available_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_recording_available_callback_from_hash.end_time).to eq(Time.parse('2022-06-16T13:17:07.160Z'))
      expect(conference_recording_available_callback_from_hash.duration).to eq('PT2M')
      expect(conference_recording_available_callback_from_hash.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(conference_recording_available_callback_from_hash.media_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media')
      expect(conference_recording_available_callback_from_hash.tag).to eq('custom tag')
      expect(conference_recording_available_callback_from_hash.status).to eq('complete')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_recording_available_callback_values.to_s).to eq('{:eventType=>"conferenceRecordingAvailable", :eventTime=>"2022-06-16T13:15:07.160Z", :conferenceId=>"conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :name=>"my-conference-name", :accountId=>"9900000", :recordingId=>"r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :channels=>1, :startTime=>"2022-06-16T13:15:07.160Z", :endTime=>"2022-06-16T13:17:07.160Z", :duration=>"PT2M", :fileFormat=>"wav", :mediaUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media", :tag=>"custom tag", :status=>"complete"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_recording_available_callback_default.eql?(Bandwidth::ConferenceRecordingAvailableCallback.new)).to be true
      expect(conference_recording_available_callback_default.eql?(conference_recording_available_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_recording_available_callback_values.to_body).to eq({
        eventType: 'conferenceRecordingAvailable',
        eventTime: '2022-06-16T13:15:07.160Z',
        conferenceId: 'conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        name: 'my-conference-name',
        accountId: '9900000',
        recordingId: 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:17:07.160Z',
        duration: 'PT2M',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        mediaUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/media',
        tag: 'custom tag',
        status: 'complete'
      })
    end
  end
end
