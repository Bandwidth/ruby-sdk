# Bandwidth::RbmMessageContentText

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The text associated with the message. Must be 3270 characters or less |  |
| **suggestions** | [**Array&lt;MultiChannelAction&gt;**](MultiChannelAction.md) | An array of suggested actions for the recipient. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmMessageContentText.new(
  text: Hello world,
  suggestions: null
)
```

