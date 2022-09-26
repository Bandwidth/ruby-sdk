# Bandwidth::VerifyCodeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | The phone number to send the mfa code to. |  |
| **scope** | **String** | An optional field to denote what scope or action the mfa code is addressing.  If not supplied, defaults to \&quot;2FA\&quot;. | [optional] |
| **expiration_time_in_minutes** | **Float** | The time period, in minutes, to validate the mfa code.  By setting this to 3 minutes, it will mean any code generated within the last 3 minutes are still valid.  The valid range for expiration time is between 0 and 15 minutes, exclusively and inclusively, respectively. |  |
| **code** | **String** | The generated mfa code to check if valid. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::VerifyCodeRequest.new(
  to: +19195551234,
  scope: 2FA,
  expiration_time_in_minutes: 3,
  code: 123456
)
```

