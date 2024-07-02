# Unit tests for Bandwidth::MessagesApi
describe 'MessagesApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @messaging_api_instance = Bandwidth::MessagesApi.new
  end

  describe 'test an instance of MessagesApi' do
    it 'should create an instance of MessagesApi' do
      expect(@messaging_api_instance).to be_instance_of(Bandwidth::MessagesApi)
    end
  end

  # Create Message
  describe 'create_message' do
    it 'creates a message' do
      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: 'Hello',
      )

      data, status_code = @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, message_request)

      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::Message)
      expect(data.id.length).to eq(29)
      expect(data.owner.length).to eq(12)
      expect(data.application_id.length).to eq(36)
      expect(data.time).to be_instance_of(Time)
      expect(data.segment_count).to be_instance_of(Integer)
      expect(data.direction).to be_one_of(Bandwidth::MessageDirectionEnum.all_vars)
      expect(data.to).to be_instance_of(Array)
      expect(data.to[0].length).to eq(12)
      expect(data.from.length).to eq(12)
      expect(data.media).to be_instance_of(Array)
      expect(data.media[0]).to start_with('http')
      expect(data.text).to be_instance_of(String)
      expect(data.tag).to be_instance_of(String)
      expect(data.priority).to be_one_of(Bandwidth::PriorityEnum.all_vars)
      expect(data.expiration).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @messaging_api_instance.create_message(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing message_request' do
      expect {
        @messaging_api_instance.create_message(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Messages
  describe 'list_messages' do
    it 'lists messages' do
      data, status_code = @messaging_api_instance.list_messages_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagesList)
      expect(data.total_count).to be_instance_of(Integer)
      expect(data.page_info).to be_instance_of(Bandwidth::PageInfo)
      expect(data.page_info.prev_page).to start_with('http')
      expect(data.page_info.next_page).to start_with('http')
      expect(data.page_info.prev_page_token).to be_instance_of(String)
      expect(data.page_info.next_page_token).to be_instance_of(String)
      expect(data.messages).to be_instance_of(Array)
      expect(data.messages[0].message_id.length).to eq(29)
      expect(data.messages[0].account_id.length).to eq(7)
      expect(data.messages[0].source_tn.length).to eq(12)
      expect(data.messages[0].destination_tn.length).to eq(12)
      expect(data.messages[0].message_status).to be_one_of(Bandwidth::MessageStatusEnum.all_vars)
      expect(data.messages[0].message_direction).to be_one_of(Bandwidth::ListMessageDirectionEnum.all_vars)
      expect(data.messages[0].message_type).to be_one_of(Bandwidth::MessageTypeEnum.all_vars)
      expect(data.messages[0].segment_count).to be_instance_of(Integer)
      expect(data.messages[0].error_code).to be_instance_of(Integer)
      expect(data.messages[0].receive_time).to be_instance_of(Time)
      expect(data.messages[0].carrier_name).to be_instance_of(String)
      expect(data.messages[0].message_size).to be_instance_of(Integer)
      expect(data.messages[0].message_length).to be_instance_of(Integer)
      expect(data.messages[0].attachment_count).to be_instance_of(Integer)
      expect(data.messages[0].recipient_count).to be_instance_of(Integer)
      expect(data.messages[0].campaign_class).to be_instance_of(String)
      expect(data.messages[0].campaign_id).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @messaging_api_instance.list_messages(nil)
      }.to raise_error(ArgumentError)
    end
  end
end
