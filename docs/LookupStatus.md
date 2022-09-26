# Bandwidth::LookupStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** | The requestId. | [optional] |
| **status** | [**LookupStatusEnum**](LookupStatusEnum.md) |  | [optional] |
| **result** | [**Array&lt;LookupResult&gt;**](LookupResult.md) | The carrier information results for the specified telephone number. | [optional] |
| **failed_telephone_numbers** | **Array&lt;String&gt;** | The telephone numbers whose lookup failed. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupStatus.new(
  request_id: 004223a0-8b17-41b1-bf81-20732adf5590,
  status: null,
  result: null,
  failed_telephone_numbers: [&quot;+191955512345&quot;]
)
```

