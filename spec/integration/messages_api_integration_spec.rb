require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::MessagesApi
describe 'MessagesApi Integration Tests' do
  before(:all) do
    @api_instance_msg = Bandwidth::MessagesApi.new()
  end

  before do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      #config.ssl_verify = false # remove for testing on push
    end
  end

  # Create Message
  describe 'create_message' do
    
  end

  # List Messages
  describe 'list_messages' do
    
  end

end
