
# Bandwidth Message

## Structure

`BandwidthMessage`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The id of the message |
| `owner` | `String` | Optional | The Bandwidth phone number associated with the message |
| `application_id` | `String` | Optional | The application ID associated with the message |
| `time` | `String` | Optional | The datetime stamp of the message in ISO 8601 |
| `segment_count` | `Integer` | Optional | The number of segments the original message from the user is broken into before sending over to carrier networks |
| `direction` | `String` | Optional | The direction of the message relative to Bandwidth. Can be in or out |
| `to` | `Array<String>` | Optional | The phone number recipients of the message<br>**Constraints**: *Unique Items Required* |
| `from` | `String` | Optional | The phone number the message was sent from |
| `media` | `Array<String>` | Optional | The list of media URLs sent in the message. Including a `filename` field in the `Content-Disposition` header of the media linked with a URL will set the displayed file name. This is a best practice to ensure that your media has a readable file name.<br>**Constraints**: *Unique Items Required* |
| `text` | `String` | Optional | The contents of the message |
| `tag` | `String` | Optional | The custom string set by the user |
| `priority` | `String` | Optional | The priority specified by the user |

## Example (as JSON)

```json
{
  "id": null,
  "owner": null,
  "applicationId": null,
  "time": null,
  "segmentCount": null,
  "direction": null,
  "to": null,
  "from": null,
  "media": null,
  "text": null,
  "tag": null,
  "priority": null
}
```

