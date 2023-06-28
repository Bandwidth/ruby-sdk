# Unit tests for Bandwidth::MessagesApi
describe 'MessagesApi' do
  before do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.debugging = true
    end
    @messaging_api_instance = Bandwidth::MessagesApi.new

    # message info
    @mms_id = '1687899647358cu2t57tczmbzcu2s'
    @sms_id = '1687899647634s46mhdt7ifq5hnjl'
    @time = '2023-06-27T21:00:47.358063Z'
    @segment_count = 1
    @direction = Bandwidth::MessageDirectionEnum::OUT
    @text = 'test text'
    @media_url = 'https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg'
    @tag = 'test tag'
    @priority = Bandwidth::PriorityEnum::HIGH
    @expiration_time = (Time.now + 60).round.to_datetime.rfc3339
    @total_count = 2
    @next_page_token = 'YWZ0ZXI9MTAwJmxpbWl0PTEwMA'
    @list_message_direction = Bandwidth::ListMessageDirectionEnum::OUTBOUND
    @list_message_status = Bandwidth::MessageStatusEnum::SENT
    @list_message_type_mms = Bandwidth::MessageTypeEnum::MMS
    @list_message_type_sms = Bandwidth::MessageTypeEnum::SMS
    @mms_length = 45151
    @attachment_count = 1
    @recipient_count = 1
    @mms_error_code = 0
    @sms_error_code = 4720
    @carrier_name = 'Other'
    @next_page_url = "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/messages?messageDirection=#{@list_message_direction}&sourceTn=%2B#{BW_NUMBER[1..-1]}&pageToken=#{@next_page_token}"

    # stubs
    @create_message_mms_headers_stub = { "content-type" => "application/json" }
    @create_message_mms_body_stub = "{\"id\":\"#{@mms_id}\",\"owner\":\"#{BW_NUMBER}\",\"applicationId\":\"#{BW_MESSAGING_APPLICATION_ID}\",\"time\":\"#{@time}\",\"segmentCount\":#{@segment_count},\"direction\":\"#{@direction}\",\"to\":[\"#{USER_NUMBER}\"],\"from\":\"#{BW_NUMBER}\",\"text\":\"#{@text}\",\"media\":[\"#{@media_url}\"],\"tag\":\"#{@tag}\"}"
    @create_message_sms_headers_stub = { "content-type" => "application/json" }
    @create_message_sms_body_stub = "{\"id\":\"#{@sms_id}\",\"owner\":\"#{BW_NUMBER}\",\"applicationId\":\"#{BW_MESSAGING_APPLICATION_ID}\",\"time\":\"#{@time}\",\"segmentCount\":#{@segment_count},\"direction\":\"#{@direction}\",\"to\":[\"#{USER_NUMBER}\"],\"from\":\"#{BW_NUMBER}\",\"text\":\"#{@text}\",\"tag\":\"#{@tag}\",\"priority\":\"#{@priority}\",\"expiration\":\"#{@expiration_time}\"}"
    @list_messages_body_stub = "{\"totalCount\":#{@total_count},\"pageInfo\":{\"nextPage\":\"#{@next_page_url}\",\"nextPageToken\":\"#{@next_page_token}\"},\"messages\":[{\"messageId\":\"#{@mms_id}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"sourceTn\":\"#{BW_NUMBER}\",\"destinationTn\":\"#{USER_NUMBER}\",\"messageStatus\":\"#{@list_message_status}\",\"messageDirection\":\"#{@list_message_direction}\",\"messageType\":\"#{@list_message_type_mms}\",\"segmentCount\":#{@segment_count},\"messageLength\":#{@mms_length},\"messageSize\":#{@mms_length},\"attachmentCount\":#{@attachment_count},\"recipientCount\":#{@recipient_count},\"errorCode\":#{@mms_error_code},\"carrierName\":null,\"campaignClass\":null,\"campaignId\":null,\"receiveTime\":\"#{@time}\"},{\"messageId\":\"#{@sms_id}\",\"accountId\":\"#{BW_ACCOUNT_ID}\",\"sourceTn\":\"#{BW_NUMBER}\",\"destinationTn\":\"#{USER_NUMBER}\",\"messageStatus\":\"#{@list_message_status}\",\"messageDirection\":\"#{@list_message_direction}\",\"messageType\":\"#{@list_message_type_sms}\",\"segmentCount\":#{@segment_count},\"messageLength\":#{@text.length},\"messageSize\":null,\"attachmentCount\":null,\"recipientCount\":null,\"errorCode\":#{@sms_error_code},\"carrierName\":\"#{@carrier_name}\",\"campaignClass\":null,\"campaignId\":null,\"receiveTime\":\"#{@time}\"}]}"
    @list_messages_headers_stub = { "content-type" => "application/json", "content-length" => "#{@list_messages_body_stub.length}" }
  end

  describe 'test an instance of MessagesApi' do
    it 'should create an instance of MessagesApi' do
      expect(@messaging_api_instance).to be_instance_of(Bandwidth::MessagesApi)
    end
  end

  # Create Message
  describe 'create_message' do
    it 'creates an mms message' do
      stub_request(:post, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/messages").
      to_return(status: 202, headers: @create_message_mms_headers_stub, body: @create_message_mms_body_stub)

      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: @text,
        media: [@media_url],
        tag: @tag
      )

      data, status_code, headers = @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, message_request)

      expect(status_code).to eq(202)
      expect(headers).to eq(@create_message_mms_headers_stub)
      expect(data).to be_instance_of(Bandwidth::Message)
      expect(data.id).to eq(@mms_id)
      expect(data.owner).to eq(BW_NUMBER)
      expect(data.application_id).to eq(BW_MESSAGING_APPLICATION_ID)
      expect(data.time).to eq(Time.parse(@time))
      expect(data.segment_count).to eq(@segment_count)
      expect(data.direction).to eq(@direction)
      expect(data.to).to eq([USER_NUMBER])
      expect(data.from).to eq(BW_NUMBER)
      expect(data.text).to eq(@text)
      expect(data.media).to eq([@media_url])
      expect(data.tag).to eq(@tag)
    end

    it 'creates an sms message' do
      stub_request(:post, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/messages").
      to_return(status: 202, headers: @create_message_sms_headers_stub, body: @create_message_sms_body_stub)

      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: @text,
        tag: @tag,
        priority: @priority,
        expiration: @expiration_time
      )
  
      data, status_code, headers = @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, message_request)
  
      expect(status_code).to eq(202)
      expect(headers).to eq(@create_message_sms_headers_stub)
      expect(data).to be_instance_of(Bandwidth::Message)
      expect(data.id).to eq(@sms_id)
      expect(data.owner).to eq(BW_NUMBER)
      expect(data.application_id).to eq(BW_MESSAGING_APPLICATION_ID)
      expect(data.time).to eq(Time.parse(@time))
      expect(data.segment_count).to eq(@segment_count)
      expect(data.direction).to eq(@direction)
      expect(data.to).to eq([USER_NUMBER])
      expect(data.from).to eq(BW_NUMBER)
      expect(data.text).to eq(@text)
      expect(data.tag).to eq(@tag)
      expect(data.priority).to eq(@priority)
      expect(data.expiration).to eq(Time.parse(@expiration_time))
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @messaging_api_instance.create_message(nil, {})
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing message_request' do
      expect {
        @messaging_api_instance.create_message(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # List Messages
  describe 'list_messages' do
    it 'lists messages' do
      stub_request(:get, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/messages?messageDirection=#{@list_message_direction}&sourceTn=%2B#{BW_NUMBER[1..-1]}").
      to_return(status: 200, headers: @list_messages_headers_stub, body: @list_messages_body_stub)

      get_opts = {
        :source_tn => BW_NUMBER,
        :message_direction => @list_message_direction
      }

      data, status_code, headers = @messaging_api_instance.list_messages_with_http_info(BW_ACCOUNT_ID, get_opts)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagesList)
      expect(data.total_count).to eq(@total_count)
      expect(data.page_info.next_page).to eq(@next_page_url)
      expect(data.page_info.next_page_token).to eq(@next_page_token)
      expect(data.messages.length).to eq(@total_count)
      expect(data.messages[0]).to be_instance_of(Bandwidth::ListMessageItem)
      expect(data.messages[0].message_id).to eq(@mms_id)
      expect(data.messages[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data.messages[0].source_tn).to eq(BW_NUMBER)
      expect(data.messages[0].destination_tn).to eq(USER_NUMBER)
      expect(data.messages[0].message_status).to eq(@list_message_status)
      expect(data.messages[0].message_direction).to eq(@list_message_direction)
      expect(data.messages[0].message_type).to eq(@list_message_type_mms)
      expect(data.messages[0].segment_count).to eq(@segment_count)
      expect(data.messages[0].error_code).to eq(@mms_error_code)
      expect(data.messages[0].receive_time).to eq(Time.parse(@time))
      expect(data.messages[0].carrier_name).to eq(nil)
      expect(data.messages[0].message_size).to eq(@mms_length)
      expect(data.messages[0].message_length).to eq(@mms_length)
      expect(data.messages[0].attachment_count).to eq(@attachment_count)
      expect(data.messages[0].recipient_count).to eq(@recipient_count)
      expect(data.messages[0].campaign_class).to eq(nil)
      expect(data.messages[0].campaign_id).to eq(nil)
      expect(data.messages[1]).to be_instance_of(Bandwidth::ListMessageItem)
      expect(data.messages[1].message_id).to eq(@sms_id)
      expect(data.messages[1].account_id).to eq(BW_ACCOUNT_ID)
      expect(data.messages[1].source_tn).to eq(BW_NUMBER)
      expect(data.messages[1].destination_tn).to eq(USER_NUMBER)
      expect(data.messages[1].message_status).to eq(@list_message_status)
      expect(data.messages[1].message_direction).to eq(@list_message_direction)
      expect(data.messages[1].message_type).to eq(@list_message_type_sms)
      expect(data.messages[1].segment_count).to eq(@segment_count)
      expect(data.messages[1].error_code).to eq(@sms_error_code)
      expect(data.messages[1].receive_time).to eq(Time.parse(@time))
      expect(data.messages[1].carrier_name).to eq(@carrier_name)
      expect(data.messages[1].message_size).to eq(nil)
      expect(data.messages[1].message_length).to eq(@text.length)
      expect(data.messages[1].attachment_count).to eq(nil)
      expect(data.messages[1].recipient_count).to eq(nil)
      expect(data.messages[1].campaign_class).to eq(nil)
      expect(data.messages[1].campaign_id).to eq(nil)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @messaging_api_instance.list_messages(nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

end
