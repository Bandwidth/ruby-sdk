# Bandwidth::Link1

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **href** | **String** | The full URL of the link. | [optional] |
| **rel** | **String** | The relationship of the link to the current resource. | [optional] |
| **method** | **String** | The HTTP method to use when making the request. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Link1.new(
  href: https://api.bandwidth.com/v2/accounts/5500123/endpoints/e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  rel: self,
  method: GET
)
```

