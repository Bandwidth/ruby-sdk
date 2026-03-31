# Bandwidth::LookupErrorSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Validation error code |  |
| **description** | **String** | Description of validation error |  |
| **type** | **String** | Type of validation error |  |
| **meta** | [**LookupErrorSchemaMeta**](LookupErrorSchemaMeta.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupErrorSchema.new(
  code: NO-MATCH,
  description: Example error description,
  type: NumberInventory,
  meta: null
)
```

