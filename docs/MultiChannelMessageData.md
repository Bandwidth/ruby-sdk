# Bandwidth::MultiChannelMessageData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | The ID of the message. | [optional] |
| **status** | [**MultiChannelStatusEnum**](MultiChannelStatusEnum.md) |  | [optional] |
| **time** | **Time** | The time the message was received by the Bandwidth API. | [optional] |
| **direction** | [**MultiChannelMessageDirectionEnum**](MultiChannelMessageDirectionEnum.md) |  | [optional] |
| **from** | **String** | The sender ID of the message. This could be an alphanumeric sender ID. | [optional] |
| **to** | **String** | The phone number the message should be sent to in E164 format. | [optional] |
| **application_id** | **String** | The ID of the Application your from number or senderId is associated with in the Bandwidth Phone Number Dashboard. | [optional] |
| **channel** | [**MultiChannelMessageChannelEnum**](MultiChannelMessageChannelEnum.md) |  | [optional] |
| **tag** | **String** | A custom string that will be included in callback events of the message. Max 1024 characters. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelMessageData.new(
  message_id: 1589228074636lm4k2je7j7jklbn2,
  status: null,
  time: 2025-01-01T18:20:16Z,
  direction: null,
  from: BandwidthRBM,
  to: +15552223333,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  channel: null,
  tag: custom string
)
```

