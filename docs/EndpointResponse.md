# Bandwidth::EndpointResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**Array&lt;BrtcLink&gt;**](BrtcLink.md) |  |  |
| **data** | [**Endpoint**](Endpoint.md) |  |  |
| **errors** | [**Array&lt;BrtcError&gt;**](BrtcError.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::EndpointResponse.new(
  links: null,
  data: null,
  errors: null
)
```

