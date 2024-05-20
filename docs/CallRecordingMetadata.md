# Bandwidth::CallRecordingMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **application_id** | **String** | The id of the application associated with the call. | [optional] |
| **account_id** | **String** | The user account associated with the call. | [optional] |
| **call_id** | **String** | The call id associated with the event. | [optional] |
| **parent_call_id** | **String** | (optional) If the event is related to the B leg of a &lt;Transfer&gt;, the call id of the original call leg that executed the &lt;Transfer&gt;. Otherwise, this field will not be present. | [optional] |
| **recording_id** | **String** | The unique ID of this recording | [optional] |
| **to** | **String** | The phone number that received the call, in E.164 format (e.g. +15555555555). | [optional] |
| **from** | **String** | The provided identifier of the caller: can be a phone number in E.164 format (e.g. +15555555555) or one of Private, Restricted, Unavailable, or Anonymous. | [optional] |
| **transfer_caller_id** | **String** | The phone number used as the from field of the B-leg call, in E.164 format (e.g. +15555555555) or one of Restricted, Anonymous, Private, or Unavailable. | [optional] |
| **transfer_to** | **String** | The phone number used as the to field of the B-leg call, in E.164 format (e.g. +15555555555). | [optional] |
| **duration** | **String** | The duration of the recording in ISO-8601 format | [optional] |
| **direction** | [**CallDirectionEnum**](CallDirectionEnum.md) |  | [optional] |
| **channels** | **Integer** | Always &#x60;1&#x60; for conference recordings; multi-channel recordings are not supported on conferences. | [optional] |
| **start_time** | **Time** | Time the call was started, in ISO 8601 format. | [optional] |
| **end_time** | **Time** | The time that the recording ended in ISO-8601 format | [optional] |
| **file_format** | [**FileFormatEnum**](FileFormatEnum.md) |  | [optional] |
| **status** | **String** | The current status of the process. For recording, current possible values are &#39;processing&#39;, &#39;partial&#39;, &#39;complete&#39;, &#39;deleted&#39;, and &#39;error&#39;. For transcriptions, current possible values are &#39;none&#39;, &#39;processing&#39;, &#39;available&#39;, &#39;error&#39;, &#39;timeout&#39;, &#39;file-size-too-big&#39;, and &#39;file-size-too-small&#39;. Additional states may be added in the future, so your application must be tolerant of unknown values. | [optional] |
| **media_url** | **String** | The URL that can be used to download the recording. Only present if the recording is finished and may be downloaded. | [optional] |
| **transcription** | [**RecordingTranscriptionMetadata**](RecordingTranscriptionMetadata.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CallRecordingMetadata.new(
  application_id: 04e88489-df02-4e34-a0ee-27a91849555f,
  account_id: 920012,
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  parent_call_id: c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d,
  recording_id: r-fbe05094-9fd2afe9-bf5b-4c68-820a-41a01c1c5833,
  to: +15555555555,
  from: +15555555555,
  transfer_caller_id: +15555555555,
  transfer_to: +15555555555),
  duration: PT13.67S,
  direction: null,
  channels: 1,
  start_time: 2022-06-17T22:19:40.375Z,
  end_time: 2022-06-17T22:20Z,
  file_format: null,
  status: completed,
  media_url: https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9/recordings/r-fbe05094-9fd2afe9-bf5b-4c68-820a-41a01c1c5833/media,
  transcription: null
)
```

