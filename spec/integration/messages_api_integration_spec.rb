# Integration Tests for Bandwidth::MessagesApi
describe 'MessagesApi Integration Tests' do
  # message info
  let(:mms_text ) { 'ruby sdk test MMS' }
  let(:sms_text ) { 'ruby sdk test SMS' }
  let(:mms_tag ) { 'ruby sdk test MMS tag' }
  let(:sms_tag ) { 'ruby sdk test SMS tag' }
  let(:media_url ) { 'https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg' }
  let(:priority ) { Bandwidth::PriorityEnum::HIGH }
  let(:list_message_direction ) { Bandwidth::ListMessageDirectionEnum::OUTBOUND }
  
  before(:all) do
    WebMock.allow_net_connect!
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @messaging_api_instance = Bandwidth::MessagesApi.new()

    # expiration time
    @expiration_time = (Time.now + 60).round.to_datetime.rfc3339
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  # Create Message
  describe 'create_message' do
    it 'creates an mms message' do
      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: mms_text,
        media: [media_url],
        tag: mms_tag
      )

      data, status_code, headers = @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, message_request)

      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::Message)
      expect(data.id.length).to eq(29)
      expect(data.owner).to eq(BW_NUMBER)
      expect(data.to).to eq([USER_NUMBER])
      expect(data.from).to eq(BW_NUMBER)
      expect(data.text).to eq(mms_text)
      expect(data.media).to eq([media_url])
      expect(data.tag).to eq(mms_tag)
    end

    it 'creates an sms message' do
      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: sms_text,
        tag: sms_tag,
        priority: priority,
        expiration: @expiration_time
      )
  
      data, status_code, headers = @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, message_request)
  
      expect(status_code).to eq(202)
      expect(data).to be_instance_of(Bandwidth::Message)
      expect(data.id.length).to eq(29)
      expect(data.owner).to eq(BW_NUMBER)
      expect(data.to).to eq([USER_NUMBER])
      expect(data.from).to eq(BW_NUMBER)
      expect(data.text).to eq(sms_text)
      expect(data.tag).to eq(sms_tag)
      expect(data.priority).to eq(priority)
      expect(data.expiration).to eq(Time.parse(@expiration_time))
    end
  end

  # List Messages
  describe 'list_messages' do
    it 'lists messages' do
      get_opts = {
        source_tn: BW_NUMBER,
        message_direction: list_message_direction
      }
      data, status_code, headers = @messaging_api_instance.list_messages_with_http_info(BW_ACCOUNT_ID, get_opts)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::MessagesList)
      expect(data.messages).to be_instance_of(Array)
      expect(data.messages[0]).to be_instance_of(Bandwidth::ListMessageItem)
      expect(data.messages[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(data.messages[0].message_direction).to eq(list_message_direction)
      expect(data.messages[0].source_tn).to eq(BW_NUMBER)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      body = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: ['+1invalid'],
        from: BW_NUMBER,
        text: 'ruby sdk 400 test'
      )

      expect {
        @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = UNAUTHORIZED_USERNAME
        config.password = UNAUTHORIZED_PASSWORD
      end

      body = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: 'ruby sdk 401 test'
      )
      
      expect {
        @messaging_api_instance.create_message_with_http_info(BW_ACCOUNT_ID, body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end
  end
  
end
