# Bandwidth::RecordingTranscriptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transcripts** | [**Array&lt;Transcription&gt;**](Transcription.md) |  | [optional] |
| **clips** | [**Array&lt;RecordingTranscriptionClip&gt;**](RecordingTranscriptionClip.md) | A list of individual speech clips with speaker, timing, and confidence information. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RecordingTranscriptions.new(
  transcripts: null,
  clips: null
)
```

