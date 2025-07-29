# Bandwidth::MultiChannelMessageResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | The ID of the message. |  |
| **time** | **Time** | The time the message was received by the Bandwidth API. |  |
| **direction** | [**MessageDirectionEnum**](MessageDirectionEnum.md) |  |  |
| **to** | **Array&lt;String&gt;** | The destination phone number(s) of the message, in E164 format. |  |
| **channel_list** | [**Array&lt;MultiChannelMessageResponseDataChannelListInner&gt;**](MultiChannelMessageResponseDataChannelListInner.md) | A list of message bodies. The messages will be attempted in the order they are listed. Once a message sends successfully, the others will be ignored. |  |
| **tag** | **String** | A custom string that will be included in callback events of the message. Max 1024 characters. | [optional] |
| **priority** | [**PriorityEnum**](PriorityEnum.md) |  | [optional] |
| **expiration** | **Time** | A string with the date/time value that the message will automatically expire by. This must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. Must be a date-time in the future. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelMessageResponseData.new(
  message_id: 1589228074636lm4k2je7j7jklbn2,
  time: 2025-01-01T18:20:16Z,
  direction: null,
  to: [&quot;+15554443333&quot;],
  channel_list: null,
  tag: custom string,
  priority: null,
  expiration: 2021-02-01T11:29:18-05:00
)
```

