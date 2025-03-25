# Bandwidth::ConferencesApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**download_conference_recording**](ConferencesApi.md#download_conference_recording) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId}/media | Download Conference Recording |
| [**get_conference**](ConferencesApi.md#get_conference) | **GET** /accounts/{accountId}/conferences/{conferenceId} | Get Conference Information |
| [**get_conference_member**](ConferencesApi.md#get_conference_member) | **GET** /accounts/{accountId}/conferences/{conferenceId}/members/{memberId} | Get Conference Member |
| [**get_conference_recording**](ConferencesApi.md#get_conference_recording) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings/{recordingId} | Get Conference Recording Information |
| [**list_conference_recordings**](ConferencesApi.md#list_conference_recordings) | **GET** /accounts/{accountId}/conferences/{conferenceId}/recordings | Get Conference Recordings |
| [**list_conferences**](ConferencesApi.md#list_conferences) | **GET** /accounts/{accountId}/conferences | Get Conferences |
| [**update_conference**](ConferencesApi.md#update_conference) | **POST** /accounts/{accountId}/conferences/{conferenceId} | Update Conference |
| [**update_conference_bxml**](ConferencesApi.md#update_conference_bxml) | **PUT** /accounts/{accountId}/conferences/{conferenceId}/bxml | Update Conference BXML |
| [**update_conference_member**](ConferencesApi.md#update_conference_member) | **PUT** /accounts/{accountId}/conferences/{conferenceId}/members/{memberId} | Update Conference Member |


## download_conference_recording

> File download_conference_recording(account_id, conference_id, recording_id)

Download Conference Recording

Downloads the specified recording file.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Download Conference Recording
  result = api_instance.download_conference_recording(account_id, conference_id, recording_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->download_conference_recording: #{e}"
end
```

#### Using the download_conference_recording_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> download_conference_recording_with_http_info(account_id, conference_id, recording_id)

```ruby
begin
  # Download Conference Recording
  data, status_code, headers = api_instance.download_conference_recording_with_http_info(account_id, conference_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->download_conference_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

**File**

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: audio/vnd.wave, audio/mpeg, application/json


## get_conference

> <Conference> get_conference(account_id, conference_id)

Get Conference Information

Returns information about the specified conference.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.

begin
  # Get Conference Information
  result = api_instance.get_conference(account_id, conference_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference: #{e}"
end
```

#### Using the get_conference_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Conference>, Integer, Hash)> get_conference_with_http_info(account_id, conference_id)

```ruby
begin
  # Get Conference Information
  data, status_code, headers = api_instance.get_conference_with_http_info(account_id, conference_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Conference>
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |

### Return type

[**Conference**](Conference.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_conference_member

> <ConferenceMember> get_conference_member(account_id, conference_id, member_id)

Get Conference Member

Returns information about the specified conference member.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
member_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Conference Member ID.

begin
  # Get Conference Member
  result = api_instance.get_conference_member(account_id, conference_id, member_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference_member: #{e}"
end
```

#### Using the get_conference_member_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConferenceMember>, Integer, Hash)> get_conference_member_with_http_info(account_id, conference_id, member_id)

```ruby
begin
  # Get Conference Member
  data, status_code, headers = api_instance.get_conference_member_with_http_info(account_id, conference_id, member_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConferenceMember>
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **member_id** | **String** | Programmable Voice API Conference Member ID. |  |

### Return type

[**ConferenceMember**](ConferenceMember.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_conference_recording

> <ConferenceRecordingMetadata> get_conference_recording(account_id, conference_id, recording_id)

Get Conference Recording Information

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
recording_id = 'r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Recording ID.

begin
  # Get Conference Recording Information
  result = api_instance.get_conference_recording(account_id, conference_id, recording_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference_recording: #{e}"
end
```

#### Using the get_conference_recording_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConferenceRecordingMetadata>, Integer, Hash)> get_conference_recording_with_http_info(account_id, conference_id, recording_id)

```ruby
begin
  # Get Conference Recording Information
  data, status_code, headers = api_instance.get_conference_recording_with_http_info(account_id, conference_id, recording_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConferenceRecordingMetadata>
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->get_conference_recording_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **recording_id** | **String** | Programmable Voice API Recording ID. |  |

### Return type

[**ConferenceRecordingMetadata**](ConferenceRecordingMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conference_recordings

> <Array<ConferenceRecordingMetadata>> list_conference_recordings(account_id, conference_id)

Get Conference Recordings

Returns a (potentially empty) list of metadata for the recordings that took place during the specified conference.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.

begin
  # Get Conference Recordings
  result = api_instance.list_conference_recordings(account_id, conference_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->list_conference_recordings: #{e}"
end
```

#### Using the list_conference_recordings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ConferenceRecordingMetadata>>, Integer, Hash)> list_conference_recordings_with_http_info(account_id, conference_id)

```ruby
begin
  # Get Conference Recordings
  data, status_code, headers = api_instance.list_conference_recordings_with_http_info(account_id, conference_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ConferenceRecordingMetadata>>
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->list_conference_recordings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |

### Return type

[**Array&lt;ConferenceRecordingMetadata&gt;**](ConferenceRecordingMetadata.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conferences

> <Array<Conference>> list_conferences(account_id, opts)

Get Conferences

Returns a max of 1000 conferences, sorted by `createdTime` from oldest to newest.  **NOTE:** If the number of conferences in the account is bigger than `pageSize`, a `Link` header (with format `<{url}>; rel=\"next\"`) will be returned in the response. The url can be used to retrieve the next page of conference records.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
opts = {
  name: 'my-custom-name', # String | Filter results by the `name` field.
  min_created_time: '2022-06-21T19:13:21Z', # String | Filter results to conferences which have a `createdTime` after or at `minCreatedTime` (in ISO8601 format).
  max_created_time: '2022-06-21T19:13:21Z', # String | Filter results to conferences which have a `createdTime` before or at `maxCreatedTime` (in ISO8601 format).
  page_size: 500, # Integer | Specifies the max number of conferences that will be returned.
  page_token: 'eyJwYWdlVG9rZW4iOiJ0b2tlbiJ9' # String | Not intended for explicit use. To use pagination, follow the links in the `Link` header of the response, as indicated in the endpoint description.
}

begin
  # Get Conferences
  result = api_instance.list_conferences(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->list_conferences: #{e}"
end
```

#### Using the list_conferences_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Conference>>, Integer, Hash)> list_conferences_with_http_info(account_id, opts)

```ruby
begin
  # Get Conferences
  data, status_code, headers = api_instance.list_conferences_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Conference>>
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->list_conferences_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **name** | **String** | Filter results by the &#x60;name&#x60; field. | [optional] |
| **min_created_time** | **String** | Filter results to conferences which have a &#x60;createdTime&#x60; after or at &#x60;minCreatedTime&#x60; (in ISO8601 format). | [optional] |
| **max_created_time** | **String** | Filter results to conferences which have a &#x60;createdTime&#x60; before or at &#x60;maxCreatedTime&#x60; (in ISO8601 format). | [optional] |
| **page_size** | **Integer** | Specifies the max number of conferences that will be returned. | [optional][default to 1000] |
| **page_token** | **String** | Not intended for explicit use. To use pagination, follow the links in the &#x60;Link&#x60; header of the response, as indicated in the endpoint description. | [optional] |

### Return type

[**Array&lt;Conference&gt;**](Conference.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_conference

> update_conference(account_id, conference_id, update_conference)

Update Conference

Update the conference state.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
update_conference = Bandwidth::UpdateConference.new # UpdateConference | 

begin
  # Update Conference
  api_instance.update_conference(account_id, conference_id, update_conference)
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference: #{e}"
end
```

#### Using the update_conference_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_conference_with_http_info(account_id, conference_id, update_conference)

```ruby
begin
  # Update Conference
  data, status_code, headers = api_instance.update_conference_with_http_info(account_id, conference_id, update_conference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **update_conference** | [**UpdateConference**](UpdateConference.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_conference_bxml

> update_conference_bxml(account_id, conference_id, body)

Update Conference BXML

Update the conference BXML document.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
body = '<?xml version="1.0" encoding="UTF-8"?>
<Bxml>
    <StopRecording/>
</Bxml>' # String | 

begin
  # Update Conference BXML
  api_instance.update_conference_bxml(account_id, conference_id, body)
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference_bxml: #{e}"
end
```

#### Using the update_conference_bxml_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_conference_bxml_with_http_info(account_id, conference_id, body)

```ruby
begin
  # Update Conference BXML
  data, status_code, headers = api_instance.update_conference_bxml_with_http_info(account_id, conference_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference_bxml_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **body** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/xml
- **Accept**: application/json


## update_conference_member

> update_conference_member(account_id, conference_id, member_id, update_conference_member)

Update Conference Member

Updates settings for a particular conference member.

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

api_instance = Bandwidth::ConferencesApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
conference_id = 'conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9' # String | Programmable Voice API Conference ID.
member_id = 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | Programmable Voice API Conference Member ID.
update_conference_member = Bandwidth::UpdateConferenceMember.new # UpdateConferenceMember | 

begin
  # Update Conference Member
  api_instance.update_conference_member(account_id, conference_id, member_id, update_conference_member)
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference_member: #{e}"
end
```

#### Using the update_conference_member_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_conference_member_with_http_info(account_id, conference_id, member_id, update_conference_member)

```ruby
begin
  # Update Conference Member
  data, status_code, headers = api_instance.update_conference_member_with_http_info(account_id, conference_id, member_id, update_conference_member)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling ConferencesApi->update_conference_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **conference_id** | **String** | Programmable Voice API Conference ID. |  |
| **member_id** | **String** | Programmable Voice API Conference Member ID. |  |
| **update_conference_member** | [**UpdateConferenceMember**](UpdateConferenceMember.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

