# Bandwidth::LookupResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **response_code** | **Integer** | Our vendor&#39;s response code. | [optional] |
| **message** | **String** | Message associated with the response code. | [optional] |
| **e_164_format** | **String** | The telephone number in E.164 format. | [optional] |
| **formatted** | **String** | The formatted version of the telephone number. | [optional] |
| **country** | **String** | The country of the telephone number. | [optional] |
| **line_type** | **String** | The line type of the telephone number. | [optional] |
| **line_provider** | **String** | The messaging service provider of the telephone number. | [optional] |
| **mobile_country_code** | **String** | The first half of the Home Network Identity (HNI). | [optional] |
| **mobile_network_code** | **String** | The second half of the HNI. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupResult.new(
  response_code: 0,
  message: NOERROR,
  e_164_format: +19195551234,
  formatted: (919) 555-1234,
  country: US,
  line_type: Mobile,
  line_provider: Verizon Wireless,
  mobile_country_code: 310,
  mobile_network_code: 010
)
```

