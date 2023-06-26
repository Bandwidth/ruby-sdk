
require 'json'

# Integration Tests for Bandwidth::MessagesApi
describe 'MessagesApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_msg = Bandwidth::MessagesApi.new()
  end

  # Create Message
  describe 'create_message' do
    it 'creates an mms message' do
      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: "ruby sdk test MMS",
        media: ["https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg"],
        tag: "ruby sdk test MMS tag"
      )

      response = @api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, message_request)

      expect(response[CODE]).to eq(202)
      expect(response[DATA]).to be_instance_of(Bandwidth::Message)
      expect(response[DATA].id.length).to eq(29)
      expect(response[DATA].owner).to eq(BW_NUMBER)
      expect(response[DATA].to).to eq([USER_NUMBER])
      expect(response[DATA].from).to eq(BW_NUMBER)
      expect(response[DATA].text).to eq(message_request.text)
      expect(response[DATA].media).to eq(message_request.media)
      expect(response[DATA].tag).to eq(message_request.tag)
    end

    it 'creates an sms message' do
      expiration_time = Time.now + 60
      expiration_time = expiration_time.round
      message_request = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: "ruby sdk test SMS",
        tag: "ruby sdk test SMS tag",
        priority: Bandwidth::PriorityEnum::HIGH,
        expiration: expiration_time.to_datetime.rfc3339
      )
  
      response = @api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, message_request)
  
      expect(response[CODE]).to eq(202)
      expect(response[DATA]).to be_instance_of(Bandwidth::Message)
      expect(response[DATA].id.length).to eq(29)
      expect(response[DATA].owner).to eq(BW_NUMBER)
      expect(response[DATA].to).to eq([USER_NUMBER])
      expect(response[DATA].from).to eq(BW_NUMBER)
      expect(response[DATA].text).to eq(message_request.text)
      expect(response[DATA].tag).to eq(message_request.tag)
      expect(response[DATA].priority).to eq(message_request.priority)
      expect(response[DATA].expiration).to eq(expiration_time)
    end
  end

  # List Messages
  describe 'list_messages' do
    it 'lists messages' do
      get_opts = {
        :source_tn => BW_NUMBER,
        :message_direction => "OUTBOUND"
      }
      response = @api_instance_msg.list_messages_with_http_info(BW_ACCOUNT_ID, get_opts)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::MessagesList)
      expect(response[DATA].messages[0]).to be_instance_of(Bandwidth::ListMessageItem)
      expect(response[DATA].messages[0].account_id).to eq(BW_ACCOUNT_ID)
      expect(response[DATA].messages[0].message_direction).to eq("OUTBOUND")
      expect(response[DATA].messages[0].source_tn).to eq(BW_NUMBER)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      body = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: ["+1invalid"],
        from: BW_NUMBER,
        text: "ruby sdk 400 test"
      )

      expect {
        $response = @api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = 'bad_username'
        config.password = 'bad_password'
      end

      body = Bandwidth::MessageRequest.new(
        application_id: BW_MESSAGING_APPLICATION_ID,
        to: [USER_NUMBER],
        from: BW_NUMBER,
        text: "ruby sdk 401 test"
      )
      
      expect {
        $response = @api_instance_msg.create_message_with_http_info(BW_ACCOUNT_ID, body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end
  end
  
end if false # (`if false` skips this entire block)
