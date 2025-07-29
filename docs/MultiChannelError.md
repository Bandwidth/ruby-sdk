# Bandwidth::MultiChannelError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;Link&gt;**](Link.md) |  | [optional] |
| **data** | **Object** |  | [optional] |
| **errors** | [**Array&lt;ErrorObject&gt;**](ErrorObject.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelError.new(
  links: [],
  data: null,
  errors: null
)
```

