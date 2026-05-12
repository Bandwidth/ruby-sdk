# Bandwidth::SipCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **username** | **String** | The username for the SIP connection. | [optional] |
| **password** | **String** | The password for the SIP connection. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::SipCredentials.new(
  username: username,
  password: password
)
```

