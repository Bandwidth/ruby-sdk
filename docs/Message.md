# Bandwidth::Message

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The id of the message. | [optional] |
| **owner** | **String** | The Bandwidth phone number associated with the message. | [optional] |
| **application_id** | **String** | The ID of the Application your from number or senderId is associated with in the Bandwidth Phone Number Dashboard. | [optional] |
| **time** | **Time** | The datetime stamp of the message in ISO 8601 | [optional] |
| **segment_count** | **Integer** | The number of segments the user&#39;s message is broken into before sending over carrier networks. | [optional] |
| **direction** | [**MessageDirectionEnum**](MessageDirectionEnum.md) |  | [optional] |
| **to** | **Array&lt;String&gt;** | The phone number recipients of the message. | [optional] |
| **from** | **String** | The phone number the message was sent from. | [optional] |
| **media** | **Array&lt;String&gt;** | The list of media URLs sent in the message. Including a &#x60;filename&#x60; field in the &#x60;Content-Disposition&#x60; header of the media linked with a URL will set the displayed file name. This is a best practice to ensure that your media has a readable file name. | [optional] |
| **text** | **String** | The contents of the message. | [optional] |
| **tag** | **String** | A custom string that will be included in callback events of the message. Max 1024 characters. | [optional] |
| **priority** | [**PriorityEnum**](PriorityEnum.md) |  | [optional] |
| **expiration** | **Time** | A string with the date/time value that the message will automatically expire by. This must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. Must be a date-time in the future. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Message.new(
  id: 1589228074636lm4k2je7j7jklbn2,
  owner: +15554443333,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  time: 2024-12-02T20:15:57.278Z,
  segment_count: 1,
  direction: null,
  to: [&quot;+15552223333&quot;],
  from: +15553332222,
  media: [&quot;https://dev.bandwidth.com/images/bandwidth-logo.png&quot;],
  text: Hello world,
  tag: custom string,
  priority: null,
  expiration: 2021-02-01T11:29:18-05:00
)
```

