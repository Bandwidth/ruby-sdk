# Integration Tests for Bandwidth::MediaApi
describe 'MediaApi Integration Tests' do
  # media info
  let(:binary_media_data) { '123456' }
  let(:media_file_data) { File.open('spec/fixtures/ruby_cat.jpeg').read }
  let(:media_file_md5) { Digest::MD5.hexdigest(media_file_data) }
  
  before(:all) do
    WebMock.allow_net_connect!
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
    end
    @api_instance_media = Bandwidth::MediaApi.new

    # media names
    @binary_media_name = 'ruby_binary_media' + SecureRandom.uuid
    @media_file_name = 'ruby_media_file' + SecureRandom.uuid
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  # Upload Media
  describe 'upload_media' do
    it 'uploads binary media' do
      data, status_code, headers = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name, binary_media_data)
      expect(status_code).to eq(204)
    end

    it 'uploads media file' do
      data, status_code, headers = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, @media_file_name, media_file_data)
      expect(status_code).to eq(204)
    end
  end
  
  # List Media
  describe 'list_media' do
    it 'lists media' do
      data, status_code, headers = @api_instance_media.list_media_with_http_info(BW_ACCOUNT_ID)
      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::Media)
      expect(data[0].content).to be_instance_of(String)
      expect(data[0].content_length).to be > 0
    end
  end

  # Get Media
  describe 'get_media' do
    it 'gets uploaded binary media' do
      data, status_code, headers = @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name)
      expect(status_code).to eq(200)
      expect(data).to eq(binary_media_data)
    end

    it 'gets uploaded media file' do
      data, status_code, headers = @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, @media_file_name)
      response_md5 = Digest::MD5.hexdigest(data)

      expect(status_code).to eq(200)
      expect(response_md5).to eq(media_file_md5)
    end
  end

  # Delete Media
  describe 'delete_media' do
    it 'deletes the binary media' do
      data, status_code, headers = @api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name)
      expect(status_code).to eq(204)
    end

    it 'deletes the media file' do
      data, status_code, headers = @api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, @media_file_name)
      expect(status_code).to eq(204)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 404 error' do
      expect {
        @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, 'does_not_exist')
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end
  end
end
