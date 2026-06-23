# Bandwidth::RecordingTranscriptionClip

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **speaker** | **Integer** | Zero-based index identifying the speaker. | [optional] |
| **text** | **String** | The transcribed text of this clip. | [optional] |
| **confidence** | **Float** | How confident the transcription engine was in transcribing this clip (from &#x60;0.0&#x60; to &#x60;1.0&#x60;). | [optional] |
| **start_time_seconds** | **Float** | The start time of this clip within the recording, in seconds. | [optional] |
| **end_time_seconds** | **Float** | The end time of this clip within the recording, in seconds. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RecordingTranscriptionClip.new(
  speaker: 0,
  text: Hi there, thanks for calling!,
  confidence: 0.85,
  start_time_seconds: 2.3,
  end_time_seconds: 3.1
)
```

