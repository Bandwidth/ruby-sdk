# Bandwidth::SmsMessageContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The contents of the text message. Must be 2048 characters or less. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::SmsMessageContent.new(
  text: Hello world
)
```

