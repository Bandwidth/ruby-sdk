# Bandwidth::CreateSyncLookupResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;LinkSchema&gt;**](LinkSchema.md) |  | [optional] |
| **data** | [**CreateSyncLookupResponseData**](CreateSyncLookupResponseData.md) |  | [optional] |
| **errors** | [**Array&lt;LookupErrorSchema&gt;**](LookupErrorSchema.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateSyncLookupResponse.new(
  links: [],
  data: null,
  errors: null
)
```

