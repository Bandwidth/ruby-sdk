# Unit tests for Bandwidth::MultiChannelApi
describe 'MultiChannelApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @multi_channel_api_instance = Bandwidth::MultiChannelApi.new

    @expiration_time = (Time.now + 60).round.to_datetime.rfc3339
  end

  describe 'test an instance of MultiChannelApi' do
    it 'should create an instance of MultiChannelApi' do
      expect(@multi_channel_api_instance).to be_instance_of(Bandwidth::MultiChannelApi)
    end
  end

  # Create Multi-Channel Message
  describe 'create_multi_channel_message' do
    it 'creates a multi channel message' do
      message_body = Bandwidth::MultiChannelChannelListObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
        content: Bandwidth::SmsMessageContent.new(
          text: 'Hello, this is a test message.',
        )
        # content: Bandwidth::MultiChannelChannelListObjectContent.build(
        #   text: 'Hello, this is a test message.',
        # )
      )
      multi_channel_message_request = Bandwidth::MultiChannelMessageRequest.new(
        to: USER_NUMBER,
        channel_list: [message_body],
        tag: 'tag',
        priority: 'high',
        expiration: @expiration_time,
      )

      data, status_code = @multi_channel_api_instance.create_multi_channel_message_with_http_info(BW_ACCOUNT_ID, multi_channel_message_request)

      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::CreateMultiChannelMessageResponse)
    end if false # skip because prism can't handle a oneOf with differing required fields

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @multi_channel_api_instance.create_multi_channel_message(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing message_request' do
      expect {
        @multi_channel_api_instance.create_multi_channel_message(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
