# Unit tests for Bandwidth::StatisticsApi
describe 'StatisticsApi' do
  # statistics info
  let(:current_call_queue_size) { 0 }
  let(:max_call_queue_size) { 7500 }

  # stubs
  let(:get_statistics_headers_stub) { { 'content-type' => 'application/json' } }
  let(:get_statistics_body_stub) { "{\"currentCallQueueSize\":#{current_call_queue_size},\"maxCallQueueSize\":#{max_call_queue_size}}" }
  
  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
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
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/statistics").
      to_return(status: 200, headers: get_statistics_headers_stub, body: get_statistics_body_stub)

      data, status_code, headers = @statistics_api_instance.get_statistics_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(headers).to eq(get_statistics_headers_stub)
      expect(data).to be_instance_of(Bandwidth::AccountStatistics)
      expect(data.current_call_queue_size).to eq(current_call_queue_size)
      expect(data.max_call_queue_size).to eq(max_call_queue_size)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @statistics_api_instance.get_statistics(nil)
      }.to raise_error(ArgumentError)
    end
  end
end
