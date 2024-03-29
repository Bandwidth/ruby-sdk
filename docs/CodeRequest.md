# Bandwidth::CodeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | The phone number to send the mfa code to. |  |
| **from** | **String** | The application phone number, the sender of the mfa code. |  |
| **application_id** | **String** | The application unique ID, obtained from Bandwidth. |  |
| **scope** | **String** | An optional field to denote what scope or action the mfa code is addressing.  If not supplied, defaults to \&quot;2FA\&quot;. | [optional] |
| **message** | **String** | The message format of the mfa code.  There are three values that the system will replace \&quot;{CODE}\&quot;, \&quot;{NAME}\&quot;, \&quot;{SCOPE}\&quot;.  The \&quot;{SCOPE}\&quot; and \&quot;{NAME} value template are optional, while \&quot;{CODE}\&quot; must be supplied.  As the name would suggest, code will be replace with the actual mfa code.  Name is replaced with the application name, configured during provisioning of mfa.  The scope value is the same value sent during the call and partitioned by the server. |  |
| **digits** | **Integer** | The number of digits for your mfa code.  The valid number ranges from 2 to 8, inclusively. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CodeRequest.new(
  to: +19195551234,
  from: +19195554321,
  application_id: 66fd98ae-ac8d-a00f-7fcd-ba3280aeb9b1,
  scope: 2FA,
  message: Your temporary {NAME} {SCOPE} code is {CODE},
  digits: 6
)
```

