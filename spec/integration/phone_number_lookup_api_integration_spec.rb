
require 'json'

# Integration Tests for Bandwidth::PhoneNumberLookupApi
describe 'PhoneNumberLookupApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_tnlookup = Bandwidth::PhoneNumberLookupApi.new
    $lookup_request_id = ""
  end

  # Create Lookup
  describe 'create_lookup' do
    it 'creates a tn lookup request' do
      tn_body = Bandwidth::LookupRequest.new(
        tns: [BW_NUMBER]
      )
      response = @api_instance_tnlookup.create_lookup_with_http_info(BW_ACCOUNT_ID, tn_body)

      expect(response[CODE]).to eq(202)
      expect(response[DATA]).to be_instance_of(Bandwidth::CreateLookupResponse)
      expect(response[DATA].request_id.length).to eq(36)
      expect(response[DATA].status).to be_instance_of(String)

      $lookup_request_id  = response[DATA].request_id
      sleep(1)
    end
  end

  # Get Lookup Status
  describe 'get_lookup_status' do
    it 'gets lookup status' do
      response = @api_instance_tnlookup.get_lookup_status_with_http_info(BW_ACCOUNT_ID, $lookup_request_id)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::LookupStatus)
      expect(response[DATA].request_id).to eq($lookup_request_id)
      expect(response[DATA].status).to be_instance_of(String)
      expect(response[DATA].result[0].response_code).to be_instance_of(Integer)
      expect(response[DATA].result[0].e_164_format).to eq(BW_NUMBER)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      tn_body_bad = Bandwidth::LookupRequest.new(
        tns: ["+1invalid"]
      )

      expect {
        @api_instance_tnlookup.create_lookup_with_http_info(BW_ACCOUNT_ID, tn_body_bad)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end
    
    it 'causes a 404 error' do
      req_id_dne = "12345678-abcd-cdef-9876-12345678abcd"

      expect {
        @api_instance_tnlookup.get_lookup_status_with_http_info(BW_ACCOUNT_ID, req_id_dne)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = 'bad_username'
        config.password = 'bad_password'
      end

      tn_body = Bandwidth::LookupRequest.new(
        tns: [BW_NUMBER]
      )

      expect {
        @api_instance_tnlookup.create_lookup_with_http_info(BW_ACCOUNT_ID, tn_body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end
  end

end if false
