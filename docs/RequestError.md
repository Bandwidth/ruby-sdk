# Bandwidth::RequestError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error** | **String** | A message describing the error with your request. | [optional] |
| **request_id** | **String** | The associated requestId from AWS. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RequestError.new(
  error: Internal error,
  request_id: 12af78d1-5f88-4917-925d-17c1ac8fda7a
)
```

