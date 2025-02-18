# Bandwidth::AdditionalDenialReason

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status_code** | **Integer** | Reason code for denial. |  |
| **reason** | **String** | Explanation for why a verification request was declined. |  |
| **resubmit_allowed** | **Boolean** | Whether a Toll-Free Verification request qualifies for resubmission via PUT. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::AdditionalDenialReason.new(
  status_code: 511,
  reason: Invalid Information - Can&#39;t Validate URL - Website is not accessible / not available,
  resubmit_allowed: true
)
```

