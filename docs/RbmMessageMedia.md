# Bandwidth::RbmMessageMedia

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media** | [**Array&lt;RbmMessageContentFile&gt;**](RbmMessageContentFile.md) |  |  |
| **suggestions** | [**Array&lt;MultiChannelAction&gt;**](MultiChannelAction.md) | An array of suggested actions for the recipient. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmMessageMedia.new(
  media: null,
  suggestions: null
)
```

