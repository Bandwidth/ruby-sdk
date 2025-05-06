# Bandwidth::MultiChannelCallbackData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time** | **Time** | The time of the callback event. | [optional] |
| **type** | [**MultiChannelStatusEnum**](MultiChannelStatusEnum.md) |  | [optional] |
| **to** | **String** | The phone number the message should be sent to in E164 format. | [optional] |
| **description** | **String** |  | [optional] |
| **message** | [**MultiChannelMessageCallbackData**](MultiChannelMessageCallbackData.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelCallbackData.new(
  time: 2025-01-01T18:20:16Z,
  type: null,
  to: +15552223333,
  description: Incoming message received,
  message: null
)
```

