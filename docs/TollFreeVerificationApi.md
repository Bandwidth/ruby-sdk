# Bandwidth::TollFreeVerificationApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_webhook_subscription**](TollFreeVerificationApi.md#create_webhook_subscription) | **POST** /accounts/{accountId}/tollFreeVerification/webhooks/subscriptions | Create Webhook Subscription |
| [**delete_webhook_subscription**](TollFreeVerificationApi.md#delete_webhook_subscription) | **DELETE** /accounts/{accountId}/tollFreeVerification/webhooks/subscriptions/{id} | Delete Webhook Subscription |
| [**get_toll_free_verification_status**](TollFreeVerificationApi.md#get_toll_free_verification_status) | **GET** /accounts/{accountId}/phoneNumbers/{phoneNumber}/tollFreeVerification | Get Toll-Free Verification Status |
| [**list_toll_free_use_cases**](TollFreeVerificationApi.md#list_toll_free_use_cases) | **GET** /tollFreeVerification/useCases | List Toll-Free Use Cases |
| [**list_webhook_subscriptions**](TollFreeVerificationApi.md#list_webhook_subscriptions) | **GET** /accounts/{accountId}/tollFreeVerification/webhooks/subscriptions | List Webhook Subscriptions |
| [**request_toll_free_verification**](TollFreeVerificationApi.md#request_toll_free_verification) | **POST** /accounts/{accountId}/tollFreeVerification | Request Toll-Free Verification |
| [**update_toll_free_verification_request**](TollFreeVerificationApi.md#update_toll_free_verification_request) | **PUT** /accounts/{accountId}/phoneNumbers/{phoneNumber}/tollFreeVerification | Update Toll-Free Verification Request |
| [**update_webhook_subscription**](TollFreeVerificationApi.md#update_webhook_subscription) | **PUT** /accounts/{accountId}/tollFreeVerification/webhooks/subscriptions/{id} | Update Webhook Subscription |


## create_webhook_subscription

> <WebhookSubscription> create_webhook_subscription(account_id, webhook_subscription_request_schema)

Create Webhook Subscription

Create a new webhook subscription (this webhook will be called for every update on every submission). In addition to a `callbackUrl`, this subscription can provide optional HTTP basic authentication credentials (a username and a password). The returned subscription object will contain an ID that can be used to modify or delete the subscription at a later time.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
webhook_subscription_request_schema = Bandwidth::WebhookSubscriptionRequestSchema.new({callback_url: 'https://www.example.com/path/to/resource'}) # WebhookSubscriptionRequestSchema | Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.

begin
  # Create Webhook Subscription
  result = api_instance.create_webhook_subscription(account_id, webhook_subscription_request_schema)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->create_webhook_subscription: #{e}"
end
```

#### Using the create_webhook_subscription_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSubscription>, Integer, Hash)> create_webhook_subscription_with_http_info(account_id, webhook_subscription_request_schema)

```ruby
begin
  # Create Webhook Subscription
  data, status_code, headers = api_instance.create_webhook_subscription_with_http_info(account_id, webhook_subscription_request_schema)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSubscription>
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->create_webhook_subscription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **webhook_subscription_request_schema** | [**WebhookSubscriptionRequestSchema**](WebhookSubscriptionRequestSchema.md) | Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to. |  |

### Return type

[**WebhookSubscription**](WebhookSubscription.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_webhook_subscription

> delete_webhook_subscription(account_id, id)

Delete Webhook Subscription

Delete a webhook subscription by ID.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
id = '7bt57JcsVYJrN9K1OcV1Nu' # String | Webhook subscription ID

begin
  # Delete Webhook Subscription
  api_instance.delete_webhook_subscription(account_id, id)
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->delete_webhook_subscription: #{e}"
end
```

#### Using the delete_webhook_subscription_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_webhook_subscription_with_http_info(account_id, id)

```ruby
begin
  # Delete Webhook Subscription
  data, status_code, headers = api_instance.delete_webhook_subscription_with_http_info(account_id, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->delete_webhook_subscription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **id** | **String** | Webhook subscription ID |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_toll_free_verification_status

> <TfvStatus> get_toll_free_verification_status(account_id, phone_number)

Get Toll-Free Verification Status

Gets the verification status for a phone number that is provisioned to your account. Submission information will be appended to the response if it is available.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
phone_number = '+18885555555' # String | Valid Toll-Free telephone number in E.164 format.

begin
  # Get Toll-Free Verification Status
  result = api_instance.get_toll_free_verification_status(account_id, phone_number)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->get_toll_free_verification_status: #{e}"
end
```

#### Using the get_toll_free_verification_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TfvStatus>, Integer, Hash)> get_toll_free_verification_status_with_http_info(account_id, phone_number)

```ruby
begin
  # Get Toll-Free Verification Status
  data, status_code, headers = api_instance.get_toll_free_verification_status_with_http_info(account_id, phone_number)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TfvStatus>
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->get_toll_free_verification_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **phone_number** | **String** | Valid Toll-Free telephone number in E.164 format. |  |

### Return type

[**TfvStatus**](TfvStatus.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_toll_free_use_cases

> Array&lt;String&gt; list_toll_free_use_cases

List Toll-Free Use Cases

Lists valid toll-free use cases.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new

begin
  # List Toll-Free Use Cases
  result = api_instance.list_toll_free_use_cases
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->list_toll_free_use_cases: #{e}"
end
```

#### Using the list_toll_free_use_cases_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;String&gt;, Integer, Hash)> list_toll_free_use_cases_with_http_info

```ruby
begin
  # List Toll-Free Use Cases
  data, status_code, headers = api_instance.list_toll_free_use_cases_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;String&gt;
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->list_toll_free_use_cases_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Array&lt;String&gt;**

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_webhook_subscriptions

> <WebhookSubscriptionsListBody> list_webhook_subscriptions(account_id)

List Webhook Subscriptions

Lists all webhook subscriptions that are registered to receive status updates for the toll-free verification requests submitted under this account (password will not be returned through this API If `basicAuthentication` is defined, the `password` property of that object will be null).

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.

begin
  # List Webhook Subscriptions
  result = api_instance.list_webhook_subscriptions(account_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->list_webhook_subscriptions: #{e}"
end
```

#### Using the list_webhook_subscriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSubscriptionsListBody>, Integer, Hash)> list_webhook_subscriptions_with_http_info(account_id)

```ruby
begin
  # List Webhook Subscriptions
  data, status_code, headers = api_instance.list_webhook_subscriptions_with_http_info(account_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSubscriptionsListBody>
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->list_webhook_subscriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |

### Return type

[**WebhookSubscriptionsListBody**](WebhookSubscriptionsListBody.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## request_toll_free_verification

> request_toll_free_verification(account_id, verification_request)

Request Toll-Free Verification

Submit a request for verification of a toll-free phone number.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
verification_request = Bandwidth::VerificationRequest.new({business_address: Bandwidth::Address.new({name: 'Bandwidth Inc.', addr1: '2230 Bandmate Way', city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.example.com/path/to/resource'}), business_contact: Bandwidth::Contact.new({first_name: 'John', last_name: 'Doe', email: 'foo@bar.com', phone_number: '+19192654500'}), message_volume: 10000, phone_numbers: ['+18005555555'], use_case: '2FA', use_case_summary: 'use_case_summary_example', production_message_content: 'production_message_content_example', opt_in_workflow: Bandwidth::OptInWorkflow.new({description: 'Opt In Flow', image_urls: ['https://www.example.com/path/to/resource']})}) # VerificationRequest | Request for verification of a toll-free phone number.

begin
  # Request Toll-Free Verification
  api_instance.request_toll_free_verification(account_id, verification_request)
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->request_toll_free_verification: #{e}"
end
```

#### Using the request_toll_free_verification_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> request_toll_free_verification_with_http_info(account_id, verification_request)

```ruby
begin
  # Request Toll-Free Verification
  data, status_code, headers = api_instance.request_toll_free_verification_with_http_info(account_id, verification_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->request_toll_free_verification_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **verification_request** | [**VerificationRequest**](VerificationRequest.md) | Request for verification of a toll-free phone number. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_toll_free_verification_request

> update_toll_free_verification_request(account_id, phone_number, tfv_submission_wrapper)

Update Toll-Free Verification Request

Updates a toll-free verification request. Submissions are only eligible for resubmission for 7 days within being processed and if resubmission is allowed (resubmitAllowed field is true).

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
phone_number = '+18885555555' # String | Valid Toll-Free telephone number in E.164 format.
tfv_submission_wrapper = Bandwidth::TfvSubmissionWrapper.new # TfvSubmissionWrapper | Update a request for verification of a toll-free phone number.

begin
  # Update Toll-Free Verification Request
  api_instance.update_toll_free_verification_request(account_id, phone_number, tfv_submission_wrapper)
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->update_toll_free_verification_request: #{e}"
end
```

#### Using the update_toll_free_verification_request_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_toll_free_verification_request_with_http_info(account_id, phone_number, tfv_submission_wrapper)

```ruby
begin
  # Update Toll-Free Verification Request
  data, status_code, headers = api_instance.update_toll_free_verification_request_with_http_info(account_id, phone_number, tfv_submission_wrapper)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->update_toll_free_verification_request_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **phone_number** | **String** | Valid Toll-Free telephone number in E.164 format. |  |
| **tfv_submission_wrapper** | [**TfvSubmissionWrapper**](TfvSubmissionWrapper.md) | Update a request for verification of a toll-free phone number. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_webhook_subscription

> <WebhookSubscription> update_webhook_subscription(account_id, id, webhook_subscription_request_schema)

Update Webhook Subscription

Update an existing webhook subscription (`callbackUrl` and `basicAuthentication` can be updated).

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::TollFreeVerificationApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
id = '7bt57JcsVYJrN9K1OcV1Nu' # String | Webhook subscription ID
webhook_subscription_request_schema = Bandwidth::WebhookSubscriptionRequestSchema.new({callback_url: 'https://www.example.com/path/to/resource'}) # WebhookSubscriptionRequestSchema | Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to.

begin
  # Update Webhook Subscription
  result = api_instance.update_webhook_subscription(account_id, id, webhook_subscription_request_schema)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->update_webhook_subscription: #{e}"
end
```

#### Using the update_webhook_subscription_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSubscription>, Integer, Hash)> update_webhook_subscription_with_http_info(account_id, id, webhook_subscription_request_schema)

```ruby
begin
  # Update Webhook Subscription
  data, status_code, headers = api_instance.update_webhook_subscription_with_http_info(account_id, id, webhook_subscription_request_schema)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSubscription>
rescue Bandwidth::ApiError => e
  puts "Error when calling TollFreeVerificationApi->update_webhook_subscription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **id** | **String** | Webhook subscription ID |  |
| **webhook_subscription_request_schema** | [**WebhookSubscriptionRequestSchema**](WebhookSubscriptionRequestSchema.md) | Information about a webhook that Bandwidth should send upon the completion of event customer is trying to subscribe to. |  |

### Return type

[**WebhookSubscription**](WebhookSubscription.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

