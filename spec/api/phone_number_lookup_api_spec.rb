# Unit tests for Bandwidth::PhoneNumberLookupApi
describe 'PhoneNumberLookupApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
    end
    @phone_number_lookup_api_instance = Bandwidth::PhoneNumberLookupApi.new

    # lookup info
    @request_id = '21e6d818-eaa9-4ca9-b1d8-d6085f5c79d4'
    @status_in_progress = Bandwidth::LookupStatusEnum::IN_PROGRESS
    @status_complete = Bandwidth::LookupStatusEnum::COMPLETE
    @response_code = 0
    @message = 'NOERROR'
    @formatted = "(#{BW_NUMBER[2..4]}) #{BW_NUMBER[5..7]}-#{BW_NUMBER[7..-1]}"
    @country = 'US'
    @line_type = 'Mobile'
    @line_provider = 'AdHoc P2P - Bandwidth - SVR'

    # stubs
    @create_lookup_headers_stub = { 'content-type' => 'application/json' }
    @create_lookup_body_stub = "{\"requestId\":\"#{@request_id}\",\"status\":\"#{@status_in_progress}\"}"
    @get_lookup_status_headers_stub = { 'content-type' => 'application/json' }
    @get_lookup_status_body_stub = "{\"requestId\":\"#{@request_id}\",\"status\":\"#{@status_complete}\",\"result\":[{\"Response Code\":#{@response_code},\"Message\":\"#{@message}\",\"E.164 Format\":\"#{BW_NUMBER}\",\"Formatted\":\"#{@formatted}\",\"Country\":\"#{@country}\",\"Line Type\":\"#{@line_type}\",\"Line Provider\":\"#{@line_provider}\"}]}"
  end

  describe 'test an instance of PhoneNumberLookupApi' do
    it 'should create an instance of PhoneNumberLookupApi' do
      expect(@phone_number_lookup_api_instance).to be_instance_of(Bandwidth::PhoneNumberLookupApi)
    end
  end

  # Create Lookup
  describe 'create_lookup' do
    it 'creates a tn lookup request' do
      stub_request(:post, "https://numbers.bandwidth.com/api/v1/accounts/#{BW_ACCOUNT_ID}/tnlookup").
      to_return(status: 202, headers: @create_lookup_headers_stub, body: @create_lookup_body_stub)

      tn_body = Bandwidth::LookupRequest.new(
        tns: [BW_NUMBER]
      )
      data, status_code, headers = @phone_number_lookup_api_instance.create_lookup_with_http_info(BW_ACCOUNT_ID, tn_body)

      expect(status_code).to eq(202)
      expect(headers).to eq(@create_lookup_headers_stub)
      expect(data).to be_instance_of(Bandwidth::CreateLookupResponse)
      expect(data.request_id).to eq(@request_id)
      expect(data.status).to eq(@status_in_progress)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @phone_number_lookup_api_instance.create_lookup(nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing lookup_request' do
      expect {
        @phone_number_lookup_api_instance.create_lookup(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Lookup Status
  describe 'get_lookup_status' do
    it 'gets lookup status' do
      stub_request(:get, "https://numbers.bandwidth.com/api/v1/accounts/#{BW_ACCOUNT_ID}/tnlookup/#{@request_id}").
      to_return(status: 200, headers: @get_lookup_status_headers_stub, body: @get_lookup_status_body_stub)

      data, status_code, headers = @phone_number_lookup_api_instance.get_lookup_status_with_http_info(BW_ACCOUNT_ID, @request_id)

      expect(status_code).to eq(200)
      expect(headers).to eq(@get_lookup_status_headers_stub)
      expect(data).to be_instance_of(Bandwidth::LookupStatus)
      expect(data.request_id).to eq(@request_id)
      expect(data.status).to eq(@status_complete)
      expect(data.result).to be_instance_of(Array)
      expect(data.result[0]).to be_instance_of(Bandwidth::LookupResult)
      expect(data.result[0].response_code).to eq(@response_code)
      expect(data.result[0].message).to eq(@message)
      expect(data.result[0].e_164_format).to eq(BW_NUMBER)
      expect(data.result[0].formatted).to eq(@formatted)
      expect(data.result[0].country).to eq(@country)
      expect(data.result[0].line_type).to eq(@line_type)
      expect(data.result[0].line_provider).to eq(@line_provider)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @phone_number_lookup_api_instance.get_lookup_status(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing request_id' do
      expect {
        @phone_number_lookup_api_instance.get_lookup_status(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

end
