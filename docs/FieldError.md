# Bandwidth::FieldError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **field_name** | **String** | The name of the field that contains the error | [optional] |
| **description** | **String** | The error associated with the field | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::FieldError.new(
  field_name: from,
  description: &#39;+invalid&#39; must be replaced with a valid E164 formatted telephone number
)
```

