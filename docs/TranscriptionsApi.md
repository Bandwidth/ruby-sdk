# Bandwidth::TranscriptionsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_real_time_transcription**](TranscriptionsApi.md#delete_real_time_transcription) | **DELETE** /accounts/{accountId}/calls/{callId}/transcriptions/{transcriptionId} | Delete a specific transcription |
| [**get_real_time_transcription**](TranscriptionsApi.md#get_real_time_transcription) | **GET** /accounts/{accountId}/calls/{callId}/transcriptions/{transcriptionId} | Retrieve a specific transcription |
| [**list_real_time_transcriptions**](TranscriptionsApi.md#list_real_time_transcriptions) | **GET** /accounts/{accountId}/calls/{callId}/transcriptions | Enumerate transcriptions made with StartTranscription |


## delete_real_time_transcription

> delete_real_time_transcription(account_id, call_id, transcription_id)

Delete a specific transcription

Delete the specified transcription that was created on this call via [startTranscription](/docs/voice/bxml/startTranscription).  Note: After the deletion is requested and a `204` is returned, the transcription will not be accessible anymore. However, it is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.

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

api_instance = Bandwidth::TranscriptionsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
transcription_id = 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Transcription ID.

begin
  # Delete a specific transcription
  api_instance.delete_real_time_transcription(account_id, call_id, transcription_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->delete_real_time_transcription: #{e}"
end
```

#### Using the delete_real_time_transcription_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_real_time_transcription_with_http_info(account_id, call_id, transcription_id)

```ruby
begin
  # Delete a specific transcription
  data, status_code, headers = api_instance.delete_real_time_transcription_with_http_info(account_id, call_id, transcription_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->delete_real_time_transcription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **transcription_id** | **String** | Programmable Voice API Transcription ID. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_real_time_transcription

> <CallTranscriptionResponse> get_real_time_transcription(account_id, call_id, transcription_id)

Retrieve a specific transcription

Retrieve the specified transcription that was created on this call via [startTranscription](/docs/voice/bxml/startTranscription).

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

api_instance = Bandwidth::TranscriptionsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
transcription_id = 't-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Transcription ID.

begin
  # Retrieve a specific transcription
  result = api_instance.get_real_time_transcription(account_id, call_id, transcription_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->get_real_time_transcription: #{e}"
end
```

#### Using the get_real_time_transcription_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CallTranscriptionResponse>, Integer, Hash)> get_real_time_transcription_with_http_info(account_id, call_id, transcription_id)

```ruby
begin
  # Retrieve a specific transcription
  data, status_code, headers = api_instance.get_real_time_transcription_with_http_info(account_id, call_id, transcription_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CallTranscriptionResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->get_real_time_transcription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **transcription_id** | **String** | Programmable Voice API Transcription ID. |  |

### Return type

[**CallTranscriptionResponse**](CallTranscriptionResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_real_time_transcriptions

> <Array<CallTranscriptionMetadata>> list_real_time_transcriptions(account_id, call_id)

Enumerate transcriptions made with StartTranscription

Enumerates the transcriptions created on this call via [startTranscription](/docs/voice/bxml/startTranscription).

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

api_instance = Bandwidth::TranscriptionsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.

begin
  # Enumerate transcriptions made with StartTranscription
  result = api_instance.list_real_time_transcriptions(account_id, call_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->list_real_time_transcriptions: #{e}"
end
```

#### Using the list_real_time_transcriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<CallTranscriptionMetadata>>, Integer, Hash)> list_real_time_transcriptions_with_http_info(account_id, call_id)

```ruby
begin
  # Enumerate transcriptions made with StartTranscription
  data, status_code, headers = api_instance.list_real_time_transcriptions_with_http_info(account_id, call_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<CallTranscriptionMetadata>>
rescue Bandwidth::ApiError => e
  puts "Error when calling TranscriptionsApi->list_real_time_transcriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |

### Return type

[**Array&lt;CallTranscriptionMetadata&gt;**](CallTranscriptionMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

