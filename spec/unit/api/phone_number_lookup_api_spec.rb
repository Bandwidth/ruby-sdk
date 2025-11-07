# Unit tests for Bandwidth::PhoneNumberLookupApi
describe 'PhoneNumberLookupApi' do
  let(:phone_numbers) { [BW_NUMBER, USER_NUMBER] }
  let(:request_id) { '123e4567-e89b-12d3-a456-426614174000' }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @api_instance = Bandwidth::PhoneNumberLookupApi.new
  end
  describe 'test an instance of PhoneNumberLookupApi' do
    it 'should create an instance of PhoneNumberLookupApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::PhoneNumberLookupApi)
    end
  end

  # Create Asynchronous Bulk Number Lookup
  describe 'create_async_bulk_lookup test' do
    it 'should work' do
      request = Bandwidth::AsyncLookupRequest.new(
        phone_numbers: phone_numbers,
      )

      data, status_code = @api_instance.create_async_bulk_lookup_with_http_info(BW_ACCOUNT_ID, request)

      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponse)
      expect(data.links[0]).to be_instance_of(Bandwidth::LinkSchema)
      expect(data.links[0].rel).to be_instance_of(String)
      expect(data.links[0].href).to be_instance_of(String)
      expect(data.links[0].method).to be_instance_of(String)
      expect(data.data).to be_instance_of(Bandwidth::CreateAsyncBulkLookupResponseData)
      expect(data.data.request_id).to be_instance_of(String)
      expect(data.data.status).to eq(Bandwidth::InProgressLookupStatusEnum::IN_PROGRESS)
      expect(data.errors).to be_instance_of(Array)
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
      expect(data.data.results[0].line_type).to eq(Bandwidth::LineTypeEnum::MOBILE)
      expect(data.data.results[0].messaging_provider).to be_instance_of(String)
      expect(data.data.results[0].voice_provider).to be_instance_of(String)
      expect(data.data.results[0].country_code_a3).to be_instance_of(String)
      expect(data.data.results[0].latest_message_delivery_status).to eq(Bandwidth::LatestMessageDeliveryStatusEnum::ACTIVE)
      expect(data.data.results[0].initial_message_delivery_status_date).to be_instance_of(Date)
      expect(data.data.results[0].latest_message_delivery_status_date).to be_instance_of(Date)
      expect(data.errors).to be_instance_of(Array)
    end
  end

  # Get Asynchronous Bulk Number Lookup
  describe 'get_async_bulk_lookup test' do
    it 'should work' do
      data, status_code = @api_instance.get_async_bulk_lookup_with_http_info(BW_ACCOUNT_ID, request_id)

      expect(status_code).to equal_to(200)
      expect(data).to be_instance_of(Bandwidth::GetAsyncBulkLookupResponse)
      expect(data.links[0]).to be_instance_of(Bandwidth::LinkSchema)
      expect(data.links[0].rel).to be_instance_of(String)
      expect(data.links[0].href).to be_instance_of(String)
      expect(data.links[0].method).to be_instance_of(String)
      expect(data.data.request_id).to be_instance_of(String)
      expect(data.data.status).to eq(Bandwidth::InProgressLookupStatusEnum::COMPLETE)
      expect(data.data.results).to be_instance_of(Array)
      expect(data.data.results[0]).to be_instance_of(Bandwidth::LookupResult)
      expect(data.data.results[0].phone_number).to be_instance_of(String)
      expect(data.data.results[0].line_type).to eq(Bandwidth::LineTypeEnum::MOBILE)
      expect(data.data.results[0].messaging_provider).to be_instance_of(String)
      expect(data.data.results[0].voice_provider).to be_instance_of(String)
      expect(data.data.results[0].country_code_a3).to be_instance_of(String)
      expect(data.data.results[0].latest_message_delivery_status).to eq(Bandwidth::LatestMessageDeliveryStatusEnum::ACTIVE)
      expect(data.data.results[0].initial_message_delivery_status_date).to be_instance_of(Date)
      expect(data.data.results[0].latest_message_delivery_status_date).to be_instance_of(Date)
      expect(data.errors).to be_instance_of(Array)
    end
  end
end
