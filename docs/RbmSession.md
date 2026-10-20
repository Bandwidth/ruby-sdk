# Bandwidth::RbmSession

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **can_initiate** | **Boolean** | Whether the message can start an interactive session. &#x60;false&#x60; if the message is already part of an active session, or if the agent is not eligible for interactive session billing. |  |
| **id** | **String** | The unique identifier of the interactive session the message is part of. This is not a message ID. Omitted if the message is not part of a session. | [optional] |
| **type** | **String** | The type of the interactive session. Only present on &#x60;session-started&#x60; callbacks. | [optional] |
| **start_time** | **Time** | The time the 24-hour session window opened. Only present on &#x60;session-started&#x60; callbacks. | [optional] |
| **end_time** | **Time** | The time the 24-hour session window closes. Only present on &#x60;session-started&#x60; callbacks. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmSession.new(
  can_initiate: false,
  id: 0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d,
  type: INTERACTIVE_SESSION,
  start_time: 2026-08-06T09:59:55Z,
  end_time: 2026-08-07T09:59:55Z
)
```

