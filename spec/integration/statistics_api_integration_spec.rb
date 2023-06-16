
require 'json'

# Integration Tests for Bandwidth::StatisticsApi
describe 'StatisticsApi Integration Tests' do
  before(:all) do
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    @api_instance_statistics = Bandwidth::StatisticsApi.new
  end

  # Get Account Statistics
  describe 'get_statistics' do
    it 'gets account statistics' do
      response = @api_instance_statistics.get_statistics_with_http_info(BW_ACCOUNT_ID)

      expect(response[CODE]).to eq(200)
      expect(response[DATA]).to be_instance_of(Bandwidth::AccountStatistics)
      expect(response[DATA].current_call_queue_size).to be_instance_of(Integer)
      expect(response[DATA].max_call_queue_size).to eq(7500)
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 401 error' do
      Bandwidth.configure do |config|
        config.username = 'bad_username'
        config.password = 'bad_password'
      end

      expect {
        @api_instance_statistics.get_statistics_with_http_info(BW_ACCOUNT_ID)
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
        @api_instance_statistics.get_statistics_with_http_info(BW_ACCOUNT_ID)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end

end
