# Bandwidth::CallTranscriptionResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The user account associated with the call. | [optional] |
| **call_id** | **String** | The call id associated with the event. | [optional] |
| **transcription_id** | **String** | The programmable voice API transcription ID. | [optional] |
| **tracks** | [**Array&lt;CallTranscription&gt;**](CallTranscription.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CallTranscriptionResponse.new(
  account_id: 9900000,
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  transcription_id: t-3f758f24-c7a2fc78-7c91-401a-8b2e-e542f9c40d6b,
  tracks: [{&quot;detectedLanguage&quot;:&quot;en-US&quot;,&quot;track&quot;:&quot;inbound&quot;,&quot;transcript&quot;:&quot;Hello World! This is an example.&quot;,&quot;confidence&quot;:0.9}]
)
```

