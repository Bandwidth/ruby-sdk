# Bandwidth::ErrorSource

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parameter** | **String** | The relevant URI query parameter causing the error | [optional] |
| **field** | **String** | The request body field that led to the error | [optional] |
| **header** | **String** | The header field that contributed to the error | [optional] |
| **reference** | **String** | A resource ID or path linked to the error | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ErrorSource.new(
  parameter: null,
  field: null,
  header: null,
  reference: null
)
```

