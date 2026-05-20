# Unit tests for Bandwidth::CreateSyncLookupResponseData
describe Bandwidth::CreateSyncLookupResponseData do
  let(:create_sync_lookup_response_data_default) { Bandwidth::CreateSyncLookupResponseData.new }
  let(:create_sync_lookup_response_data_values) { Bandwidth::CreateSyncLookupResponseData.new({
    request_id: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
    status: Bandwidth::CompletedLookupStatusEnum::COMPLETE,
    results: [Bandwidth::LookupResult.new({ phone_number: '+19195551234' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateSyncLookupResponseData.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateSyncLookupResponseData.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateSyncLookupResponseData.acceptable_attributes).to eq(Bandwidth::CreateSyncLookupResponseData.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateSyncLookupResponseData.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateSyncLookupResponseData created by the build_from_hash method' do
      create_sync_lookup_response_data_from_hash = Bandwidth::CreateSyncLookupResponseData.build_from_hash({
        requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
        status: 'COMPLETE',
        results: [{ phoneNumber: '+19195551234' }]
      })
      expect(create_sync_lookup_response_data_from_hash).to be_instance_of(Bandwidth::CreateSyncLookupResponseData)
      expect(create_sync_lookup_response_data_from_hash.request_id).to eq('00b97c1b-d8b4-4a32-ad14-7d09ce04acb6')
      expect(create_sync_lookup_response_data_from_hash.status).to eq(Bandwidth::CompletedLookupStatusEnum::COMPLETE)
      expect(create_sync_lookup_response_data_from_hash.results.first).to be_instance_of(Bandwidth::LookupResult)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_sync_lookup_response_data_values.to_s).to eq('{:requestId=>"00b97c1b-d8b4-4a32-ad14-7d09ce04acb6", :status=>"COMPLETE", :results=>[{:phoneNumber=>"+19195551234"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(create_sync_lookup_response_data_default.eql?(Bandwidth::CreateSyncLookupResponseData.new)).to be true
      expect(create_sync_lookup_response_data_default.eql?(create_sync_lookup_response_data_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_sync_lookup_response_data_values.to_body).to eq({
        requestId: '00b97c1b-d8b4-4a32-ad14-7d09ce04acb6',
        status: Bandwidth::CompletedLookupStatusEnum::COMPLETE,
        results: [{ phoneNumber: '+19195551234' }]
      })
    end
  end
end
