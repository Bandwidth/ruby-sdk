# Bandwidth::ConferenceMember

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **call_id** | **String** | The call id associated with the event. | [optional] |
| **conference_id** | **String** | The unique, Bandwidth-generated ID of the conference that was recorded | [optional] |
| **member_url** | **String** | A URL that may be used to retrieve information about or update the state of this conference member. This is the URL of this member&#39;s [Get Conference Member](/apis/voice/#operation/getConferenceMember) endpoint and [Modify Conference Member](/apis/voice/#operation/updateConferenceMember) endpoint. | [optional] |
| **mute** | **Boolean** | Whether or not this member is currently muted. Members who are muted are still able to hear other participants.  If used in a PUT request, updates this member&#39;s mute status. Has no effect if omitted. | [optional] |
| **hold** | **Boolean** | Whether or not this member is currently on hold. Members who are on hold are not able to hear or speak in the conference.  If used in a PUT request, updates this member&#39;s hold status. Has no effect if omitted. | [optional] |
| **call_ids_to_coach** | **Array&lt;String&gt;** | If this member had a value set for &#x60;callIdsToCoach&#x60; in its [Conference](/docs/voice/bxml/conference) verb or this list was added with a previous PUT request to modify the member, this is that list of calls.  If present in a PUT request, modifies the calls that this member is coaching. Has no effect if omitted. See the documentation for the [Conference](/docs/voice/bxml/conference) verb for more details about coaching. Note that this will not add the matching calls to the conference; each call must individually execute a Conference verb to join. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::ConferenceMember.new(
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  conference_id: conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9,
  member_url: https://voice.bandwidth.com/api/v2/accounts/9900000/conferences/conf-fe23a767-a75a5b77-20c5-4cca-b581-cbbf0776eca9/members/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  mute: false,
  hold: false,
  call_ids_to_coach: [&quot;c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85&quot;]
)
```

