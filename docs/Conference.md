# Bandwidth::Conference

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The Bandwidth-generated conference ID. | [optional] |
| **name** | **String** | The name of the conference, as specified by your application. | [optional] |
| **created_time** | **Time** | The time the conference was initiated, in ISO 8601 format. | [optional] |
| **completed_time** | **Time** | The time the conference was terminated, in ISO 8601 format. | [optional] |
| **conference_event_url** | **String** | The URL to send the conference-related events. | [optional] |
| **conference_event_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **tag** | **String** | The custom string attached to the conference that will be sent with callbacks. | [optional] |
| **active_members** | [**Array&lt;ConferenceMember&gt;**](ConferenceMember.md) | A list of active members of the conference. Omitted if this is a response to the [Get Conferences endpoint](/apis/voice#tag/Conferences/operation/listConferences). | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Conference.new(
  id: conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9,
  name: my-conference-name,
  created_time: 2022-06-17T22:19:40.375Z,
  completed_time: 2022-06-17T22:20Z,
  conference_event_url: https://myServer.example/bandwidth/webhooks/conferenceEvent,
  conference_event_method: null,
  tag: my custom tag,
  active_members: null
)
```

