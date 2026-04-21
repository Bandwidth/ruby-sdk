# Bandwidth::Error1

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique identifier for the error. | [optional] |
| **type** | **String** | The type of error. |  |
| **description** | **String** | A description of the error. |  |
| **code** | **String** | A code that uniquely identifies the error. | [optional] |
| **source** | [**Error1Source**](Error1Source.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Error1.new(
  id: 59512d87-7a92-4040-8e4a-78fb772019b9,
  type: resource.not_found,
  description: The requested resource was not found.,
  code: 404,
  source: null
)
```

