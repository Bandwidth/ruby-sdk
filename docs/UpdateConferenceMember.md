# Bandwidth::UpdateConferenceMember

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mute** | **Boolean** | Whether or not this member is currently muted. Members who are muted are still able to hear other participants.  Updates this member&#39;s mute status. Has no effect if omitted. | [optional] |
| **hold** | **Boolean** | Whether or not this member is currently on hold. Members who are on hold are not able to hear or speak in the conference.  Updates this member&#39;s hold status. Has no effect if omitted. | [optional] |
| **call_ids_to_coach** | **Array&lt;String&gt;** | If this member had a value set for &#x60;callIdsToCoach&#x60; in its [Conference](/docs/voice/bxml/conference) verb or this list was added with a previous PUT request to modify the member, this is that list of calls.  Modifies the calls that this member is coaching. Has no effect if omitted. See the documentation for the [Conference](/docs/voice/bxml/conference) verb for more details about coaching.  Note that this will not add the matching calls to the conference; each call must individually execute a Conference verb to join. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::UpdateConferenceMember.new(
  mute: false,
  hold: false,
  call_ids_to_coach: [&quot;c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85&quot;]
)
```

