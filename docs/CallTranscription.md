# Bandwidth::CallTranscription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **detected_language** | [**CallTranscriptionDetectedLanguageEnum**](CallTranscriptionDetectedLanguageEnum.md) |  | [optional] |
| **track** | [**CallTranscriptionTrackEnum**](CallTranscriptionTrackEnum.md) |  | [optional] |
| **transcript** | **String** | The transcription itself. | [optional] |
| **confidence** | **Float** | How confident the transcription engine was in transcribing the associated audio (from &#x60;0&#x60; to &#x60;1&#x60;). | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CallTranscription.new(
  detected_language: null,
  track: null,
  transcript: Hello World! This is an example.,
  confidence: 0.9
)
```

