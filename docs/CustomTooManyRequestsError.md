# Bandwidth::CustomTooManyRequestsError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **description** | **String** |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CustomTooManyRequestsError.new(
  type: rate_limit_exceeded,
  description: Rate limit exceeded. Wait for Retry-After time before sending another request.
)
```

