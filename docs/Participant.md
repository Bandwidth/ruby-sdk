# Bandwidth::Participant

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique id of the participant. | [optional][readonly] |
| **callback_url** | **String** | Full callback url to use for notifications about this participant. | [optional] |
| **publish_permissions** | [**Array&lt;PublishPermissionsEnum&gt;**](PublishPermissionsEnum.md) | Defines if this participant can publish audio or video. | [optional] |
| **sessions** | **Array&lt;String&gt;** | List of session ids this participant is associated with  Capped to one  Upon creation of a Participant, returns as an empty array. | [optional][readonly] |
| **subscriptions** | [**Subscriptions**](Subscriptions.md) |  | [optional] |
| **tag** | **String** | User defined tag to associate with the participant. | [optional] |
| **device_api_version** | [**DeviceApiVersionEnum**](DeviceApiVersionEnum.md) |  | [optional][default to &#39;V3&#39;] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Participant.new(
  id: 320e2af6-13ec-498d-8b51-daba52c37853,
  callback_url: https://example.com/callback,
  publish_permissions: [&quot;VIDEO&quot;,&quot;AUDIO&quot;],
  sessions: [&quot;75c21163-e110-41bc-bd76-1bb428ec85d5&quot;],
  subscriptions: null,
  tag: participant1,
  device_api_version: null
)
```

