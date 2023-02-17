require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::MFAApi
describe 'MFAApi Integration Tests' do
  before do
    # run before each test
    @api_instance = Bandwidth::MFAApi.new
  end

  after do
    # run after each test
  end

  # Messaging Authentication Code
  describe 'generate_messaging_code test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Voice Authentication Code
  describe 'generate_voice_code test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # Verify Authentication Code
  describe 'verify_code test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
