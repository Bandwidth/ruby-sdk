# Bandwidth::MessageFailedCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** |  |  |
| **type** | **String** |  |  |
| **to** | **String** |  |  |
| **description** | **String** |  |  |
| **message** | [**MessageFailedCallbackMessage**](MessageFailedCallbackMessage.md) |  |  |
| **error_code** | **Integer** |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageFailedCallback.new(
  time: 2016-09-14T18:20:16Z,
  type: message-failed,
  to: +15552223333,
  description: rejected-unallocated-from-number,
  message: null,
  error_code: 9902
)
```

