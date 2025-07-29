# Bandwidth::MultiChannelMessageResponseDataChannelListInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **String** | The sender ID of the message. This could be an alphanumeric sender ID. |  |
| **application_id** | **String** | The ID of the Application your from number or senderId is associated with in the Bandwidth Phone Number Dashboard. |  |
| **channel** | [**MultiChannelMessageChannelEnum**](MultiChannelMessageChannelEnum.md) |  |  |
| **content** | [**MultiChannelChannelListObjectContent**](MultiChannelChannelListObjectContent.md) |  |  |
| **owner** | **String** | The Bandwidth senderId associated with the message. Identical to &#39;from&#39;. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelMessageResponseDataChannelListInner.new(
  from: BandwidthRBM,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  channel: null,
  content: null,
  owner: null
)
```

