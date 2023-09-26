# Bandwidth::MessageDeliveredCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | **String** |  |  |
| **to** | **String** |  |  |
| **description** | **String** |  |  |
| **message** | [**MessageDeliveredCallbackMessage**](MessageDeliveredCallbackMessage.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageDeliveredCallback.new(
  time: 2016-09-14T18:20:16Z,
  type: message-delivered,
  to: +15552223333,
  description: Message delivered to carrier.,
  message: null
)
```

