# Bandwidth::MessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **application_id** | **String** | The ID of the Application your from number is associated with in the Bandwidth Phone Number Dashboard. |  |
| **to** | **Array&lt;String&gt;** | The phone number(s) the message should be sent to in E164 format. |  |
| **from** | **String** | One of your telephone numbers the message should come from in E164 format. |  |
| **text** | **String** | The contents of the text message. Must be 2048 characters or less. | [optional] |
| **media** | **Array&lt;String&gt;** | A list of URLs to include as media attachments as part of the message. Each URL can be at most 4096 characters. | [optional] |
| **tag** | **String** | A custom string that will be included in callback events of the message. Max 1024 characters. | [optional] |
| **priority** | [**PriorityEnum**](PriorityEnum.md) |  | [optional] |
| **expiration** | **Time** | A string with the date/time value that the message will automatically expire by. This must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. Must be a date-time in the future. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageRequest.new(
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  to: [&quot;+15554443333&quot;,&quot;+15552223333&quot;],
  from: +15551113333,
  text: Hello world,
  media: [&quot;https://dev.bandwidth.com/images/bandwidth-logo.png&quot;,&quot;https://dev.bandwidth.com/images/github_logo.png&quot;],
  tag: custom string,
  priority: null,
  expiration: 2021-02-01T11:29:18-05:00
)
```

