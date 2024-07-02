# Unit tests for Bandwidth::PhoneNumberLookupApi
describe 'PhoneNumberLookupApi' do
  let(:request_id) { '21e6d818-eaa9-4ca9-b1d8-d6085f5c79d4' } 

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @phone_number_lookup_api_instance = Bandwidth::PhoneNumberLookupApi.new
  end

  describe 'test an instance of PhoneNumberLookupApi' do
    it 'should create an instance of PhoneNumberLookupApi' do
      expect(@phone_number_lookup_api_instance).to be_instance_of(Bandwidth::PhoneNumberLookupApi)
    end
  end

  # Create Lookup
  describe 'create_lookup' do
    it 'creates a tn lookup request' do
      tn_body = Bandwidth::LookupRequest.new(
        tns: [BW_NUMBER]
      )
      data, status_code = @phone_number_lookup_api_instance.create_lookup_with_http_info(BW_ACCOUNT_ID, tn_body)

      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::CreateLookupResponse)
      expect(data.request_id.length).to eq(36)
      expect(data.status).to be_one_of(Bandwidth::LookupStatusEnum.all_vars)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @phone_number_lookup_api_instance.create_lookup(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing lookup_request' do
      expect {
        @phone_number_lookup_api_instance.create_lookup(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Lookup Status
  describe 'get_lookup_status' do
    it 'gets lookup status' do
      data, status_code = @phone_number_lookup_api_instance.get_lookup_status_with_http_info(
        BW_ACCOUNT_ID, request_id, { header_params: { 'Prefer' => 'example=lookupMultipleNumbersPartialCompleteExample' } })

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::LookupStatus)
      expect(data.request_id.length).to eq(36)
      expect(data.status).to be_one_of(Bandwidth::LookupStatusEnum.all_vars)
      expect(data.result).to be_instance_of(Array)
      expect(data.result[0]).to be_instance_of(Bandwidth::LookupResult)
      expect(data.result[0].response_code).to be_instance_of(Integer)
      expect(data.result[0].message).to be_instance_of(String)
      expect(data.result[0].e_164_format.length).to eq(12)
      expect(data.result[0].formatted.length).to eq(14)
      expect(data.result[0].country).to be_instance_of(String)
      expect(data.result[0].line_type).to be_instance_of(String)
      expect(data.result[0].line_provider).to be_instance_of(String)
      expect(data.result[0].mobile_country_code).to be_instance_of(String)
      expect(data.result[0].mobile_network_code).to be_instance_of(String)
      expect(data.failed_telephone_numbers).to be_instance_of(Array)
      expect(data.failed_telephone_numbers[0]).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @phone_number_lookup_api_instance.get_lookup_status(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing request_id' do
      expect {
        @phone_number_lookup_api_instance.get_lookup_status(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
