# Bandwidth::MultiChannelApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_multi_channel_message**](MultiChannelApi.md#create_multi_channel_message) | **POST** /users/{accountId}/messages/multiChannel | Create Multi-Channel Message |


## create_multi_channel_message

> <CreateMultiChannelMessageResponse> create_multi_channel_message(account_id, multi_channel_message_request)

Create Multi-Channel Message

Endpoint for sending Multi-Channel messages.

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

api_instance = Bandwidth::MultiChannelApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
multi_channel_message_request = Bandwidth::MultiChannelMessageRequest.new({to: '+15552223333', channel_list: [Bandwidth::MultiChannelChannelListRequestObject.new({from: 'BandwidthRBM', application_id: '93de2206-9669-4e07-948d-329f4b722ee2', channel: Bandwidth::MultiChannelMessageChannelEnum::RBM, content: Bandwidth::MmsMessageContent.new})]}) # MultiChannelMessageRequest | 

begin
  # Create Multi-Channel Message
  result = api_instance.create_multi_channel_message(account_id, multi_channel_message_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MultiChannelApi->create_multi_channel_message: #{e}"
end
```

#### Using the create_multi_channel_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateMultiChannelMessageResponse>, Integer, Hash)> create_multi_channel_message_with_http_info(account_id, multi_channel_message_request)

```ruby
begin
  # Create Multi-Channel Message
  data, status_code, headers = api_instance.create_multi_channel_message_with_http_info(account_id, multi_channel_message_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateMultiChannelMessageResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling MultiChannelApi->create_multi_channel_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **multi_channel_message_request** | [**MultiChannelMessageRequest**](MultiChannelMessageRequest.md) |  |  |

### Return type

[**CreateMultiChannelMessageResponse**](CreateMultiChannelMessageResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

