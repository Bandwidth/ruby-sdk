# Bandwidth::LookupErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;LinkSchema&gt;**](LinkSchema.md) |  | [optional] |
| **data** | **Object** | The phone number lookup response data | [optional] |
| **errors** | [**Array&lt;LookupErrorSchema&gt;**](LookupErrorSchema.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupErrorResponse.new(
  links: [],
  data: null,
  errors: null
)
```

