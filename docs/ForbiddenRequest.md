# Bandwidth::ForbiddenRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | The message containing the reason behind the request being forbidden. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ForbiddenRequest.new(
  message: Missing Authentication Token
)
```

