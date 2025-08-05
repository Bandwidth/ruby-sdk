# Bandwidth::MmsMessageContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The contents of the text message. Must be 2048 characters or less. | [optional] |
| **media** | [**Array&lt;MmsMessageContentFile&gt;**](MmsMessageContentFile.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MmsMessageContent.new(
  text: Hello world,
  media: null
)
```

