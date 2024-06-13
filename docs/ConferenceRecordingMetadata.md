# Bandwidth::ConferenceRecordingMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The user account associated with the call. | [optional] |
| **conference_id** | **String** | The unique, Bandwidth-generated ID of the conference that was recorded | [optional] |
| **name** | **String** | The user-specified name of the conference that was recorded | [optional] |
| **recording_id** | **String** | The unique ID of this recording | [optional] |
| **duration** | **String** | The duration of the recording in ISO-8601 format | [optional] |
| **channels** | **Integer** | Always &#x60;1&#x60; for conference recordings; multi-channel recordings are not supported on conferences. | [optional] |
| **start_time** | **Time** | Time the call was started, in ISO 8601 format. | [optional] |
| **end_time** | **Time** | The time that the recording ended in ISO-8601 format | [optional] |
| **file_format** | [**FileFormatEnum**](FileFormatEnum.md) |  | [optional] |
| **status** | **String** | The current status of the process. For recording, current possible values are &#39;processing&#39;, &#39;partial&#39;, &#39;complete&#39;, &#39;deleted&#39;, and &#39;error&#39;. For transcriptions, current possible values are &#39;none&#39;, &#39;processing&#39;, &#39;available&#39;, &#39;error&#39;, &#39;timeout&#39;, &#39;file-size-too-big&#39;, and &#39;file-size-too-small&#39;. Additional states may be added in the future, so your application must be tolerant of unknown values. | [optional] |
| **media_url** | **String** | The URL that can be used to download the recording. Only present if the recording is finished and may be downloaded. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ConferenceRecordingMetadata.new(
  account_id: 9900000,
  conference_id: conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9,
  name: my-conference-name,
  recording_id: r-fbe05094-9fd2afe9-bf5b-4c68-820a-41a01c1c5833,
  duration: PT13.67S,
  channels: 1,
  start_time: 2022-06-17T22:19:40.375Z,
  end_time: 2022-06-17T22:20Z,
  file_format: null,
  status: completed,
  media_url: https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9/recordings/r-fbe05094-9fd2afe9-bf5b-4c68-820a-41a01c1c5833/media
)
```

