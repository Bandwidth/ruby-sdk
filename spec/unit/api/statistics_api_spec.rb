# Unit tests for Bandwidth::StatisticsApi
describe 'StatisticsApi' do
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @statistics_api_instance = Bandwidth::StatisticsApi.new
  end

  describe 'test an instance of StatisticsApi' do
    it 'should create an instance of StatisticsApi' do
      expect(@statistics_api_instance).to be_instance_of(Bandwidth::StatisticsApi)
    end
  end

  # Get Account Statistics
  describe 'get_statistics' do
    it 'gets account statistics' do
      data, status_code = @statistics_api_instance.get_statistics_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::AccountStatistics)
      expect(data.current_call_queue_size).to be_instance_of(Integer)
      expect(data.max_call_queue_size).to be_instance_of(Integer)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @statistics_api_instance.get_statistics(nil)
      }.to raise_error(ArgumentError)
    end
  end
end
