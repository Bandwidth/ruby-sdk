# Bandwidth::Address

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the business using the toll-free number. |  |
| **addr1** | **String** | The address of the business using the toll-free number. |  |
| **addr2** | **String** | The address of the business using the toll-free number. | [optional] |
| **city** | **String** | The city of the business using the toll-free number. |  |
| **state** | **String** | The state of the business using the toll-free number. |  |
| **zip** | **String** | The zip of the business using the toll-free number. |  |
| **url** | **String** | The website of the business using the toll-free number. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Address.new(
  name: Bandwidth Inc.,
  addr1: 2230 Bandmate Way,
  addr2: null,
  city: Raleigh,
  state: NC,
  zip: 27606,
  url: https://www.example.com/path/to/resource
)
```

