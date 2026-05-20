# Unit tests for Bandwidth::MultiChannelChannelListRBMObject
describe Bandwidth::MultiChannelChannelListRBMObject do
  let(:multi_channel_channel_list_rbm_object_default) { Bandwidth::MultiChannelChannelListRBMObject.new({
    from: 'BANDWIDTH',
    application_id: 'baseline-app-id',
    channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
    content: Bandwidth::RbmMessageContentText.new({ text: 'baseline' })
  }) }
  let(:multi_channel_channel_list_rbm_object_values) { Bandwidth::MultiChannelChannelListRBMObject.new({
    from: 'BANDWIDTH',
    application_id: '93de2206-9669-4e07-948d-329f4b722ee2',
    channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
    content: Bandwidth::RbmMessageContentText.new({ text: 'Hello world' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MultiChannelChannelListRBMObject.acceptable_attributes).to eq(Bandwidth::MultiChannelChannelListRBMObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MultiChannelChannelListRBMObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MultiChannelChannelListRBMObject created by the build_from_hash method' do
      multi_channel_channel_list_rbm_object_from_hash = Bandwidth::MultiChannelChannelListRBMObject.build_from_hash({
        from: 'BANDWIDTH',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: { text: 'Hello world' }
      })
      expect(multi_channel_channel_list_rbm_object_from_hash).to be_instance_of(Bandwidth::MultiChannelChannelListRBMObject)
      expect(multi_channel_channel_list_rbm_object_from_hash.from).to eq('BANDWIDTH')
      expect(multi_channel_channel_list_rbm_object_from_hash.application_id).to eq('93de2206-9669-4e07-948d-329f4b722ee2')
      expect(multi_channel_channel_list_rbm_object_from_hash.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(multi_channel_channel_list_rbm_object_from_hash.content).to be_instance_of(Bandwidth::RbmMessageContentText)
      expect(multi_channel_channel_list_rbm_object_from_hash.content.text).to eq('Hello world')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(multi_channel_channel_list_rbm_object_values.to_s).to eq('{:from=>"BANDWIDTH", :applicationId=>"93de2206-9669-4e07-948d-329f4b722ee2", :channel=>"RBM", :content=>{:text=>"Hello world"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      multi_channel_channel_list_rbm_object_equal = Bandwidth::MultiChannelChannelListRBMObject.new({
        from: 'BANDWIDTH',
        application_id: 'baseline-app-id',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageContentText.new({ text: 'baseline' })
      })
      expect(multi_channel_channel_list_rbm_object_default.eql?(multi_channel_channel_list_rbm_object_equal)).to be true
      expect(multi_channel_channel_list_rbm_object_default.eql?(multi_channel_channel_list_rbm_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(multi_channel_channel_list_rbm_object_values.to_body).to eq({
        from: 'BANDWIDTH',
        applicationId: '93de2206-9669-4e07-948d-329f4b722ee2',
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: { text: 'Hello world' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#from=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new({ from: nil })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#application_id=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new({ from: 'BANDWIDTH', application_id: nil })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#channel=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new({ from: 'BANDWIDTH', application_id: 'a', channel: nil })
      }.to raise_error(ArgumentError, 'channel cannot be nil')
    end

    it '#content=' do
      expect {
        Bandwidth::MultiChannelChannelListRBMObject.new({ from: 'BANDWIDTH', application_id: 'a', channel: 'RBM', content: nil })
      }.to raise_error(ArgumentError, 'content cannot be nil')
    end
  end
end
