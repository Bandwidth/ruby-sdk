# Bandwidth::ListEndpointsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;Link1&gt;**](Link1.md) |  |  |
| **page** | [**Page**](Page.md) |  | [optional] |
| **data** | [**Array&lt;Endpoints&gt;**](Endpoints.md) |  |  |
| **errors** | [**Array&lt;Error1&gt;**](Error1.md) |  |  |

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

