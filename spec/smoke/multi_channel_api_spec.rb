# Unit tests for Bandwidth::MultiChannelApi
describe 'MultiChannelApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @multi_channel_api_instance = Bandwidth::MultiChannelApi.new

    @expiration_time = (Time.now + 60).round.to_datetime.rfc3339
  end

  # Create Multi-Channel Message
  describe 'create_multi_channel_message' do
    it 'creates a multi channel message' do
      message_body = Bandwidth::MultiChannelChannelListObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageContentText.new(
          text: 'Hello, this is a test message.',
        )
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
    end

    
  end
end
