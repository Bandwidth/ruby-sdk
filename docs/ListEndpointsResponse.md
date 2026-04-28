# Bandwidth::ListEndpointsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;BrtcLink&gt;**](BrtcLink.md) |  |  |
| **page** | [**Page**](Page.md) |  | [optional] |
| **data** | [**Array&lt;Endpoints&gt;**](Endpoints.md) |  |  |
| **errors** | [**Array&lt;BrtcError&gt;**](BrtcError.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ListEndpointsResponse.new(
  links: null,
  page: null,
  data: null,
  errors: null
)
```

