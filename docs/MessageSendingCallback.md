# Bandwidth::MessageSendingCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | **String** |  |  |
| **to** | **String** |  |  |
| **description** | **String** |  |  |
| **message** | [**MessageSendingCallbackMessage**](MessageSendingCallbackMessage.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageSendingCallback.new(
  time: 2016-09-14T18:20:16Z,
  type: message-sending,
  to: +15552223333,
  description: Message is sending to carrier,
  message: null
)
```

