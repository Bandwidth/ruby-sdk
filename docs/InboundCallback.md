# Bandwidth::InboundCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | [**InboundCallbackTypeEnum**](InboundCallbackTypeEnum.md) |  |  |
| **to** | **String** | The destination phone number the message was sent to.  For inbound callbacks, this is the Bandwidth number or alphanumeric identifier that received the message.  |  |
| **description** | **String** | A detailed description of the event described by the callback. |  |
| **message** | [**InboundCallbackMessage**](InboundCallbackMessage.md) |  |  |
| **carrier_name** | **String** | The name of the Authorized Message Provider (AMP) that handled this message.  In the US, this is the carrier that the message was sent to. This field is present only when this account feature has been enabled. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::InboundCallback.new(
  time: 2024-12-02T20:15:57.278Z,
  type: null,
  to: +15552223333,
  description: Incoming message received,
  message: null,
  carrier_name: AT&amp;T
)
```

