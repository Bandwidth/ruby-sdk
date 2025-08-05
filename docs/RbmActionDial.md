# Bandwidth::RbmActionDial

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **phone_number** | **String** | The phone number to dial. Must be E164 format. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionDial.new(
  type: null,
  text: Hello world,
  postback_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  phone_number: +15552223333
)
```

