# Bandwidth::RbmActionBase

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionBase.new(
  type: null,
  text: Hello world,
  postback_data: [B@6a97517
)
```

