# Bandwidth::RbmMessageCarouselCard

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_width** | [**CardWidthEnum**](CardWidthEnum.md) |  |  |
| **card_contents** | [**Array&lt;RbmCardContent&gt;**](RbmCardContent.md) |  |  |
| **suggestions** | [**Array&lt;MultiChannelAction&gt;**](MultiChannelAction.md) | An array of suggested actions for the recipient. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmMessageCarouselCard.new(
  card_width: null,
  card_contents: null,
  suggestions: null
)
```

