=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.6.0

=end


require 'json'

# Unit tests for Bandwidth::MFAApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'MFAApi' do
  before do
    # run before each test
    @api_instance = Bandwidth::MFAApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MFAApi' do
    it 'should create an instance of MFAApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::MFAApi)
    end
  end

  # unit tests for generate_messaging_code
  # Messaging Authentication Code
  # Send an MFA code via text message (SMS).
  # @param account_id Your Bandwidth Account ID.
  # @param code_request MFA code request body.
  # @param [Hash] opts the optional parameters
  # @return [MessagingCodeResponse]
  describe 'generate_messaging_code test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for generate_voice_code
  # Voice Authentication Code
  # Send an MFA Code via a phone call.
  # @param account_id Your Bandwidth Account ID.
  # @param code_request MFA code request body.
  # @param [Hash] opts the optional parameters
  # @return [VoiceCodeResponse]
  describe 'generate_voice_code test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for verify_code
  # Verify Authentication Code
  # Verify a previously sent MFA code.
  # @param account_id Your Bandwidth Account ID.
  # @param verify_code_request MFA code verify request body.
  # @param [Hash] opts the optional parameters
  # @return [VerifyCodeResponse]
  describe 'verify_code test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
