require 'spec_helper'
require 'json'

# Integration Tests for Bandwidth::StatisticsApi
describe 'StatisticsApi Integration Tests' do
  before do
    # run before each test
    @api_instance = Bandwidth::StatisticsApi.new
  end

  after do
    # run after each test
  end

  # Get Account Statistics
  describe 'get_statistics test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
