# Unit tests for Bandwidth::MFAApi
describe 'MFAApi' do
  # mfa info
  let(:message) { 'Your temporary {NAME} {SCOPE} code is: {CODE}' }
  let(:message_id) { '1687965513364hx26ky4mpkll3m5a' }
  let(:call_id) { 'c-28bba681-cffc7d67-904e-42c8-85c5-b5589ea583b4' }
  let(:digits) { 6 }

  # stubs
  let(:generate_messaging_code_body_stub) { "{\"messageId\": \"#{message_id}\"}" }
  let(:generate_messaging_code_headers_stub) { { 'content-type' => 'application/json', 'content-length' => "#{generate_messaging_code_body_stub.length}" } }
  let(:generate_voice_code_body_stub) { "{\"callId\": \"#{call_id}\"}" }
  let(:generate_voice_code_headers_stub) { { 'content-type' => 'application/json', 'content-length' => "#{generate_voice_code_body_stub.length}" } }
  let(:verify_code_body_stub) { '{"valid": false}' }
  let(:verify_code_headers_stub) { { 'content-type' => 'application/json', 'content-length' => "#{verify_code_body_stub.length}" } }
  
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
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
      stub_request(:post, "https://mfa.bandwidth.com/api/v1/accounts/#{BW_ACCOUNT_ID}/code/messaging").
      to_return(status: 200, headers: generate_messaging_code_headers_stub, body: generate_messaging_code_body_stub)

      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        message: message,
        digits: digits
      )

      data, status_code, headers = @mfa_api_instance.generate_messaging_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagingCodeResponse)
      expect(data.message_id).to eq(message_id)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @mfa_api_instance.generate_messaging_code(nil, {})
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
      stub_request(:post, "https://mfa.bandwidth.com/api/v1/accounts/#{BW_ACCOUNT_ID}/code/voice").
      to_return(status: 200, headers: generate_voice_code_headers_stub, body: generate_voice_code_body_stub)

      req_schema = Bandwidth::CodeRequest.new(
        to: USER_NUMBER,
        from: BW_NUMBER,
        application_id: BW_VOICE_APPLICATION_ID,
        message: message,
        digits: digits
      )

      data, status_code, headers = @mfa_api_instance.generate_voice_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VoiceCodeResponse)
      expect(data.call_id).to eq(call_id)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @mfa_api_instance.generate_voice_code(nil, {})
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
      stub_request(:post, "https://mfa.bandwidth.com/api/v1/accounts/#{BW_ACCOUNT_ID}/code/verify").
      to_return(status: 200, headers: verify_code_headers_stub, body: verify_code_body_stub)

      req_schema = Bandwidth::VerifyCodeRequest.new(
        to: '+1000' + rand(1...10000000).to_s,
        scope: '2FA',
        expiration_time_in_minutes: 3,
        code: '12345'
      )

      data, status_code, headers = @mfa_api_instance.verify_code_with_http_info(BW_ACCOUNT_ID, req_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::VerifyCodeResponse)
      expect(data.valid).to be false
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @mfa_api_instance.verify_code(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing cvarify_ode_request' do
      expect {
        @mfa_api_instance.verify_code(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
