# Bandwidth::RbmActionBase

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **post_back_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionBase.new(
  type: null,
  text: Hello world,
  post_back_data: [B@6b103db7
)
```

