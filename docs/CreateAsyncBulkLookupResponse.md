# Bandwidth::CreateAsyncBulkLookupResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;LinkSchema&gt;**](LinkSchema.md) | Links for pagination (if applicable) | [optional] |
| **data** | [**CreateAsyncBulkLookupResponseData**](CreateAsyncBulkLookupResponseData.md) |  | [optional] |
| **errors** | [**Array&lt;LookupErrorSchema&gt;**](LookupErrorSchema.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateAsyncBulkLookupResponse.new(
  links: null,
  data: null,
  errors: null
)
```

