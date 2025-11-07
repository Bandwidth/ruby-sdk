# Bandwidth::LinkSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **href** | **String** | URI of the link. | [optional] |
| **rel** | **String** | Specifies the relationship between this link and the resource. | [optional] |
| **method** | **String** | HTTP method to be used. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LinkSchema.new(
  href: /relative/uri,
  rel: aRelatedResource,
  method: GET
)
```

