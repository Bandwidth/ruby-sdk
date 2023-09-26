# Bandwidth::CallsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_call**](CallsApi.md#create_call) | **POST** /accounts/{accountId}/calls | Create Call |
| [**get_call_state**](CallsApi.md#get_call_state) | **GET** /accounts/{accountId}/calls/{callId} | Get Call State Information |
| [**update_call**](CallsApi.md#update_call) | **POST** /accounts/{accountId}/calls/{callId} | Update Call |
| [**update_call_bxml**](CallsApi.md#update_call_bxml) | **PUT** /accounts/{accountId}/calls/{callId}/bxml | Update Call BXML |


## create_call

> <CreateCallResponse> create_call(account_id, create_call)

Create Call

Creates an outbound phone call.  All calls are initially queued. Your outbound calls will initiated at a specific dequeueing rate, enabling your application to \"fire and forget\" when creating calls. Queued calls may not be modified until they are dequeued and placed, but may be removed from your queue on demand.  <b>Please note:</b> Calls submitted to your queue will be placed approximately in order, but exact ordering is not guaranteed.

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

api_instance = Bandwidth::CallsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
create_call = Bandwidth::CreateCall.new({to: '+19195551234', from: '+19195554321', application_id: '1234-qwer-5679-tyui', answer_url: 'https://www.myCallbackServer.example/webhooks/answer'}) # CreateCall | JSON object containing information to create an outbound call

begin
  # Create Call
  result = api_instance.create_call(account_id, create_call)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->create_call: #{e}"
end
```

#### Using the create_call_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateCallResponse>, Integer, Hash)> create_call_with_http_info(account_id, create_call)

```ruby
begin
  # Create Call
  data, status_code, headers = api_instance.create_call_with_http_info(account_id, create_call)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateCallResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->create_call_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **create_call** | [**CreateCall**](CreateCall.md) | JSON object containing information to create an outbound call |  |

### Return type

[**CreateCallResponse**](CreateCallResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_call_state

> <CallState> get_call_state(account_id, call_id)

Get Call State Information

Retrieve the current state of a specific call. This information is near-realtime, so it may take a few minutes for your call to be accessible using this endpoint.  **Note**: Call information is kept for 7 days after the calls are hung up. If you attempt to retrieve information for a call that is older than 7 days, you will get an HTTP 404 response.

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

api_instance = Bandwidth::CallsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.

begin
  # Get Call State Information
  result = api_instance.get_call_state(account_id, call_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->get_call_state: #{e}"
end
```

#### Using the get_call_state_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CallState>, Integer, Hash)> get_call_state_with_http_info(account_id, call_id)

```ruby
begin
  # Get Call State Information
  data, status_code, headers = api_instance.get_call_state_with_http_info(account_id, call_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CallState>
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->get_call_state_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |

### Return type

[**CallState**](CallState.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_call

> update_call(account_id, call_id, update_call)

Update Call

Interrupts and redirects a call to a different URL that should return a BXML document.

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

api_instance = Bandwidth::CallsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
update_call = Bandwidth::UpdateCall.new # UpdateCall | JSON object containing information to redirect an existing call to a new BXML document

begin
  # Update Call
  api_instance.update_call(account_id, call_id, update_call)
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->update_call: #{e}"
end
```

#### Using the update_call_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_call_with_http_info(account_id, call_id, update_call)

```ruby
begin
  # Update Call
  data, status_code, headers = api_instance.update_call_with_http_info(account_id, call_id, update_call)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->update_call_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **update_call** | [**UpdateCall**](UpdateCall.md) | JSON object containing information to redirect an existing call to a new BXML document |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_call_bxml

> update_call_bxml(account_id, call_id, body)

Update Call BXML

Interrupts and replaces an active call's BXML document.

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

api_instance = Bandwidth::CallsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
body = '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Bxml>
  <SpeakSentence>This is a test sentence.</SpeakSentence>
</Bxml>' # String | 

begin
  # Update Call BXML
  api_instance.update_call_bxml(account_id, call_id, body)
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->update_call_bxml: #{e}"
end
```

#### Using the update_call_bxml_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_call_bxml_with_http_info(account_id, call_id, body)

```ruby
begin
  # Update Call BXML
  data, status_code, headers = api_instance.update_call_bxml_with_http_info(account_id, call_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling CallsApi->update_call_bxml_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **body** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/xml
- **Accept**: application/json

