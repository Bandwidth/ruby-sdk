# Bandwidth::BrtcErrorSource

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parameter** | **String** | The URI parameter that caused the error. | [optional] |
| **field** | **String** | The request body field that caused the error. | [optional] |
| **header** | **String** | The header that caused the error. | [optional] |
| **reference** | **String** | The resource ID or path to the resource (or non-existent resource) causing the error. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::BrtcErrorSource.new(
  parameter: accountId,
  field: accountId,
  header: Authorization,
  reference: e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85
)
```

