# Bandwidth::MultiChannelActionCalendarEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **post_back_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **title** | **String** | The title of the event. |  |
| **start_time** | **Time** | The start time of the event. |  |
| **end_time** | **Time** | The end time of the event. |  |
| **description** | **String** | The description of the event. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelActionCalendarEvent.new(
  type: null,
  text: Hello world,
  post_back_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  title: Meeting with John,
  start_time: 2022-09-14T18:20:16Z,
  end_time: 2022-09-14T18:20:16Z,
  description: Discuss the new project
)
```

