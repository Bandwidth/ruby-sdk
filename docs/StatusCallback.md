# Bandwidth::StatusCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **event_time** | **Time** | Represents the time at which the message was read, for &#x60;message-read&#x60; callbacks. | [optional] |
| **type** | [**StatusCallbackTypeEnum**](StatusCallbackTypeEnum.md) |  |  |
| **to** | **String** | The destination phone number the message was sent to. For status callbacks, this the the Bandwidth user&#39;s client phone number. |  |
| **description** | **String** | A detailed description of the event described by the callback. |  |
| **message** | [**StatusCallbackMessage**](StatusCallbackMessage.md) |  |  |
| **error_code** | **Integer** | Optional error code, applicable only when type is &#x60;message-failed&#x60;. | [optional] |
| **carrier_name** | **String** | The name of the Authorized Message Provider (AMP) that handled this message.  In the US, this is the carrier that the message was sent to. This field is present only when this account feature has been enabled. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::StatusCallback.new(
  time: 2024-12-02T20:15:57.278Z,
  event_time: 2024-12-02T20:15:58.278Z,
  type: null,
  to: +15552223333,
  description: Message delivered to carrier.,
  message: null,
  error_code: 4405,
  carrier_name: AT&amp;T
)
```

