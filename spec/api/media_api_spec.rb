# Unit tests for Bandwidth::MediaApi
describe 'MediaApi' do
  before(:all) do
    @media_api_instance = Bandwidth::MediaApi.new
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
      config.debugging = true
    end

    # media info
    @media_name = 'ruby_binary_media' + SecureRandom.uuid
    @media_data = '123456'
    @content_url = "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/media/#{@media_name}"

    # stubs
    @get_media_headers_stub = { "content-type" => "application/json" }
    @list_media_body_stub = "[{\"contentLength\":#{@media_data.length},\"mediaName\":\"#{@media_name}\",\"content\":\"#{@content_url}\"}]"
    @list_media_headers_stub = { "content-type" => "application/json" }
  end

  describe 'test an instance of MediaApi' do
    it 'should create an instance of MediaApi' do
      expect(@media_api_instance).to be_instance_of(Bandwidth::MediaApi)
    end
  end

  # Delete Media
  describe 'delete_media' do
    it 'deletes the binary media' do
      stub_request(:delete, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/media/#{@media_name}").
      to_return(status: 204)

      data, status_code, headers = @media_api_instance.delete_media_with_http_info(BW_ACCOUNT_ID, @media_name)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @media_api_instance.delete_media(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.delete_media(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Get Media
  describe 'get_media' do
    it 'gets uploaded binary media' do
      stub_request(:get, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/media/#{@media_name}").
      to_return(status: 200, headers: @get_media_headers_stub, body: @media_data)

      data, status_code, headers = @media_api_instance.get_media_with_http_info(BW_ACCOUNT_ID, @media_name)

      expect(status_code).to eq(200)
      expect(headers).to eq(@get_media_headers_stub)
      expect(data).to eq(@media_data)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @media_api_instance.get_media(nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.get_media(BW_ACCOUNT_ID, nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # List Media
  describe 'list_media' do
    it 'lists media' do
      stub_request(:get, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/media").
      to_return(status: 200, headers: @list_media_headers_stub, body: @list_media_body_stub)

      data, status_code, headers = @media_api_instance.list_media_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(headers).to eq(@list_media_headers_stub)
      expect(data[0]).to be_instance_of(Bandwidth::Media)
      expect(data[0].content_length).to eq(@media_data.length)
      expect(data[0].media_name).to eq(@media_name)
      expect(data[0].content).to eq(@content_url)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @media_api_instance.list_media(nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  # Upload Media
  describe 'upload_media' do
    it 'uploads binary media' do
      stub_request(:put, "https://messaging.bandwidth.com/api/v2/users/#{BW_ACCOUNT_ID}/media/#{@media_name}").
      to_return(status: 204)

      data, status_code, headers = @media_api_instance.upload_media_with_http_info(BW_ACCOUNT_ID, @media_name, @media_data)
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        resp = @media_api_instance.upload_media(nil, '', '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.upload_media(BW_ACCOUNT_ID, nil, '')
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @media_api_instance.upload_media(BW_ACCOUNT_ID, '', nil)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

end
