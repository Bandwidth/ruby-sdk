# Bandwidth::InboundCallbackMessage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique identifier of the message. |  |
| **owner** | **String** | The Bandwidth phone number or alphanumeric identifier associated with the message. |  |
| **application_id** | **String** | The ID of the Application your from number or senderId is associated with in the Bandwidth Phone Number Dashboard. |  |
| **time** | **Time** |  |  |
| **segment_count** | **Integer** | The number of segments the user&#39;s message is broken into before sending over carrier networks. |  |
| **direction** | [**MessageDirectionEnum**](MessageDirectionEnum.md) |  |  |
| **to** | **Array&lt;String&gt;** | The phone number recipients of the message. |  |
| **from** | **String** | The Bandwidth phone number or alphanumeric identifier the message was sent from. |  |
| **text** | **String** |  | [optional] |
| **tag** | **String** | A custom string that will be included in callback events of the message. Max 1024 characters. | [optional] |
| **media** | **Array&lt;String&gt;** | Optional media, not applicable for sms | [optional] |
| **priority** | [**PriorityEnum**](PriorityEnum.md) |  | [optional] |
| **channel** | [**MultiChannelMessageChannelEnum**](MultiChannelMessageChannelEnum.md) |  | [optional] |
| **content** | [**MultiChannelMessageContent**](MultiChannelMessageContent.md) |  | [optional] |
| **suggestion_response** | [**RbmSuggestionResponse**](RbmSuggestionResponse.md) |  | [optional] |
| **location_response** | [**RbmLocationResponse**](RbmLocationResponse.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::InboundCallbackMessage.new(
  id: 1661365814859loidf7mcwd4qacn7,
  owner: +15553332222,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  time: 2024-12-02T20:15:57.666Z,
  segment_count: 1,
  direction: null,
  to: [+15552223333],
  from: +15553332222,
  text: Hello world,
  tag: custom string,
  media: [https://dev.bandwidth.com/images/bandwidth-logo.png, https://dev.bandwidth.com/images/github_logo.png],
  priority: null,
  channel: null,
  content: null,
  suggestion_response: null,
  location_response: null
)
```

