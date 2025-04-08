# Bandwidth::RbmCardContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | The title of the card. Must be 200 characters or less. | [optional] |
| **description** | **String** | The description of the card. Must be 2000 characters or less. | [optional] |
| **media** | [**RbmCardContentMedia**](RbmCardContentMedia.md) |  | [optional] |
| **suggestions** | [**Array&lt;MultiChannelAction&gt;**](MultiChannelAction.md) | An array of suggested actions for the recipient that will be displayed on the rich card. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmCardContent.new(
  title: Bandwidth,
  description: Bandwidth is a communications platform as a service (CPaaS) company.,
  media: null,
  suggestions: null
)
```

