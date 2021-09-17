
# Message Request

## Structure

`MessageRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `application_id` | `String` | Required | The ID of the Application your from number is associated with in the Bandwidth Phone Number Dashboard. |
| `to` | `Array<String>` | Required | The phone number(s) the message should be sent to in E164 format<br>**Constraints**: *Unique Items Required* |
| `from` | `String` | Required | One of your telephone numbers the message should come from in E164 format |
| `text` | `String` | Optional | The contents of the text message. Must be 2048 characters or less. |
| `media` | `Array<String>` | Optional | A list of URLs to include as media attachments as part of the message. |
| `tag` | `String` | Optional | A custom string that will be included in callback events of the message. Max 1024 characters |
| `priority` | [`PriorityEnum`](/doc/Messaging/models/priority-enum.md) | Optional | The message's priority, currently for toll-free or short code SMS only. Messages with a priority value of `"high"` are given preference over your other traffic. |

## Example (as JSON)

```json
{
  "applicationId": "93de2206-9669-4e07-948d-329f4b722ee2",
  "to": [
    "+15554443333",
    "+15552223333"
  ],
  "from": "+15551113333"
}
```

