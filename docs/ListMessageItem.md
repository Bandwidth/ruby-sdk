# Bandwidth::ListMessageItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | The message id | [optional] |
| **account_id** | **String** | The account id associated with this message. | [optional] |
| **source_tn** | **String** | The source phone number of the message. | [optional] |
| **destination_tn** | **String** | The recipient phone number of the message. | [optional] |
| **message_status** | [**MessageStatusEnum**](MessageStatusEnum.md) |  | [optional] |
| **message_direction** | [**ListMessageDirectionEnum**](ListMessageDirectionEnum.md) |  | [optional] |
| **message_type** | [**MessageTypeEnum**](MessageTypeEnum.md) |  | [optional] |
| **segment_count** | **Integer** | The number of segments the user&#39;s message is broken into before sending over carrier networks. | [optional] |
| **error_code** | **Integer** | The numeric error code of the message. | [optional] |
| **receive_time** | **Time** | The ISO 8601 datetime of the message. | [optional] |
| **carrier_name** | **String** | The name of the carrier. Not currently supported for MMS coming soon. | [optional] |
| **message_size** | **Integer** | The size of the message including message content and headers. | [optional] |
| **message_length** | **Integer** | The length of the message content. | [optional] |
| **attachment_count** | **Integer** | The number of attachments the message has. | [optional] |
| **recipient_count** | **Integer** | The number of recipients the message has. | [optional] |
| **campaign_class** | **String** | The campaign class of the message if it has one. | [optional] |
| **campaign_id** | **String** | The campaign ID of the message if it has one. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ListMessageItem.new(
  message_id: 1589228074636lm4k2je7j7jklbn2,
  account_id: 9900000,
  source_tn: +15554443333,
  destination_tn: +15554442222,
  message_status: null,
  message_direction: null,
  message_type: null,
  segment_count: 1,
  error_code: 9902,
  receive_time: 2020-04-07T14:03:07Z,
  carrier_name: other,
  message_size: 27,
  message_length: 18,
  attachment_count: 1,
  recipient_count: 1,
  campaign_class: T,
  campaign_id: CJEUMDK
)
```

