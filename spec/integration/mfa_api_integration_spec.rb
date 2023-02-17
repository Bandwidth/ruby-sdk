require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::MFAApi
describe 'MFAApi Integration Tests' do
  before(:all) do
    @api_instance_mfa = Bandwidth::MFAApi.new
  end

  before do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
  end

  # Messaging Authentication Code
  describe 'generate_messaging_code' do
    it 'generates messaging mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: {CODE}",
        digits: 6
      )
      mfa_response = @api_instance_mfa.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(mfa_response[CODE]).to eq(200)
      expect(mfa_response[DATA].message_id.length).to eq(29)
    end
  end

  # Voice Authentication Code
  describe 'generate_voice_code' do
    it 'generates voice mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: "Your temporary {NAME} {SCOPE} code is: {CODE}",
        digits: 6
      )
      mfa_response = @api_instance_mfa.generate_voice_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(mfa_response[CODE]).to eq(200)
      expect(mfa_response[DATA].call_id.length).to eq(47)
    end
  end

  # Verify Authentication Code
  describe 'verify_code' do
    it 'verifies mfa code' do
      req_schema = Bandwidth::VerifyCodeRequest.new(
        to: "+1000" + rand(1...10000000).to_s,
        scope: "2FA",
        expiration_time_in_minutes: 3,
        code: "12345"
      )
      mfa_response = @api_instance_mfa.verify_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(mfa_response[CODE]).to eq(200)
      expect(mfa_response[DATA].valid).to be_a(FalseClass)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    
  end

end
