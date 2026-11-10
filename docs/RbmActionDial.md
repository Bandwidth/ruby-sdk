# Bandwidth::RbmActionDial

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Payload the customer receives when the reply is clicked. |  |
| **phone_number** | **String** | The phone number to dial. Must be E164 format. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionDial.new(
  type: null,
  text: Track my order,
  postback_data: track-order-43654,
  phone_number: +15552223333
)
```

