# Integration tests for Bandwidth::PhoneNumberLookupApi
describe 'PhoneNumberLookupApi' do
  let(:phone_numbers) { [BW_NUMBER, USER_NUMBER] }

  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance = Bandwidth::PhoneNumberLookupApi.new
  end
  describe 'test an instance of PhoneNumberLookupApi' do
    it 'should create an instance of PhoneNumberLookupApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::PhoneNumberLookupApi)
    end
  end

  # Create Asynchronous Bulk Number Lookup
  describe 'create_get_async_bulk_lookup test' do
    it 'should work' do
      request = Bandwidth::AsyncLookupRequest.new(
        phone_numbers: phone_numbers,
      )

      create_data, create_status_code = @api_instance.create_async_bulk_lookup_with_http_info(BW_ACCOUNT_ID, request)

      expect(create_status_code).to eq(202)
      expect(create_data).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponse)
      expect(create_data.links[0]).to be_instance_of(Bandwidth::LinkSchema)
      expect(create_data.links[0].rel).to be_instance_of(String)
      expect(create_data.links[0].href).to be_instance_of(String)
      expect(create_data.links[0].method).to be_instance_of(String)
      expect(create_data.data).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponseData)
      expect(create_data.data.request_id).to be_instance_of(String)
      expect(create_data.data.status).to be_one_of(Bandwidth::InProgressLookupStatusEnum.all_vars)
      expect(create_data.errors).to be_instance_of(Array)

      request_id = create_data.data.request_id
      sleep(30)

      get_data, get_status_code = @api_instance.get_async_bulk_lookup_with_http_info(BW_ACCOUNT_ID, request_id)
      expect(get_status_code).to equal_to(200)
      expect(get_data).to be_instance_of(Bandwidth::GetAsyncBulkLookupResponse)
      expect(get_data.links[0]).to be_instance_of(Bandwidth::LinkSchema)
      expect(get_data.links[0].rel).to be_instance_of(String)
      expect(get_data.links[0].href).to be_instance_of(String)
      expect(get_data.links[0].method).to be_instance_of(String)
      expect(get_data.data.request_id).to eq(request_id)
      expect(get_data.data.status).to eq(Bandwidth::InProgressLookupStatusEnum::COMPLETE)
      expect(get_data.data.results).to be_instance_of(Array)
      expect(get_data.data.results[0]).to be_instance_of(Bandwidth::LookupResult)
      expect(get_data.data.results[0].phone_number).to be_instance_of(String)
      expect(get_data.data.results[0].line_type).to be_one_of(Bandwidth::LineTypeEnum.all_vars)
      expect(get_data.data.results[0].messaging_provider).to be_instance_of(String)
      expect(get_data.data.results[0].voice_provider).to be_instance_of(String)
      expect(get_data.data.results[0].country_code_a3).to be_instance_of(String)
    end
  end

  # Create Synchronous Number Lookup
  describe 'create_sync_lookup test' do
    it 'should work' do
      request = Bandwidth::SyncLookupRequest.new(
        phone_numbers: phone_numbers,
      )

      data, status_code = @api_instance.create_sync_lookup_with_http_info(BW_ACCOUNT_ID, request)

      expect(status_code).to equal_to(200)
      expect(data).to be_instance_of(Bandwidth::CreateSyncLookupResponse)
      expect(data.links[0]).to be_instance_of(Bandwidth::LinkSchema)
      expect(data.links[0].rel).to be_instance_of(String)
      expect(data.links[0].href).to be_instance_of(String)
      expect(data.links[0].method).to be_instance_of(String)
      expect(data.data.request_id).to be_instance_of(String)
      expect(data.data.status).to eq(Bandwidth::CompletedLookupStatusEnum::COMPLETE)
      expect(data.data.results).to be_instance_of(Array)
      expect(data.data.results[0]).to be_instance_of(Bandwidth::LookupResult)
      expect(data.data.results[0].phone_number).to be_instance_of(String)
      expect(data.data.results[0].line_type).to be_one_of(Bandwidth::LineTypeEnum.all_vars)
      expect(data.data.results[0].messaging_provider).to be_instance_of(String)
      expect(data.data.results[0].voice_provider).to be_instance_of(String)
      expect(data.data.results[0].country_code_a3).to be_instance_of(String)
    end
  end
end
