require_relative 'smoke_helper'

# Integration Tests for Bandwidth::StatisticsApi
describe 'StatisticsApi Integration Tests' do
  before(:all) do
    config = Bandwidth::Configuration.new
    config.configure do |config|
      config.client_id = BW_CLIENT_ID
      config.client_secret = BW_CLIENT_SECRET
    end
    client = Bandwidth::ApiClient.new(config)
    @statistics_api_instance = Bandwidth::StatisticsApi.new(client)
  end

  # Get Account Statistics
  describe 'get_statistics' do
    it 'gets account statistics' do
      data, status_code = @statistics_api_instance.get_statistics_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::AccountStatistics)
      expect(data.current_call_queue_size).to be_instance_of(Integer)
      expect(data.max_call_queue_size).to eq(7500)
    end
  end
end
