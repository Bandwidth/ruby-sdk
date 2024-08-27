# Bandwidth::MessagesApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_message**](MessagesApi.md#create_message) | **POST** /users/{accountId}/messages | Create Message |
| [**list_messages**](MessagesApi.md#list_messages) | **GET** /users/{accountId}/messages | List Messages |


## create_message

> <Message> create_message(account_id, message_request)

Create Message

Endpoint for sending text messages and picture messages using V2 messaging.

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

api_instance = Bandwidth::MessagesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
message_request = Bandwidth::MessageRequest.new({application_id: '93de2206-9669-4e07-948d-329f4b722ee2', to: ["+15554443333", "+15552223333"], from: '+15551113333'}) # MessageRequest | 

begin
  # Create Message
  result = api_instance.create_message(account_id, message_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MessagesApi->create_message: #{e}"
end
```

#### Using the create_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Message>, Integer, Hash)> create_message_with_http_info(account_id, message_request)

```ruby
begin
  # Create Message
  data, status_code, headers = api_instance.create_message_with_http_info(account_id, message_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Message>
rescue Bandwidth::ApiError => e
  puts "Error when calling MessagesApi->create_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **message_request** | [**MessageRequest**](MessageRequest.md) |  |  |

### Return type

[**Message**](Message.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_messages

> <MessagesList> list_messages(account_id, opts)

List Messages

Returns a list of messages based on query parameters.

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

api_instance = Bandwidth::MessagesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
opts = {
  message_id: '9e0df4ca-b18d-40d7-a59f-82fcdf5ae8e6', # String | The ID of the message to search for. Special characters need to be encoded using URL encoding. Message IDs could come in different formats, e.g., 9e0df4ca-b18d-40d7-a59f-82fcdf5ae8e6 and 1589228074636lm4k2je7j7jklbn2 are valid message ID formats. Note that you must include at least one query parameter.
  source_tn: '%2B15554443333', # String | The phone number that sent the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. '%2B1919').
  destination_tn: '%2B15554443333', # String | The phone number that received the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. '%2B1919').
  message_status: Bandwidth::MessageStatusEnum::RECEIVED, # MessageStatusEnum | The status of the message. One of RECEIVED QUEUED SENDING SENT FAILED DELIVERED ACCEPTED UNDELIVERED.
  message_direction: Bandwidth::ListMessageDirectionEnum::INBOUND, # ListMessageDirectionEnum | The direction of the message. One of INBOUND OUTBOUND.
  carrier_name: 'Verizon', # String | The name of the carrier used for this message. Possible values include but are not limited to Verizon and TMobile. Special characters need to be encoded using URL encoding (i.e. AT&T should be passed as AT%26T).
  message_type: Bandwidth::MessageTypeEnum::SMS, # MessageTypeEnum | The type of message. Either sms or mms.
  error_code: 9902, # Integer | The error code of the message.
  from_date_time: '2022-09-14T18:20:16.000Z', # String | The start of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days.
  to_date_time: '2022-09-14T18:20:16.000Z', # String | The end of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days.
  campaign_id: 'CJEUMDK', # String | The campaign ID of the message.
  sort: 'sourceTn:desc', # String | The field and direction to sort by combined with a colon. Direction is either asc or desc.
  page_token: 'gdEewhcJLQRB5', # String | A base64 encoded value used for pagination of results.
  limit: 50, # Integer | The maximum records requested in search result. Default 100. The sum of limit and after cannot be more than 10000.
  limit_total_count: true, # Boolean | When set to true, the response's totalCount field will have a maximum value of 10,000. When set to false, or excluded, this will give an accurate totalCount of all messages that match the provided filters. If you are experiencing latency, try using this parameter to limit your results.
  region: Bandwidth::Region::US # Region | The region to search in. One of US or EU.
}

begin
  # List Messages
  result = api_instance.list_messages(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MessagesApi->list_messages: #{e}"
end
```

#### Using the list_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> list_messages_with_http_info(account_id, opts)

```ruby
begin
  # List Messages
  data, status_code, headers = api_instance.list_messages_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue Bandwidth::ApiError => e
  puts "Error when calling MessagesApi->list_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **message_id** | **String** | The ID of the message to search for. Special characters need to be encoded using URL encoding. Message IDs could come in different formats, e.g., 9e0df4ca-b18d-40d7-a59f-82fcdf5ae8e6 and 1589228074636lm4k2je7j7jklbn2 are valid message ID formats. Note that you must include at least one query parameter. | [optional] |
| **source_tn** | **String** | The phone number that sent the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. &#39;%2B1919&#39;). | [optional] |
| **destination_tn** | **String** | The phone number that received the message. Accepted values are: a single full phone number a comma separated list of full phone numbers (maximum of 10) or a single partial phone number (minimum of 5 characters e.g. &#39;%2B1919&#39;). | [optional] |
| **message_status** | [**MessageStatusEnum**](.md) | The status of the message. One of RECEIVED QUEUED SENDING SENT FAILED DELIVERED ACCEPTED UNDELIVERED. | [optional] |
| **message_direction** | [**ListMessageDirectionEnum**](.md) | The direction of the message. One of INBOUND OUTBOUND. | [optional] |
| **carrier_name** | **String** | The name of the carrier used for this message. Possible values include but are not limited to Verizon and TMobile. Special characters need to be encoded using URL encoding (i.e. AT&amp;T should be passed as AT%26T). | [optional] |
| **message_type** | [**MessageTypeEnum**](.md) | The type of message. Either sms or mms. | [optional] |
| **error_code** | **Integer** | The error code of the message. | [optional] |
| **from_date_time** | **String** | The start of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days. | [optional] |
| **to_date_time** | **String** | The end of the date range to search in ISO 8601 format. Uses the message receive time. The date range to search in is currently 14 days. | [optional] |
| **campaign_id** | **String** | The campaign ID of the message. | [optional] |
| **sort** | **String** | The field and direction to sort by combined with a colon. Direction is either asc or desc. | [optional] |
| **page_token** | **String** | A base64 encoded value used for pagination of results. | [optional] |
| **limit** | **Integer** | The maximum records requested in search result. Default 100. The sum of limit and after cannot be more than 10000. | [optional] |
| **limit_total_count** | **Boolean** | When set to true, the response&#39;s totalCount field will have a maximum value of 10,000. When set to false, or excluded, this will give an accurate totalCount of all messages that match the provided filters. If you are experiencing latency, try using this parameter to limit your results. | [optional] |
| **region** | [**Region**](.md) | The region to search in. One of US or EU. | [optional][default to &#39;US&#39;] |

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

