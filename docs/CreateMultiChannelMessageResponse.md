# Bandwidth::CreateMultiChannelMessageResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;Link&gt;**](Link.md) |  | [optional] |
| **data** | [**MultiChannelMessageData**](MultiChannelMessageData.md) |  | [optional] |
| **errors** | [**Array&lt;ErrorObject&gt;**](ErrorObject.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateMultiChannelMessageResponse.new(
  links: null,
  data: null,
  errors: null
)
```

