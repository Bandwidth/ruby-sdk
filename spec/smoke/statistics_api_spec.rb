# Integration Tests for Bandwidth::StatisticsApi
describe 'StatisticsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @statistics_api_instance = Bandwidth::StatisticsApi.new
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

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = UNAUTHORIZED_USERNAME
        config.password = UNAUTHORIZED_PASSWORD
      end

      expect {
        @statistics_api_instance.get_statistics_with_http_info(BW_ACCOUNT_ID)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 403 error' do
      Bandwidth.configure do |config|
        config.username = FORBIDDEN_USERNAME
        config.password = FORBIDDEN_PASSWORD
      end

      expect {
        @statistics_api_instance.get_statistics_with_http_info(BW_ACCOUNT_ID)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end
end
