# Bandwidth::LookupErrorSchemaMeta

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_numbers** | **Array&lt;String&gt;** |  | [optional] |
| **message** | **String** | Message describing the error | [optional] |
| **code** | **Integer** | Error code associated with the message | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupErrorSchemaMeta.new(
  phone_numbers: [&quot;+13992077164&quot;,&quot;+19196104424&quot;],
  message: Invalid TNs,
  code: 1001
)
```

