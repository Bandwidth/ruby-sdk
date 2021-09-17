
# Conference Recording Metadata

## Structure

`ConferenceRecordingMetadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Optional | - |
| `conference_id` | `String` | Optional | - |
| `name` | `String` | Optional | - |
| `recording_id` | `String` | Optional | - |
| `duration` | `String` | Optional | Format is ISO-8601 |
| `channels` | `Integer` | Optional | - |
| `start_time` | `DateTime` | Optional | - |
| `end_time` | `DateTime` | Optional | - |
| `file_format` | [`FileFormatEnum`](/doc/Voice/models/file-format-enum.md) | Optional | - |
| `status` | `String` | Optional | The current status of the recording. Current possible values are 'processing', 'partial', 'complete', 'deleted', and 'error'. Additional states may be added in the future, so your application must be tolerant of unknown values. |
| `media_url` | `String` | Optional | - |

## Example (as JSON)

```json
{
  "accountId": null,
  "conferenceId": null,
  "name": null,
  "recordingId": null,
  "duration": null,
  "channels": null,
  "startTime": null,
  "endTime": null,
  "fileFormat": null,
  "status": null,
  "mediaUrl": null
}
```

