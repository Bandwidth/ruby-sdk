# Bandwidth::Subscriptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | If present, and not overridden by the array of participants, it  represents the session the subscriptions are associated with. If this is the only field, the subscriber will be subscribed to all participants in the session (including any participants that are later added to the session). Upon creation of a Participant, returns as an empty object. | [optional] |
| **participants** | [**Array&lt;ParticipantSubscription&gt;**](ParticipantSubscription.md) | (optional) A list of participants  in the session that will be subscribed to.  If present and not  empty or null, this will override  any sessionId specified in the body. Returns empty if used during the creation of a Participant.  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Subscriptions.new(
  session_id: d8886aad-b956-4e1b-b2f4-d7c9f8162772,
  participants: [{&quot;participantId&quot;:&quot;568749d5-04d5-483d-adf5-deac7dd3d521&quot;},{&quot;participantId&quot;:&quot;0275e47f-dd21-4cf0-a1e1-dfdc719e73a7&quot;,&quot;streamAliases&quot;:[&quot;alias_1&quot;,&quot;alias_2&quot;]}]
)
```

