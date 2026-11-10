# Bandwidth::RbmActionBase

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Payload the customer receives when the reply is clicked. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionBase.new(
  type: null,
  text: Track my order,
  postback_data: track-order-43654
)
```

