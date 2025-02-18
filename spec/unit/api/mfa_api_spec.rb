# Unit tests for Bandwidth::MFAApi
describe 'MFAApi' do
  let(:message) { 'Your temporary {NAME} {SCOPE} code is: {CODE}' }
  let(:digits) { 6 }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @mfa_api_instance = Bandwidth::MFAApi.new
  end

  describe 'test an instance of MFAApi' do
    it 'should create an instance of MFAApi' do
      expect(@mfa_api_instance).to be_instance_of(Bandwidth::MFAApi)
    end
  end

  # Messaging Authentication Code
  describe 'generate_messaging_code' do
    it 'generates messaging mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: message,
        digits: digits
      )

      data, status_code = @mfa_api_instance.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagingCodeResponse)
      expect(data.message_id.length).to eq(29)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @mfa_api_instance.generate_messaging_code(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing code_request' do
      expect {
        @mfa_api_instance.generate_messaging_code(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Voice Authentication Code
  describe 'generate_voice_code' do
    it 'generates voice mfa code' do
      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: message,
        digits: digits
      )

      data, status_code = @mfa_api_instance.generate_voice_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VoiceCodeResponse)
      expect(data.call_id.length).to eq(47)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @mfa_api_instance.generate_voice_code(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing code_request' do
      expect {
        @mfa_api_instance.generate_voice_code(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Verify Authentication Code
  describe 'verify_code' do
    it 'verifies mfa code' do
      req_schema = Bandwidth::VerifyCodeRequest.new(
        to: USER_NUMBER,
        scope: '2FA',
        expiration_time_in_minutes: 3,
        code: '12345'
      )

      data, status_code = @mfa_api_instance.verify_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VerifyCodeResponse)
      expect(data.valid).to be_one_of([true, false])
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @mfa_api_instance.verify_code(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing verify_code_request' do
      expect {
        @mfa_api_instance.verify_code(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
