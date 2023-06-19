# Bandwidth::RecordingsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_call_transcription**](RecordingsApi.md#delete_call_transcription) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Delete Transcription |
| [**delete_recording**](RecordingsApi.md#delete_recording) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId} | Delete Recording |
| [**delete_recording_media**](RecordingsApi.md#delete_recording_media) | **DELETE** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media | Delete Recording Media |
| [**download_call_recording**](RecordingsApi.md#download_call_recording) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/media | Download Recording |
| [**get_call_recording**](RecordingsApi.md#get_call_recording) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId} | Get Call Recording |
| [**get_call_transcription**](RecordingsApi.md#get_call_transcription) | **GET** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Get Transcription |
| [**list_account_call_recordings**](RecordingsApi.md#list_account_call_recordings) | **GET** /accounts/{accountId}/recordings | Get Call Recordings |
| [**list_call_recordings**](RecordingsApi.md#list_call_recordings) | **GET** /accounts/{accountId}/calls/{callId}/recordings | List Call Recordings |
| [**transcribe_call_recording**](RecordingsApi.md#transcribe_call_recording) | **POST** /accounts/{accountId}/calls/{callId}/recordings/{recordingId}/transcription | Create Transcription Request |
| [**update_call_recording_state**](RecordingsApi.md#update_call_recording_state) | **PUT** /accounts/{accountId}/calls/{callId}/recording | Update Recording |


## delete_call_transcription

> delete_call_transcription(account_id, call_id, recording_id)

Delete Transcription

Deletes the specified recording's transcription.  Note: After the deletion is requested and a `204` is returned, the transcription will not be accessible anymore. However, it is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Delete Transcription
  api_instance.delete_call_transcription(account_id, call_id, recording_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_call_transcription: #{e}"
end
```

#### Using the delete_call_transcription_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_call_transcription_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Delete Transcription
  data, status_code, headers = api_instance.delete_call_transcription_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_call_transcription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_recording

> delete_recording(account_id, call_id, recording_id)

Delete Recording

Delete the recording information, media and transcription.  Note: After the deletion is requested and a `204` is returned, neither the recording metadata nor the actual media nor its transcription will be accessible anymore. However, the media of the specified recording is not deleted immediately. This deletion process, while transparent and irreversible, can take an additional 24 to 48 hours.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Delete Recording
  api_instance.delete_recording(account_id, call_id, recording_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_recording: #{e}"
end
```

#### Using the delete_recording_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_recording_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Delete Recording
  data, status_code, headers = api_instance.delete_recording_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_recording_media

> delete_recording_media(account_id, call_id, recording_id)

Delete Recording Media

Deletes the specified recording's media.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Delete Recording Media
  api_instance.delete_recording_media(account_id, call_id, recording_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_recording_media: #{e}"
end
```

#### Using the delete_recording_media_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_recording_media_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Delete Recording Media
  data, status_code, headers = api_instance.delete_recording_media_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->delete_recording_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## download_call_recording

> File download_call_recording(account_id, call_id, recording_id)

Download Recording

Downloads the specified recording.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Download Recording
  result = api_instance.download_call_recording(account_id, call_id, recording_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->download_call_recording: #{e}"
end
```

#### Using the download_call_recording_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> download_call_recording_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Download Recording
  data, status_code, headers = api_instance.download_call_recording_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->download_call_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

**File**

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: audio/vnd.wave, audio/mpeg, application/json


## get_call_recording

> <CallRecordingMetadata> get_call_recording(account_id, call_id, recording_id)

Get Call Recording

Returns metadata for the specified recording.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Get Call Recording
  result = api_instance.get_call_recording(account_id, call_id, recording_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->get_call_recording: #{e}"
end
```

#### Using the get_call_recording_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CallRecordingMetadata>, Integer, Hash)> get_call_recording_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Get Call Recording
  data, status_code, headers = api_instance.get_call_recording_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CallRecordingMetadata>
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->get_call_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

[**CallRecordingMetadata**](CallRecordingMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_call_transcription

> <TranscriptionList> get_call_transcription(account_id, call_id, recording_id)

Get Transcription

Downloads the specified transcription.  If the transcribed recording was multi-channel, then there will be 2 transcripts. The caller/called party transcript will be the first item while [`<PlayAudio>`](/docs/voice/bxml/playAudio) and [`<SpeakSentence>`](/docs/voice/bxml/speakSentence) transcript will be the second item. During a [`<Transfer>`](/docs/voice/bxml/transfer) the A-leg transcript will be the first item while the B-leg transcript will be the second item.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Get Transcription
  result = api_instance.get_call_transcription(account_id, call_id, recording_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->get_call_transcription: #{e}"
end
```

#### Using the get_call_transcription_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TranscriptionList>, Integer, Hash)> get_call_transcription_with_http_info(account_id, call_id, recording_id)

```ruby
begin
  # Get Transcription
  data, status_code, headers = api_instance.get_call_transcription_with_http_info(account_id, call_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TranscriptionList>
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->get_call_transcription_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

[**TranscriptionList**](TranscriptionList.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_account_call_recordings

> <Array<CallRecordingMetadata>> list_account_call_recordings(account_id, opts)

Get Call Recordings

Returns a list of metadata for the recordings associated with the specified account. The list can be filtered by the optional from, to, minStartTime, and maxStartTime arguments. The list is capped at 1000 entries and may be empty if no recordings match the specified criteria.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
opts = {
  to: '%2b19195551234', # String | Filter results by the `to` field.
  from: '%2b19195554321', # String | Filter results by the `from` field.
  min_start_time: '2022-06-21T19:13:21Z', # String | Filter results to recordings which have a `startTime` after or including `minStartTime` (in ISO8601 format).
  max_start_time: '2022-06-21T19:13:21Z' # String | Filter results to recordings which have a `startTime` before `maxStartTime` (in ISO8601 format).
}

begin
  # Get Call Recordings
  result = api_instance.list_account_call_recordings(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->list_account_call_recordings: #{e}"
end
```

#### Using the list_account_call_recordings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<CallRecordingMetadata>>, Integer, Hash)> list_account_call_recordings_with_http_info(account_id, opts)

```ruby
begin
  # Get Call Recordings
  data, status_code, headers = api_instance.list_account_call_recordings_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<CallRecordingMetadata>>
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->list_account_call_recordings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **to** | **String** | Filter results by the &#x60;to&#x60; field. | [optional] |
| **from** | **String** | Filter results by the &#x60;from&#x60; field. | [optional] |
| **min_start_time** | **String** | Filter results to recordings which have a &#x60;startTime&#x60; after or including &#x60;minStartTime&#x60; (in ISO8601 format). | [optional] |
| **max_start_time** | **String** | Filter results to recordings which have a &#x60;startTime&#x60; before &#x60;maxStartTime&#x60; (in ISO8601 format). | [optional] |

### Return type

[**Array&lt;CallRecordingMetadata&gt;**](CallRecordingMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_call_recordings

> <Array<CallRecordingMetadata>> list_call_recordings(account_id, call_id)

List Call Recordings

Returns a (potentially empty) list of metadata for the recordings that took place during the specified call.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.

begin
  # List Call Recordings
  result = api_instance.list_call_recordings(account_id, call_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->list_call_recordings: #{e}"
end
```

#### Using the list_call_recordings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<CallRecordingMetadata>>, Integer, Hash)> list_call_recordings_with_http_info(account_id, call_id)

```ruby
begin
  # List Call Recordings
  data, status_code, headers = api_instance.list_call_recordings_with_http_info(account_id, call_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<CallRecordingMetadata>>
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->list_call_recordings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |

### Return type

[**Array&lt;CallRecordingMetadata&gt;**](CallRecordingMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## transcribe_call_recording

> transcribe_call_recording(account_id, call_id, recording_id, transcribe_recording)

Create Transcription Request

Generate the transcription for a specific recording. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.
transcribe_recording = Bandwidth::TranscribeRecording.new # TranscribeRecording | 

begin
  # Create Transcription Request
  api_instance.transcribe_call_recording(account_id, call_id, recording_id, transcribe_recording)
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->transcribe_call_recording: #{e}"
end
```

#### Using the transcribe_call_recording_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> transcribe_call_recording_with_http_info(account_id, call_id, recording_id, transcribe_recording)

```ruby
begin
  # Create Transcription Request
  data, status_code, headers = api_instance.transcribe_call_recording_with_http_info(account_id, call_id, recording_id, transcribe_recording)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->transcribe_call_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |
| **transcribe_recording** | [**TranscribeRecording**](TranscribeRecording.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_call_recording_state

> update_call_recording_state(account_id, call_id, update_call_recording)

Update Recording

Pause or resume a recording on an active phone call.

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

api_instance = Bandwidth::RecordingsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
call_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Call ID.
update_call_recording = Bandwidth::UpdateCallRecording.new({state: Bandwidth::RecordingStateEnum::PAUSED}) # UpdateCallRecording | 

begin
  # Update Recording
  api_instance.update_call_recording_state(account_id, call_id, update_call_recording)
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->update_call_recording_state: #{e}"
end
```

#### Using the update_call_recording_state_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_call_recording_state_with_http_info(account_id, call_id, update_call_recording)

```ruby
begin
  # Update Recording
  data, status_code, headers = api_instance.update_call_recording_state_with_http_info(account_id, call_id, update_call_recording)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling RecordingsApi->update_call_recording_state_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **call_id** | **String** | Programmable Voice API Call ID. |  |
| **update_call_recording** | [**UpdateCallRecording**](UpdateCallRecording.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

