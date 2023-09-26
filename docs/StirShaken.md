# Bandwidth::StirShaken

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **verstat** | **String** | (optional) The verification status indicating whether the verification was successful or not. Possible values are TN-Verification-Passed and TN-Verification-Failed. | [optional] |
| **attestation_indicator** | **String** | (optional) The attestation level verified by Bandwidth. Possible values are A (full), B (partial) or C (gateway). | [optional] |
| **originating_id** | **String** | (optional) A unique origination identifier. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::StirShaken.new(
  verstat: Tn-Verification-Passed,
  attestation_indicator: A,
  originating_id: 99759086-1335-11ed-9bcf-5f7d464e91af
)
```

