# Bandwidth::CallTranscriptionMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transcription_id** | **String** | The programmable voice API transcription ID. | [optional] |
| **transcription_name** | **String** | The programmable voice API transcription name. This name could be provided by the user when creating the transcription. | [optional] |
| **transcription_url** | **String** | A URL that may be used to retrieve the transcription itself. This points to the [Get Call Transcription](/apis/voice/#operation/getCallTranscription) endpoint. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CallTranscriptionMetadata.new(
  transcription_id: t-3f758f24-c7a2fc78-7c91-401a-8b2e-e542f9c40d6b,
  transcription_name: live_transcription,
  transcription_url: https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-fef240ff-5cfc9091-8069-4863-a8c0-a4dcbbf1f1a4/transcriptions/t-3f758f24-c7a2fc78-7c91-401a-8b2e-e542f9c40d6b
)
```

