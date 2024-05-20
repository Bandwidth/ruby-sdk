# Bandwidth::RecordingTranscriptionMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The unique transcription ID | [optional] |
| **status** | **String** | The current status of the process. For recording, current possible values are &#39;processing&#39;, &#39;partial&#39;, &#39;complete&#39;, &#39;deleted&#39;, and &#39;error&#39;. For transcriptions, current possible values are &#39;none&#39;, &#39;processing&#39;, &#39;available&#39;, &#39;error&#39;, &#39;timeout&#39;, &#39;file-size-too-big&#39;, and &#39;file-size-too-small&#39;. Additional states may be added in the future, so your application must be tolerant of unknown values. | [optional] |
| **completed_time** | **String** | The time that the transcription was completed | [optional] |
| **url** | **String** | The URL of the [transcription](#operation/getCallTranscription) | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RecordingTranscriptionMetadata.new(
  id: t-387bd648-18f3-4823-9d16-746bca0003c9,
  status: completed,
  completed_time: 2022-06-13T18:46:29.715Z,
  url: https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/recordings/r-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85/transcription
)
```

