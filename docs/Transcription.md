# Bandwidth::Transcription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The transcribed text | [optional] |
| **confidence** | **Float** | The confidence on the recognized content, ranging from &#x60;0.0&#x60; to &#x60;1.0&#x60; with &#x60;1.0&#x60; being the highest confidence. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Transcription.new(
  text: Nice talking to you, friend!,
  confidence: 0.9
)
```

