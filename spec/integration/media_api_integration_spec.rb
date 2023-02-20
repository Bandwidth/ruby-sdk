require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::MediaApi
describe 'MediaApi Integration Tests' do
  before do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_media = Bandwidth::MediaApi.new
  end

  after do
    # run after each test
  end

  # Upload Media
  describe 'upload_media' do
    it 'uploads binary media' do
      media_name = 'ruby_media' + SecureRandom.uuid
      media_data = '123456'

      response = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, media_name, media_data)
      expect(response[CODE]).to eq(204)
    end

    it 'uploads media file' do
      media_name = 'ruby_media' + SecureRandom.uuid
      media_file = File.open("spec/fixtures/ruby_cat.jpeg")

      response = @api_instance_media.upload_media_with_http_info(BW_ACCOUNT_ID, media_name, media_file)
      expect(response[CODE]).to eq(204)
    end
  end
  
    # List Media
    describe 'list_media' do
      it 'lists media' do
        response = @api_instance_media.list_media_with_http_info(BW_ACCOUNT_ID)
        expect(response[CODE]).to eq(200)
        expect(response[DATA][0].content_length).to be > 0
      end
    end

  # Get Media
  describe 'get_media test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Delete Media
  describe 'delete_media test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
