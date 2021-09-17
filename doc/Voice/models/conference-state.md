
# Conference State

## Structure

`ConferenceState`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | - |
| `name` | `String` | Optional | - |
| `created_time` | `DateTime` | Optional | - |
| `completed_time` | `DateTime` | Optional | - |
| `conference_event_url` | `String` | Optional | - |
| `conference_event_method` | [`ConferenceEventMethodEnum`](/doc/Voice/models/conference-event-method-enum.md) | Optional | - |
| `tag` | `String` | Optional | - |
| `active_members` | [`Array<ConferenceMemberState>`](/doc/Voice/models/conference-member-state.md) | Optional | - |

## Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "createdTime": null,
  "completedTime": null,
  "conferenceEventUrl": null,
  "conferenceEventMethod": null,
  "tag": null,
  "activeMembers": null
}
```

