# Integration tests for Bandwidth::TollFreeVerificationApi
describe 'TollFreeVerificationApi' do
  before(:all) do
    config = Bandwidth::Configuration.new
    config.configure do |config|
      config.client_id = BW_CLIENT_ID
      config.client_secret = BW_CLIENT_SECRET
    end
    client = Bandwidth::ApiClient.new(config)
    @tfv_api_instance = Bandwidth::TollFreeVerificationApi.new(client)
  end

  # Create Webhook Subscription
  describe 'create_webhook_subscription test' do
    it 'creates webhook subscription' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Delete Webhook Subscription
  describe 'delete_webhook_subscription test' do
    it 'deletes webhook subscription' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Get Toll-Free Verification Status
  describe 'get_toll_free_verification_status test' do
    it 'gets toll free verification status' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Delete a Toll-Free Verification Submission
  describe 'delete_verification_request' do
    it 'deletes a toll free verification submission' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # List Toll-Free Use Cases
  describe 'list_toll_free_use_cases test' do
    it 'lists toll free use cases' do
      data, status_code = @tfv_api_instance.list_toll_free_use_cases_with_http_info

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
    end
  end

  # List Webhook Subscriptions
  describe 'list_webhook_subscriptions test' do
    it 'lists webhook subscriptions' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Request Toll-Free Verification
  describe 'request_toll_free_verification test' do
    it 'requests toll free verification' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Update Toll-Free Verification Request
  describe 'update_toll_free_verification_request test' do
    it 'updates toll free verification request' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # Update Webhook Subscription
  describe 'update_webhook_subscription test' do
    it 'updates webhook subscription' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end
end
