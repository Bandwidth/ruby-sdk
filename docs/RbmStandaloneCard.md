# Bandwidth::RbmStandaloneCard

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **orientation** | [**StandaloneCardOrientationEnum**](StandaloneCardOrientationEnum.md) |  |  |
| **thumbnail_image_alignment** | [**ThumbnailAlignmentEnum**](ThumbnailAlignmentEnum.md) |  |  |
| **card_content** | [**RbmCardContent**](RbmCardContent.md) |  |  |
| **suggestions** | [**Array&lt;MultiChannelAction&gt;**](MultiChannelAction.md) | An array of suggested actions for the recipient. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmStandaloneCard.new(
  orientation: null,
  thumbnail_image_alignment: null,
  card_content: null,
  suggestions: null
)
```

