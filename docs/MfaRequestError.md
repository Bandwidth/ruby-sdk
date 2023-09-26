# Bandwidth::MfaRequestError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error** | **String** | A message describing the error with your request. | [optional] |
| **request_id** | **String** | The associated requestId from AWS. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MfaRequestError.new(
  error: 400 Request is malformed or invalid,
  request_id: 354cc8a3-6701-461e-8fa7-8671703dd898
)
```

