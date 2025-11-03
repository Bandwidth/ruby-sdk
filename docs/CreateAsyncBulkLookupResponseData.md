# Bandwidth::CreateAsyncBulkLookupResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** | The phone number lookup request ID from Bandwidth. | [optional] |
| **status** | [**InProgressLookupStatusEnum**](InProgressLookupStatusEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateAsyncBulkLookupResponseData.new(
  request_id: 004223a0-8b17-41b1-bf81-20732adf5590,
  status: null
)
```

