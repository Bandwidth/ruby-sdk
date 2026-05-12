# Integration Tests for Bandwidth::EndpointsApi
describe 'EndpointsApi Integration Tests' do
  before(:all) do
    config = Bandwidth::Configuration.new
    config.configure do |config|
      config.client_id = BW_CLIENT_ID
      config.client_secret = BW_CLIENT_SECRET
    end
    client = Bandwidth::ApiClient.new(config)
    @endpoints_api_instance = Bandwidth::EndpointsApi.new(client)

    unauthorized_config = Bandwidth::Configuration.new
    unauthorized_config.configure do |config|
      config.username = UNAUTHORIZED_USERNAME
      config.password = UNAUTHORIZED_PASSWORD
    end
    unauthorized_client = Bandwidth::ApiClient.new(unauthorized_config)
    @unauthorized_api_instance = Bandwidth::EndpointsApi.new(unauthorized_client)

    $endpoint_id = ''
  end

  # Create Endpoint
  describe 'create_endpoint' do
    it 'creates a WebRTC endpoint' do
      create_endpoint_body = Bandwidth::CreateWebRtcConnectionRequest.new(
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
        event_callback_url: BASE_CALLBACK_URL + '/endpoint/callback',
        event_fallback_url: BASE_CALLBACK_URL + '/endpoint/fallback',
        tag: 'ruby-sdk-test-endpoint'
      )

      data, status_code = @endpoints_api_instance.create_endpoint_with_http_info(BW_ACCOUNT_ID, create_endpoint_body)

      expect(status_code).to eq(201)
      expect(data).to be_instance_of(Bandwidth::CreateEndpointResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.errors).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::CreateEndpointResponseData)
      expect(data.data.endpoint_id).to be_instance_of(String)
      expect(data.data.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(data.data.status).to be_one_of(Bandwidth::EndpointStatusEnum.all_vars)
      expect(data.data.token).to be_instance_of(String)
      expect(data.data.creation_timestamp).to be_instance_of(Time)
      expect(data.data.expiration_timestamp).to be_instance_of(Time)
      expect(data.data.tag).to eq('ruby-sdk-test-endpoint')
      expect(data.data.devices).to be_instance_of(Array)

      $endpoint_id = data.data.endpoint_id
    end
  end

  # List Endpoints
  describe 'list_endpoints' do
    it 'gets a list of endpoints' do
      data, status_code = @endpoints_api_instance.list_endpoints_with_http_info(
        BW_ACCOUNT_ID,
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        limit: 10
      )

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::ListEndpointsResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.errors).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Array)
      expect(data.data.length).to be > 0

      tagged_endpoint = data.data.find { |ep| ep.endpoint_id == $endpoint_id }
      expect(tagged_endpoint).not_to be_nil
      expect(tagged_endpoint.tag).to eq('ruby-sdk-test-endpoint')
    end
  end

  # Get Endpoint
  describe 'get_endpoint' do
    it 'gets a specific endpoint' do
      data, status_code = @endpoints_api_instance.get_endpoint_with_http_info(BW_ACCOUNT_ID, $endpoint_id)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::EndpointResponse)
      expect(data.links).to be_instance_of(Array)
      expect(data.errors).to be_instance_of(Array)
      expect(data.data).to be_instance_of(Bandwidth::Endpoint)
      expect(data.data.endpoint_id).to eq($endpoint_id)
      expect(data.data.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(data.data.status).to be_one_of(Bandwidth::EndpointStatusEnum.all_vars)
      expect(data.data.creation_timestamp).to be_instance_of(Time)
      expect(data.data.expiration_timestamp).to be_instance_of(Time)
      expect(data.data.tag).to eq('ruby-sdk-test-endpoint')
      expect(data.data.devices).to be_instance_of(Array)
    end
  end

  # Delete Endpoint
  describe 'delete_endpoint' do
    it 'deletes an endpoint' do
      _data, status_code = @endpoints_api_instance.delete_endpoint_with_http_info(BW_ACCOUNT_ID, $endpoint_id)

      expect(status_code).to eq(204)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 401 error on create' do
      create_endpoint_body = Bandwidth::CreateWebRtcConnectionRequest.new(
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL
      )

      expect {
        @unauthorized_api_instance.create_endpoint_with_http_info(BW_ACCOUNT_ID, create_endpoint_body)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 401 error on list' do
      expect {
        @unauthorized_api_instance.list_endpoints_with_http_info(BW_ACCOUNT_ID)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 404 error on get' do
      expect {
        @endpoints_api_instance.get_endpoint_with_http_info(BW_ACCOUNT_ID, 'does-not-exist')
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 404 error on delete' do
      expect {
        @endpoints_api_instance.delete_endpoint_with_http_info(BW_ACCOUNT_ID, 'does-not-exist')
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end
  end
end
