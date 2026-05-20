# Unit tests for Bandwidth::ConferenceRecordingMetadata
describe Bandwidth::ConferenceRecordingMetadata do
  let(:conference_recording_metadata_default) { Bandwidth::ConferenceRecordingMetadata.new }
  let(:conference_recording_metadata_values) { Bandwidth::ConferenceRecordingMetadata.new({
    account_id: '9900000',
    conference_id: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
    name: 'weekly-stand-up',
    recording_id: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
    duration: 'PT13.67S',
    channels: 1,
    start_time: '2022-06-16T13:15:07.160Z',
    end_time: '2022-06-16T13:15:20.830Z',
    file_format: Bandwidth::FileFormatEnum::WAV,
    status: 'complete',
    media_url: 'https://example.com/recording.wav',
    recording_name: 'sample-recording'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ConferenceRecordingMetadata.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ConferenceRecordingMetadata.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ConferenceRecordingMetadata.acceptable_attributes).to eq(Bandwidth::ConferenceRecordingMetadata.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ConferenceRecordingMetadata.openapi_nullable).to eq(Set.new([:'media_url']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ConferenceRecordingMetadata created by the build_from_hash method' do
      conference_recording_metadata_from_hash = Bandwidth::ConferenceRecordingMetadata.build_from_hash({
        accountId: '9900000',
        conferenceId: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        name: 'weekly-stand-up',
        recordingId: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
        duration: 'PT13.67S',
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:15:20.830Z',
        fileFormat: 'wav',
        status: 'complete',
        mediaUrl: 'https://example.com/recording.wav',
        recordingName: 'sample-recording'
      })
      expect(conference_recording_metadata_from_hash).to be_instance_of(Bandwidth::ConferenceRecordingMetadata)
      expect(conference_recording_metadata_from_hash.account_id).to eq('9900000')
      expect(conference_recording_metadata_from_hash.conference_id).to eq('conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c')
      expect(conference_recording_metadata_from_hash.name).to eq('weekly-stand-up')
      expect(conference_recording_metadata_from_hash.recording_id).to eq('r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4')
      expect(conference_recording_metadata_from_hash.duration).to eq('PT13.67S')
      expect(conference_recording_metadata_from_hash.channels).to eq(1)
      expect(conference_recording_metadata_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(conference_recording_metadata_from_hash.end_time).to eq(Time.parse('2022-06-16T13:15:20.830Z'))
      expect(conference_recording_metadata_from_hash.file_format).to eq(Bandwidth::FileFormatEnum::WAV)
      expect(conference_recording_metadata_from_hash.status).to eq('complete')
      expect(conference_recording_metadata_from_hash.media_url).to eq('https://example.com/recording.wav')
      expect(conference_recording_metadata_from_hash.recording_name).to eq('sample-recording')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(conference_recording_metadata_values.to_s).to eq('{:accountId=>"9900000", :conferenceId=>"conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c", :name=>"weekly-stand-up", :recordingId=>"r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4", :duration=>"PT13.67S", :channels=>1, :startTime=>"2022-06-16T13:15:07.160Z", :endTime=>"2022-06-16T13:15:20.830Z", :fileFormat=>"wav", :status=>"complete", :mediaUrl=>"https://example.com/recording.wav", :recordingName=>"sample-recording"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(conference_recording_metadata_default.eql?(Bandwidth::ConferenceRecordingMetadata.new)).to be true
      expect(conference_recording_metadata_default.eql?(conference_recording_metadata_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(conference_recording_metadata_values.to_body).to eq({
        accountId: '9900000',
        conferenceId: 'conf-fe23a767-a75a5b77-23e8-4b5b-a973-1eb967d7d75c',
        name: 'weekly-stand-up',
        recordingId: 'r-fbe05094-9fd2b71d-a4e6-4f43-8c3e-5b04b1d8a4b4',
        duration: 'PT13.67S',
        channels: 1,
        startTime: '2022-06-16T13:15:07.160Z',
        endTime: '2022-06-16T13:15:20.830Z',
        fileFormat: Bandwidth::FileFormatEnum::WAV,
        status: 'complete',
        mediaUrl: 'https://example.com/recording.wav',
        recordingName: 'sample-recording'
      })
    end
  end
end
