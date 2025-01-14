# Bandwidth::MessageCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | [**CallbackTypeEnum**](CallbackTypeEnum.md) |  |  |
| **to** | **String** |  |  |
| **description** | **String** | A detailed description of the event described by the callback. |  |
| **message** | [**MessageCallbackMessage**](MessageCallbackMessage.md) |  |  |
| **error_code** | **Integer** | Optional error code, applicable only when type is &#x60;message-failed&#x60;. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageCallback.new(
  time: 2024-12-02T20:15:57.278Z,
  type: null,
  to: +15552223333,
  description: rejected-unallocated-from-number,
  message: null,
  error_code: 4405
)
```

