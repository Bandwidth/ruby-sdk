# Bandwidth::InboundMessageCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | **String** |  |  |
| **to** | **String** |  |  |
| **description** | **String** |  |  |
| **message** | [**InboundMessageCallbackMessage**](InboundMessageCallbackMessage.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::InboundMessageCallback.new(
  time: 2016-09-14T18:20:16Z,
  type: message-received,
  to: +15552223333,
  description: Incoming message received,
  message: null
)
```

