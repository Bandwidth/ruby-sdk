# Bandwidth::GetAsyncBulkLookupResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;LinkSchema&gt;**](LinkSchema.md) |  | [optional] |
| **data** | [**GetAsyncBulkLookupResponseData**](GetAsyncBulkLookupResponseData.md) |  | [optional] |
| **errors** | [**Array&lt;LookupErrorSchema&gt;**](LookupErrorSchema.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::GetAsyncBulkLookupResponse.new(
  links: [],
  data: null,
  errors: null
)
```

