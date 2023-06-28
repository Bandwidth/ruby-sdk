# Integration Tests for Bandwidth::MFAApi
describe 'MFAApi Integration Tests' do
  before(:all) do
    WebMock.allow_net_connect!
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @mfa_api_instance = Bandwidth::MFAApi.new

    # mfa info
    @message = 'Your temporary {NAME} {SCOPE} code is: {CODE}'
    @digits = 6
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  # Messaging Authentication Code
  describe 'generate_messaging_code' do
    it 'generates messaging mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: @message,
        digits: @digits
      )

      data, status_code, headers = @mfa_api_instance.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagingCodeResponse)
      expect(data.message_id.length).to eq(29)
    end
  end

  # Voice Authentication Code
  describe 'generate_voice_code' do
    it 'generates voice mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: @message,
        digits: @digits
      )

      data, status_code, headers = @mfa_api_instance.generate_voice_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VoiceCodeResponse)
      expect(data.call_id.length).to eq(47)
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

      data, status_code, headers = @mfa_api_instance.verify_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VerifyCodeResponse)
      expect(data.valid).to be_instance_of(FalseClass)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: "not_an_application_id",
        message: @message,
        digits: @digits
      )

      expect {
        @mfa_api_instance.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 403 error' do
      Bandwidth.configure do |config|
        config.username = UNAUTHORIZED_USERNAME
        config.password = UNAUTHORIZED_PASSWORD
      end

      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: @message,
        digits: @digits
      )
      
      expect {
        @mfa_api_instance.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
