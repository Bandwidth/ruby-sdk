# Bandwidth::CreateLookupResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** | The phone number lookup request ID from Bandwidth. | [optional] |
| **status** | [**LookupStatusEnum**](LookupStatusEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateLookupResponse.new(
  request_id: null,
  status: null
)
```

