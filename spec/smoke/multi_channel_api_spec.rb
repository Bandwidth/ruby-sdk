# Integration tests for Bandwidth::MultiChannelApi
describe 'MultiChannelApi' do
  before(:all) do
    config = Bandwidth::Configuration.new
    config.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    client = Bandwidth::ApiClient.new(config)
    @multi_channel_api_instance = Bandwidth::MultiChannelApi.new(client)

    @expiration_time = (Time.now + 60).round.to_datetime.rfc3339
  end

  # Create Multi-Channel SMS Message
  describe 'create_multi_channel_sms_message' do
    it 'creates a multi channel sms message' do
      message_body = Bandwidth::MultiChannelChannelListSMSObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::SMS,
        content: Bandwidth::SmsMessageContent.new(
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
      p data.data
      expect(data).to be_instance_of(Bandwidth::CreateMultiChannelMessageResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::MultiChannelMessageResponseData)
      expect(data.data.id).to be_instance_of(String)
      expect(data.data.time).to be_instance_of(Time)
      expect(data.data.direction).to be_one_of(Bandwidth::MessageDirectionEnum.all_vars)
      expect(data.data.to).to be_instance_of(Array)
      expect(data.data.tag).to be_instance_of(String)
      expect(data.data.priority).to be_one_of(Bandwidth::PriorityEnum.all_vars)
      expect(data.data.expiration).to be_instance_of(Time)
      expect(data.data.channel_list).to be_instance_of(Array)
      # add more assertions once SDK supports discriminators
    end
  end

  # Create Multi-Channel MMS Message
  describe 'create_multi_channel_mms_message' do
    it 'creates a multi channel mms message' do
      message_body = Bandwidth::MultiChannelChannelListMMSObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::MMS,
        content: Bandwidth::MmsMessageContent.new(
          media: [
            Bandwidth::MmsMessageContentFile.new(
              file_url: 'https://example.com/image.jpg'
            )
          ],
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
      p data.data
      expect(data).to be_instance_of(Bandwidth::CreateMultiChannelMessageResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::MultiChannelMessageResponseData)
      expect(data.data.id).to be_instance_of(String)
      expect(data.data.time).to be_instance_of(Time)
      expect(data.data.direction).to be_one_of(Bandwidth::MessageDirectionEnum.all_vars)
      expect(data.data.to).to be_instance_of(Array)
      expect(data.data.tag).to be_instance_of(String)
      expect(data.data.priority).to be_one_of(Bandwidth::PriorityEnum.all_vars)
      expect(data.data.expiration).to be_instance_of(Time)
      expect(data.data.channel_list).to be_instance_of(Array)
      # add more assertions once SDK supports discriminators
    end
  end

  # Create Multi-Channel RBM Message
  describe 'create_multi_channel_rbm_message' do
    it 'creates a multi channel rbm message' do
      message_body = Bandwidth::MultiChannelChannelListRBMObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageContentText.new(
          text: 'Hello, this is a test message.',
          suggestions: [
            Bandwidth::RbmActionDial.new(
              type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
              text: 'Call Us',
              postback_data: 'abcdefg12345678',
              phone_number: BW_NUMBER
            )
          ]
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
      p data.data
      expect(data).to be_instance_of(Bandwidth::CreateMultiChannelMessageResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::MultiChannelMessageResponseData)
      expect(data.data.id).to be_instance_of(String)
      expect(data.data.time).to be_instance_of(Time)
      expect(data.data.direction).to be_one_of(Bandwidth::MessageDirectionEnum.all_vars)
      expect(data.data.to).to be_instance_of(Array)
      expect(data.data.tag).to be_instance_of(String)
      expect(data.data.priority).to be_one_of(Bandwidth::PriorityEnum.all_vars)
      expect(data.data.expiration).to be_instance_of(Time)
      expect(data.data.channel_list).to be_instance_of(Array)
      # add more assertions once SDK supports discriminators
    end
  end
end
