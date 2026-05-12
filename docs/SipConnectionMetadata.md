# Bandwidth::SipConnectionMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip_address** | **String** | The IP address of the SIP connection. | [optional] |
| **port** | **Integer** | The port of the SIP connection. | [optional] |
| **credentials** | [**SipCredentials**](SipCredentials.md) |  | [optional] |
| **uui_header** | **String** | The User-to-User Information header for the SIP connection. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::SipConnectionMetadata.new(
  ip_address: 192.168.0.0,
  port: 5060,
  credentials: null,
  uui_header: my-uui-header
)
```

