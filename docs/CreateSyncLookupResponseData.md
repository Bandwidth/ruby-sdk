# Bandwidth::CreateSyncLookupResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** | The phone number lookup request ID from Bandwidth. | [optional] |
| **status** | [**CompletedLookupStatusEnum**](CompletedLookupStatusEnum.md) |  | [optional] |
| **results** | [**Array&lt;LookupResult&gt;**](LookupResult.md) | The carrier information results for the specified telephone numbers. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateSyncLookupResponseData.new(
  request_id: 004223a0-8b17-41b1-bf81-20732adf5590,
  status: null,
  results: null
)
```

