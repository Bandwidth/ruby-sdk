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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListSMSResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::SMS)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::SmsMessageContent)
      expect(data.data.channel_list.first.content.text).to be_instance_of(String)
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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListMMSResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::MMS)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::MmsMessageContent)
      expect(data.data.channel_list.first.content.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.media).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.media.first).to be_instance_of(Bandwidth::MmsMessageContentFile)
      expect(data.data.channel_list.first.content.media.first.file_url).to be_instance_of(String)
    end
  end

  # Create Multi-Channel RBM Message
  describe 'create_multi_channel_rbm_message' do
    it 'creates a multi channel rbm text message' do
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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListRBMResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::RbmMessageContentText)
      expect(data.data.channel_list.first.content.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.suggestions.first).to be_instance_of(Bandwidth::RbmActionDial)
      expect(data.data.channel_list.first.content.suggestions.first.type).to eq(Bandwidth::RbmActionTypeEnum::DIAL_PHONE)
      expect(data.data.channel_list.first.content.suggestions.first.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions.first.postback_data).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions.first.phone_number).to be_instance_of(String)
    end

    it 'creates a multi channel rbm media message' do
      message_body = Bandwidth::MultiChannelChannelListRBMObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageMedia.new(
          media: [
            Bandwidth::RbmMessageContentFile.new(
              file_url: 'https://example.com/image.jpg',
              thumbnail_url: 'https://example.com/thumbnail.jpg'
          )],
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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListRBMResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::RbmMessageMedia)
      expect(data.data.channel_list.first.content.media).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.media.first).to be_instance_of(Bandwidth::RbmMessageContentFile)
      expect(data.data.channel_list.first.content.media.first.file_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.media.first.thumbnail_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.suggestions.first).to be_instance_of(Bandwidth::RbmActionDial)
      expect(data.data.channel_list.first.content.suggestions.first.type).to eq(Bandwidth::RbmActionTypeEnum::DIAL_PHONE)
      expect(data.data.channel_list.first.content.suggestions.first.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions.first.postback_data).to be_instance_of(String)
      expect(data.data.channel_list.first.content.suggestions.first.phone_number).to be_instance_of(String)
    end

    it 'creates a multi channel rbm standalone rich card message' do
      message_body = Bandwidth::MultiChannelChannelListRBMObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmStandaloneCard.new(
          orientation: Bandwidth::StandaloneCardOrientationEnum::HORIZONTAL,
          thumbnail_image_alignment: Bandwidth::ThumbnailAlignmentEnum::LEFT,
          card_content: Bandwidth::RbmCardContent.new(
            title: 'Welcome to our service',
            description: 'We are glad to have you here.',
            media: Bandwidth::RbmCardContentMedia.new(
              file_url: 'https://image.com/image.png',
              thumbnail_url: 'https://image.com/thumbnail.png',
              height: Bandwidth::RbmMediaHeightEnum::TALL
            ),
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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListRBMResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::RbmStandaloneCard)
      expect(data.data.channel_list.first.content.orientation).to eq(Bandwidth::StandaloneCardOrientationEnum::HORIZONTAL)
      expect(data.data.channel_list.first.content.thumbnail_image_alignment).to eq(Bandwidth::ThumbnailAlignmentEnum::LEFT)
      expect(data.data.channel_list.first.content.card_content).to be_instance_of(Bandwidth::RbmCardContent)
      expect(data.data.channel_list.first.content.card_content.title).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.description).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.media).to be_instance_of(Bandwidth::RbmCardContentMedia)
      expect(data.data.channel_list.first.content.card_content.media.file_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.media.thumbnail_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.media.height).to eq(Bandwidth::RbmMediaHeightEnum::TALL)
      expect(data.data.channel_list.first.content.card_content.suggestions).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.card_content.suggestions.first).to be_instance_of(Bandwidth::RbmActionDial)
      expect(data.data.channel_list.first.content.card_content.suggestions.first.type).to eq(Bandwidth::RbmActionTypeEnum::DIAL_PHONE)
      expect(data.data.channel_list.first.content.card_content.suggestions.first.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.suggestions.first.postback_data).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_content.suggestions.first.phone_number).to be_instance_of(String)
    end

    it 'creates a multi channel rbm carousel rich card message' do
      message_body = Bandwidth::MultiChannelChannelListRBMObject.new(
        from: BW_NUMBER,
        application_id: BW_MESSAGING_APPLICATION_ID,
        channel: Bandwidth::MultiChannelMessageChannelEnum::RBM,
        content: Bandwidth::RbmMessageCarouselCard.new(
          card_width: Bandwidth::CardWidthEnum::MEDIUM,
          card_contents: [
            Bandwidth::RbmCardContent.new(
              title: 'Welcome to our service',
              description: 'We are glad to have you here.',
              media: Bandwidth::RbmCardContentMedia.new(
                file_url: 'https://image.com/image.png',
                thumbnail_url: 'https://image.com/thumbnail.png',
                height: Bandwidth::RbmMediaHeightEnum::TALL
              ),
              suggestions: [
                Bandwidth::RbmActionDial.new(
                  type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
                  text: 'Call Us',
                  postback_data: 'abcdefg12345678',
                  phone_number: BW_NUMBER
                )
              ]
            ),
            Bandwidth::RbmCardContent.new(
              title: 'Welcome to our service'
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
      expect(data.data.channel_list.first).to be_instance_of(Bandwidth::MultiChannelChannelListRBMResponseObject)
      expect(data.data.channel_list.first.from).to be_instance_of(String)
      expect(data.data.channel_list.first.application_id).to be_instance_of(String)
      expect(data.data.channel_list.first.channel).to eq(Bandwidth::MultiChannelMessageChannelEnum::RBM)
      expect(data.data.channel_list.first.content).to be_instance_of(Bandwidth::RbmMessageCarouselCard)
      expect(data.data.channel_list.first.content.card_width).to eq(Bandwidth::CardWidthEnum::MEDIUM)
      expect(data.data.channel_list.first.content.card_contents).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.card_contents.first).to be_instance_of(Bandwidth::RbmCardContent)
      expect(data.data.channel_list.first.content.card_contents.first.title).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.description).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.media).to be_instance_of(Bandwidth::RbmCardContentMedia)
      expect(data.data.channel_list.first.content.card_contents.first.media.file_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.media.thumbnail_url).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.media.height).to eq(Bandwidth::RbmMediaHeightEnum::TALL)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions).to be_instance_of(Array)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions.first).to be_instance_of(Bandwidth::RbmActionDial)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions.first.type).to eq(Bandwidth::RbmActionTypeEnum::DIAL_PHONE)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions.first.text).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions.first.postback_data).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents.first.suggestions.first.phone_number).to be_instance_of(String)
      expect(data.data.channel_list.first.content.card_contents[1]).to be_instance_of(Bandwidth::RbmCardContent)
      expect(data.data.channel_list.first.content.card_contents[1].title).to be_instance_of(String)
    end
  end
end
