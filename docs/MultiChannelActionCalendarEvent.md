# Bandwidth::MultiChannelActionCalendarEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Payload the customer receives when the reply is clicked. |  |
| **title** | **String** | The title of the event. |  |
| **start_time** | **Time** | The start time of the event. Must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. |  |
| **end_time** | **Time** | The end time of the event. Must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. |  |
| **description** | **String** | The description of the event. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelActionCalendarEvent.new(
  type: null,
  text: Track my order,
  postback_data: track-order-43654,
  title: Meeting with John,
  start_time: 2022-09-14T18:20:16Z,
  end_time: 2022-09-14T18:20:16Z,
  description: Discuss the new project
)
```

