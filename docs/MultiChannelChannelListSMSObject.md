# Bandwidth::MultiChannelChannelListSMSObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **String** | The sender ID of the message. This could be an alphanumeric sender ID. |  |
| **application_id** | **String** | The ID of the Application your from number or senderId is associated with in the Bandwidth Phone Number Dashboard. |  |
| **channel** | [**MultiChannelMessageChannelEnum**](MultiChannelMessageChannelEnum.md) |  |  |
| **content** | [**SmsMessageContent**](SmsMessageContent.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelChannelListSMSObject.new(
  from: BandwidthRBM,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  channel: null,
  content: null
)
```

