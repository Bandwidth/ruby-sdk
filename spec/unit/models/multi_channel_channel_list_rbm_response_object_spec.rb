# Unit tests for Bandwidth::MultiChannelChannelListRBMResponseObject
describe Bandwidth::MultiChannelChannelListRBMResponseObject do
  let(:multi_channel_channel_list_rbm_response_object_default) { Bandwidth::MultiChannelChannelListRBMResponseObject.new({
    from: 'BANDWIDTH',
    application_id: 'baseline-app-id',
    channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
    content: Bandwidth::RbmMessageContentText.new({ text: 'baseline' }),
    owner: 'BANDWIDTH'
  }) }
  let(:multi_channel_channel_list_rbm_response_object_values) { Bandwidth::MultiChannelChannelListRBMResponseObject.new({
    from: 'BANDWIDTH',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
    content: Bandwidth::RbmMessageContentText.new({ text: 'Hello world' }),
    owner: 'BANDWIDTH'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListRBMResponseObject.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListRBMResponseObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListRBMResponseObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListRBMResponseObject created by the build_from_hash method' do
      multi_channel_channel_list_rbm_response_object_from_hash = Bandwidth::MultiChannelChannelListRBMResponseObject.build_from_hash({
        from: 'BANDWIDTH',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: { text: 'Hello world' },
        owner: 'BANDWIDTH'
      })
      expect(multi_channel_channel_list_rbm_response_object_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListRBMResponseObject)
      expect(multi_channel_channel_list_rbm_response_object_from_hash.from).to eq('BANDWIDTH')
      expect(multi_channel_channel_list_rbm_response_object_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(multi_channel_channel_list_rbm_response_object_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(multi_channel_channel_list_rbm_response_object_from_hash.content).to be_instance_of(Bandwidth::RbmMessageContentText)
      expect(multi_channel_channel_list_rbm_response_object_from_hash.content.text).to eq('Hello world')
      expect(multi_channel_channel_list_rbm_response_object_from_hash.owner).to eq('BANDWIDTH')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_rbm_response_object_values.to_s).to eq('{:from=>"BANDWIDTH", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"RBM", :content=>{:text=>"Hello world"}, :owner=>"BANDWIDTH"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_rbm_response_object_equal = Bandwidth::MultiChannelChannelListRBMResponseObject.new({
        from: 'BANDWIDTH',
        application_id: 'baseline-app-id',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageContentText.new({ text: 'baseline' }),
        owner: 'BANDWIDTH'
      })
      expect(multi_channel_channel_list_rbm_response_object_default.eql?(multi_channel_channel_list_rbm_response_object_equal)).to be true
      expect(multi_channel_channel_list_rbm_response_object_default.eql?(multi_channel_channel_list_rbm_response_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_rbm_response_object_values.to_body).to eq({
        from: 'BANDWIDTH',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: { text: 'Hello world' },
        owner: 'BANDWIDTH'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#from=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#application_id=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ from: 'BANDWIDTH', application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#channel=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ from: 'BANDWIDTH', application_id: 'a', channel: nil })
      }.to raise_error(ArgumentError, 'channel cannot be nil')
    end

    it '#content=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ from: 'BANDWIDTH', application_id: 'a', channel: 'RBM', content: nil })
      }.to raise_error(ArgumentError, 'content cannot be nil')
    end

    it '#owner=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMResponseObject.new({ from: 'BANDWIDTH', application_id: 'a', channel: 'RBM', content: 'c', owner: nil })
      }.to raise_error(ArgumentError, 'owner cannot be nil')
    end
  end
end
