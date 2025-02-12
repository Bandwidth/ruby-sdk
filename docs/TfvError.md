# Bandwidth::TfvError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **errors** | **Object** | Each key of this errors object refers to a field of the submitted object (using dot notation for nested objects), with the field being a key to an array of one or more errors for that field. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::TfvError.new(
  type: Error Type,
  description: Error Message,
  errors: {&quot;field&quot;:&quot;error message&quot;}
)
```

