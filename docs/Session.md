# Bandwidth::Session

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique id of the session. | [optional] |
| **tag** | **String** | User defined tag to associate with the session. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Session.new(
  id: 75c21163-e110-41bc-bd76-1bb428ec85d5,
  tag: session1
)
```

