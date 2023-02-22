require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::MediaApi
describe 'MediaApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.return_binary_data = true
    end
    @api_instance_media = Bandwidth::MediaApi.new
    @binary_media_name = 'ruby_binary_media' + SecureRandom.uuid
    @binary_media_data = '123456'
    @media_file_name = 'ruby_media_file' + SecureRandom.uuid
    @media_file_data = File.open("spec/fixtures/ruby_cat.jpeg").read
    @media_file_md5 = Digest::MD5.hexdigest(@media_file_data)
  end

  # Upload Media
  describe 'upload_media' do
    it 'uploads binary media' do
      response = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name, @binary_media_data)
      expect(response[CODE]).to eq(204)
    end

    it 'uploads media file' do
      response = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, @media_file_name, @media_file_data)
      expect(response[CODE]).to eq(204)
    end
  end
  
    # List Media
    describe 'list_media' do
      it 'lists media' do
        response = @api_instance_media.list_media_with_http_info(BW_ACCOUNT_ID)
        expect(response[CODE]).to eq(200)
        expect(response[DATA][0]).to be_a(Bandwidth::Media)
        expect(response[DATA][0].content).to be_a(String)
        expect(response[DATA][0].content_length).to be > 0
      end
    end

  # Get Media
  describe 'get_media' do
    it 'gets uploaded binary media' do
      response = @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name, debug_return_type: 'String')
      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to eq(@binary_media_data)
    end

    it 'gets uploaded media file' do
      response = @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, @media_file_name)
      response_md5 = Digest::MD5.hexdigest(response[DATA])

      expect(response[CODE]).to eq(200)
      expect(response_md5).to eq(@media_file_md5)
    end
  end

  # Delete Media
  describe 'delete_media' do
    it 'deletes the binary media' do
      response = @api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, @binary_media_name)
      expect(response[CODE]).to eq(204)
    end

    it 'deletes the media file' do
      response = @api_instance_media.delete_media_with_http_info(BW_ACCOUNT_ID, @media_file_name)
      expect(response[CODE]).to eq(204)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 404 error' do
      expect {
        response = @api_instance_media.get_media_with_http_info(BW_ACCOUNT_ID, "does_not_exist")
      }.to raise_error { |e|
        expect(e).to be_a(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end
  end

end
