# Bandwidth::MessageSendingCallbackMessage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **owner** | **String** |  |  |
| **application_id** | **String** |  |  |
| **time** | **Time** |  |  |
| **segment_count** | **Integer** |  |  |
| **direction** | [**MessageDirectionEnum**](MessageDirectionEnum.md) |  |  |
| **to** | **Array&lt;String&gt;** |  |  |
| **from** | **String** |  |  |
| **text** | **String** |  |  |
| **tag** | **String** |  | [optional] |
| **media** | **Array&lt;String&gt;** |  |  |
| **priority** | [**PriorityEnum**](PriorityEnum.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessageSendingCallbackMessage.new(
  id: 1661365814859loidf7mcwd4qacn7,
  owner: +15553332222,
  application_id: 93de2206-9669-4e07-948d-329f4b722ee2,
  time: 2016-09-14T18:20:16Z,
  segment_count: 1,
  direction: null,
  to: [&quot;+15552223333&quot;],
  from: +15553332222,
  text: Hello world,
  tag: custom string,
  media: [&quot;https://dev.bandwidth.com/images/bandwidth-logo.png&quot;,&quot;https://dev.bandwidth.com/images/github_logo.png&quot;],
  priority: null
)
```

