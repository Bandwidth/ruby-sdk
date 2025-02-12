# Bandwidth::Error

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **Integer** |  | [optional] |
| **description** | **String** |  | [optional] |
| **telephone_numbers** | [**Array&lt;TelephoneNumber&gt;**](TelephoneNumber.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Error.new(
  code: null,
  description: null,
  telephone_numbers: null
)
```

