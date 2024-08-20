# Unit tests for Bandwidth::MediaApi
describe 'MediaApi' do
  # media info
  let(:media_name) { 'ruby_media.jpeg' }
  let(:media_file_data) { File.open('spec/fixtures/ruby_cat.jpeg').read }
  
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.return_binary_data = true
      config.host = '127.0.0.1:4010'
    end
    @media_api_instance = Bandwidth::MediaApi.new
  end

  describe 'test an instance of MediaApi' do
    it 'should create an instance of MediaApi' do
      expect(@media_api_instance).to be_instance_of(Bandwidth::MediaApi)
    end
  end

  # Delete Media
  describe 'delete_media' do
    it 'deletes the binary media' do
      _data, status_code = @media_api_instance.delete_media_with_http_info(BW_ACCOUNT_ID, media_name)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @media_api_instance.delete_media(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.delete_media(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Media
  describe 'get_media' do
    it 'gets uploaded binary media' do
      data, status_code = @media_api_instance.get_media_with_http_info(
        BW_ACCOUNT_ID, media_name, { header_params: { 'Accept' => 'application/octet-stream' } })

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @media_api_instance.get_media(nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.get_media(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # List Media
  describe 'list_media' do
    it 'lists media' do
      data, status_code = @media_api_instance.list_media_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data[0]).to be_instance_of(Bandwidth::Media)
      expect(data[0].content).to be_instance_of(String)
      expect(data[0].content_length).to be_instance_of(Integer)
      expect(data[0].media_name).to be_instance_of(String)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @media_api_instance.list_media(nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Upload Media
  describe 'upload_media' do
    it 'uploads media' do
      _data, status_code = @media_api_instance.upload_media_with_http_info(
        BW_ACCOUNT_ID, media_name, media_file_data, { content_type: 'image/jpeg' })
      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @media_api_instance.upload_media(nil, '', '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing media_id' do
      expect {
        @media_api_instance.upload_media(BW_ACCOUNT_ID, nil, '')
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing body' do
      expect {
        @media_api_instance.upload_media(BW_ACCOUNT_ID, '', nil)
      }.to raise_error(ArgumentError)
    end
  end
end
