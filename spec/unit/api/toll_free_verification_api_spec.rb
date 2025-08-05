# Unit tests for Bandwidth::TollFreeVerificationApi
describe 'TollFreeVerificationApi' do
  let (:webhook_subscription_request_schema) { Bandwidth::WebhookSubscriptionRequestSchema.new(
    basic_authentication: {
      username: 'username',
      password: 'password'
    },
    callback_url: 'https://example.com',
    shared_secret_key: 'shared-secret-key'
  ) }
  let (:verification) { {
    business_address: Bandwidth::Address.new(
      name: 'name',
      addr1: 'addr1',
      addr2: 'addr2',
      city: 'city',
      state: 'state',
      zip: 'zip',
      url: 'https://example.com'
    ),
    business_contact: Bandwidth::Contact.new(
      first_name: 'first-name',
      last_name: 'last-name',
      email: 'email@email.com',
      phone_number: '+19195551234'
    ),
    message_volume: 12,
    use_case: 'useCase',
    use_case_summary: 'useCaseSummary',
    production_message_content: 'productionMessageContent',
    opt_in_workflow: Bandwidth::OptInWorkflow.new(
      description: 'description',
      image_urls: ['https://example.com']
    ),
    additional_information: 'additionalInformation',
    isv_reseller: 'isvReseller'
  } }
  let (:subscription_id) { 'test-id-1234' }
  let (:tf_phone_number) { '+18005551234' }

  before(:all) do
    Bandwidth.configure do |config|
      config.debugging = true
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
      config.ignore_operation_servers = true
      config.host = '127.0.0.1:4010'
    end
    @tfv_api_instance = Bandwidth::TollFreeVerificationApi.new
  end

  describe 'test an instance of TollFreeVerificationApi' do
    it 'should create an instance of TollFreeVerificationApi' do
      expect(@tfv_api_instance).to be_instance_of(Bandwidth::TollFreeVerificationApi)
    end
  end

  # Create Webhook Subscription
  describe 'create_webhook_subscription test' do
    it 'creates webhook subscription' do
      data, status_code = @tfv_api_instance.create_webhook_subscription_with_http_info(BW_ACCOUNT_ID, webhook_subscription_request_schema)

      expect(status_code).to eq(201)
      expect(data).to be_instance_of(Bandwidth::WebhookSubscription)
      expect(data.id).to be_instance_of(String)
      expect(data.account_id.length).to eq(7)
      expect(data.callback_url).to be_instance_of(String)
      expect(data.type).to be_one_of(Bandwidth::WebhookSubscriptionTypeEnum.all_vars)
      expect(data.basic_authentication).to be_instance_of(Bandwidth::WebhookSubscriptionBasicAuthentication)
      expect(data.basic_authentication.username).to be_instance_of(String)
      expect(data.basic_authentication.password).to be_instance_of(String)
      expect(data.created_date).to be_instance_of(Time)
      expect(data.modified_date).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.create_webhook_subscription(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing webhook_subscription_request_schema' do
      expect {
        @tfv_api_instance.create_webhook_subscription(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete Webhook Subscription
  describe 'delete_webhook_subscription test' do
    it 'deletes webhook subscription' do
      _data, status_code = @tfv_api_instance.delete_webhook_subscription_with_http_info(BW_ACCOUNT_ID, subscription_id)

      expect(status_code).to eq(204)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.delete_webhook_subscription(nil, subscription_id)
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing subscription_id' do
      expect {
        @tfv_api_instance.delete_webhook_subscription(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Get Toll-Free Verification Status
  describe 'get_toll_free_verification_status test' do
    it 'gets toll free verification status' do
      data, status_code = @tfv_api_instance.get_toll_free_verification_status_with_http_info(BW_ACCOUNT_ID, tf_phone_number)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::TfvStatus)
      expect(data.phone_number).to be_instance_of(String)
      expect(data.status).to be_one_of(Bandwidth::TfvStatusEnum.all_vars)
      expect(data.internal_ticket_number).to be_instance_of(String)
      expect(data.decline_reason_description).to be_instance_of(String)
      expect(data.resubmit_allowed).to be_one_of([true, false])
      expect(data.created_date_time).to be_instance_of(Time)
      expect(data.modified_date_time).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.get_toll_free_verification_status(nil, tf_phone_number)
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing phone_number' do
      expect {
        @tfv_api_instance.get_toll_free_verification_status(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Delete a Toll-Free Verification Submission
  describe 'delete_verification_request' do
    it 'deletes a toll free verification submission' do
      _data, status_code = @tfv_api_instance.delete_verification_request_with_http_info(BW_ACCOUNT_ID, tf_phone_number)
      expect(status_code).to eq(204)
    end
  end

  # List Toll-Free Use Cases
  describe 'list_toll_free_use_cases test' do
    it 'lists toll free use cases' do
      data, status_code = @tfv_api_instance.list_toll_free_use_cases_with_http_info

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Array)
      expect(data.length).to be > 0
      expect(data[0]).to be_instance_of(String)
    end
  end

  # List Webhook Subscriptions
  describe 'list_webhook_subscriptions test' do
    it 'lists webhook subscriptions' do
      data, status_code = @tfv_api_instance.list_webhook_subscriptions_with_http_info(BW_ACCOUNT_ID)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::WebhookSubscriptionsListBody)
      expect(data.links).to be_instance_of(Bandwidth::LinksObject)
      expect(data.links.first).to be_instance_of(String)
      expect(data.links._next).to be_instance_of(String)
      expect(data.links.previous).to be_instance_of(String)
      expect(data.links.last).to be_instance_of(String)
      expect(data.errors).to be_instance_of(Array)
      expect(data.errors[0].code).to be_instance_of(Integer)
      expect(data.errors[0].description).to be_instance_of(String)
      expect(data.errors[0].telephone_numbers).to be_instance_of(Array)
      expect(data.errors[0].telephone_numbers[0]).to be_instance_of(Bandwidth::TelephoneNumber)
      expect(data.errors[0].telephone_numbers[0].telephone_number).to be_instance_of(String)
      expect(data.data).to be_instance_of(Array)
      expect(data.data[0]).to be_instance_of(Bandwidth::WebhookSubscription)
      expect(data.data[0].id).to be_instance_of(String)
      expect(data.data[0].account_id).to be_instance_of(String)
      expect(data.data[0].callback_url).to be_instance_of(String)
      expect(data.data[0].type).to be_one_of(Bandwidth::WebhookSubscriptionTypeEnum.all_vars)
      expect(data.data[0].basic_authentication).to be_instance_of(Bandwidth::WebhookSubscriptionBasicAuthentication)
      expect(data.data[0].basic_authentication.username).to be_instance_of(String)
      expect(data.data[0].basic_authentication.password).to be_instance_of(String)
      expect(data.data[0].created_date).to be_instance_of(Time)
      expect(data.data[0].modified_date).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.list_webhook_subscriptions(nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Request Toll-Free Verification
  describe 'request_toll_free_verification test' do
    it 'requests toll free verification' do
      verification_request = Bandwidth::VerificationRequest.new(verification.merge(phone_numbers: [tf_phone_number]))
      _data, status_code = @tfv_api_instance.request_toll_free_verification_with_http_info(BW_ACCOUNT_ID, verification_request)

      expect(status_code).to eq(202)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.request_toll_free_verification(nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing verification_request' do
      expect {
        @tfv_api_instance.request_toll_free_verification(BW_ACCOUNT_ID, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Toll-Free Verification Request
  describe 'update_toll_free_verification_request test' do
    it 'updates toll free verification request' do
      tfv_submission_wrapper = Bandwidth::TfvSubmissionWrapper.new(
        submission: Bandwidth::VerificationUpdateRequest.new(verification)
      )

      _data, status_code = @tfv_api_instance.update_toll_free_verification_request_with_http_info(BW_ACCOUNT_ID, tf_phone_number, tfv_submission_wrapper)

      expect(status_code).to eq(202)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.update_toll_free_verification_request(nil, tf_phone_number, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing phone_number' do
      expect {
        @tfv_api_instance.update_toll_free_verification_request(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing tfv_submission_wrapper' do
      expect {
        @tfv_api_instance.update_toll_free_verification_request(BW_ACCOUNT_ID, tf_phone_number, nil)
      }.to raise_error(ArgumentError)
    end
  end

  # Update Webhook Subscription
  describe 'update_webhook_subscription test' do
    it 'updates webhook subscription' do
      data, status_code = @tfv_api_instance.update_webhook_subscription_with_http_info(BW_ACCOUNT_ID, subscription_id, webhook_subscription_request_schema)

      expect(status_code).to eq(200)
      expect(data).to be_instance_of(Bandwidth::WebhookSubscription)
      expect(data.id).to be_instance_of(String)
      expect(data.account_id.length).to eq(7)
      expect(data.callback_url).to be_instance_of(String)
      expect(data.type).to be_one_of(Bandwidth::WebhookSubscriptionTypeEnum.all_vars)
      expect(data.basic_authentication).to be_instance_of(Bandwidth::WebhookSubscriptionBasicAuthentication)
      expect(data.basic_authentication.username).to be_instance_of(String)
      expect(data.basic_authentication.password).to be_instance_of(String)
      expect(data.created_date).to be_instance_of(Time)
      expect(data.modified_date).to be_instance_of(Time)
    end

    it 'causes an ArgumentError for a missing account_id' do
      expect {
        @tfv_api_instance.update_webhook_subscription(nil, subscription_id, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing subscription_id' do
      expect {
        @tfv_api_instance.update_webhook_subscription(BW_ACCOUNT_ID, nil, {})
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError for a missing webhook_subscription_request_schema' do
      expect {
        @tfv_api_instance.update_webhook_subscription(BW_ACCOUNT_ID, subscription_id, nil)
      }.to raise_error(ArgumentError)
    end
  end
end
