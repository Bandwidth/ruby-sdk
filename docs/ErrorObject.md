# Bandwidth::ErrorObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | A concise summary of the error used for categorization. |  |
| **description** | **String** | A detailed explanation of the error. |  |
| **source** | [**ErrorSource**](ErrorSource.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ErrorObject.new(
  type: null,
  description: null,
  source: null
)
```

