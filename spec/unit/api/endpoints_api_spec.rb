# Unit tests for Bandwidth::EndpointsApi
describe 'EndpointsApi' do
  let(:endpoint_id) { 'ep-abc123' }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @endpoints_api_instance = Bandwidth::EndpointsApi.new
  end

  describe 'test an instance of EndpointsApi' do
    it 'should create an instance of EndpointsApi' do
      expect(@endpoints_api_instance).to be_instance_of(Bandwidth::EndpointsApi)
    end
  end

  # Create Endpoint
  describe '#create_endpoint' do
    it 'creates a WebRTC endpoint' do
      create_endpoint_body = Bandwidth::CreateWebRtcConnectionRequest.new(
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
        event_callback_url: 'https://myServer.com/bandwidth/webhooks/endpoint',
        event_fallback_url: 'https://myFallbackServer.com/bandwidth/webhooks/endpoint',
        tag: 'test-endpoint',
        connection_metadata: { 'key1' => 'value1', 'key2' => 'value2' }
      )

      data, status_code = @endpoints_api_instance.create_endpoint_with_http_info(BW_ACCOUNT_ID, create_endpoint_body)

      expect(status_code).to eq(201)
      expect(data).to be_instance_of(Bandwidth::CreateEndpointResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::CreateEndpointResponseData)
      expect(data.data.endpoint_id).to be_instance_of(String)
      expect(data.data.type).to be_one_of(Bandwidth::EndpointTypeEnum.all_vars)
      expect(data.data.status).to be_one_of(Bandwidth::EndpointStatusEnum.all_vars)
      expect(data.data.creation_timestamp).to be_instance_of(Time)
      expect(data.data.expiration_timestamp).to be_instance_of(Time)
      expect(data.data.token).to be_instance_of(String)
      expect(data.data.tag).to be_instance_of(String)
      expect(data.data.devices).to be_instance_of(Array)
      expect(data.errors).to be_instance_of(Array)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @endpoints_api_instance.create_endpoint(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @endpoints_api_instance.create_endpoint(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Endpoints
  describe '#list_endpoints' do
    it 'gets a list of endpoints' do
      data, status_code = @endpoints_api_instance.list_endpoints_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ListEndpointsResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.page).to be_instance_of(Bandwidth::Page)
      expect(data.data).to be_instance_of(Array)
      expect(data.data[0]).to be_instance_of(Bandwidth::Endpoints)
      expect(data.data[0].endpoint_id).to be_instance_of(String)
      expect(data.data[0].type).to be_one_of(Bandwidth::EndpointTypeEnum.all_vars)
      expect(data.data[0].status).to be_one_of(Bandwidth::EndpointStatusEnum.all_vars)
      expect(data.data[0].creation_timestamp).to be_instance_of(Time)
      expect(data.data[0].expiration_timestamp).to be_instance_of(Time)
      expect(data.data[0].tag).to be_instance_of(String)
      expect(data.errors).to be_instance_of(Array)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @endpoints_api_instance.list_endpoints(nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Endpoint
  describe '#get_endpoint' do
    it 'gets an endpoint' do
      data, status_code = @endpoints_api_instance.get_endpoint_with_http_info(BW_ACCOUNT_ID, endpoint_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::EndpointResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::Endpoint)
      expect(data.data.endpoint_id).to be_instance_of(String)
      expect(data.data.type).to be_one_of(Bandwidth::EndpointTypeEnum.all_vars)
      expect(data.data.status).to be_one_of(Bandwidth::EndpointStatusEnum.all_vars)
      expect(data.data.creation_timestamp).to be_instance_of(Time)
      expect(data.data.expiration_timestamp).to be_instance_of(Time)
      expect(data.data.tag).to be_instance_of(String)
      expect(data.data.devices).to be_instance_of(Array)
      expect(data.errors).to be_instance_of(Array)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @endpoints_api_instance.get_endpoint(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing endpoint_id' do
      expect {
        @endpoints_api_instance.get_endpoint(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Endpoint BXML
  describe '#update_endpoint_bxml' do
    it 'updates an endpoint using bxml' do
      update_bxml = "<?xml version='1.0' encoding='UTF-8'?><Bxml><SpeakSentence>Hello</SpeakSentence></Bxml>"

      _data, status_code = @endpoints_api_instance.update_endpoint_bxml_with_http_info(BW_ACCOUNT_ID, endpoint_id, update_bxml)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @endpoints_api_instance.update_endpoint_bxml(nil, '', {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing endpoint_id' do
      expect {
        @endpoints_api_instance.update_endpoint_bxml(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @endpoints_api_instance.update_endpoint_bxml(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete Endpoint
  describe '#delete_endpoint' do
    it 'deletes an endpoint' do
      _data, status_code = @endpoints_api_instance.delete_endpoint_with_http_info(BW_ACCOUNT_ID, endpoint_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @endpoints_api_instance.delete_endpoint(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing endpoint_id' do
      expect {
        @endpoints_api_instance.delete_endpoint(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
