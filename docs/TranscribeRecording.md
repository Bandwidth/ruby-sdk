# Bandwidth::TranscribeRecording

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **callback_url** | **String** | The URL to send the [TranscriptionAvailable](/docs/voice/webhooks/transcriptionAvailable) event to. You should not include sensitive or personally-identifiable information in the callbackUrl field! Always use the proper username and password fields for authorization. | [optional] |
| **callback_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **tag** | **String** | (optional) The tag specified on call creation. If no tag was specified or it was previously cleared, this field will not be present. | [optional] |
| **callback_timeout** | **Float** | This is the timeout (in seconds) to use when delivering the webhook to &#x60;callbackUrl&#x60;. Can be any numeric value (including decimals) between 1 and 25. | [optional][default to 15] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::TranscribeRecording.new(
  callback_url: https://myServer.com/bandwidth/webhooks/transcriptionAvailable,
  callback_method: null,
  username: mySecretUsername,
  password: mySecretPassword1!,
  tag: exampleTag,
  callback_timeout: 5.5
)
```

