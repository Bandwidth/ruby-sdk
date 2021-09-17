
# Call Recording Metadata

## Structure

`CallRecordingMetadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `application_id` | `String` | Optional | - |
| `account_id` | `String` | Optional | - |
| `call_id` | `String` | Optional | - |
| `parent_call_id` | `String` | Optional | - |
| `recording_id` | `String` | Optional | - |
| `to` | `String` | Optional | - |
| `from` | `String` | Optional | - |
| `transfer_caller_id` | `String` | Optional | - |
| `transfer_to` | `String` | Optional | - |
| `duration` | `String` | Optional | Format is ISO-8601 |
| `direction` | [`DirectionEnum`](/doc/Voice/models/direction-enum.md) | Optional | - |
| `channels` | `Integer` | Optional | - |
| `start_time` | `DateTime` | Optional | - |
| `end_time` | `DateTime` | Optional | - |
| `file_format` | [`FileFormatEnum`](/doc/Voice/models/file-format-enum.md) | Optional | - |
| `status` | `String` | Optional | The current status of the recording. Current values are 'processing', 'partial', 'complete', 'deleted' and 'error'. Additional states may be added in the future, so your application must be tolerant of unknown values. |
| `media_url` | `String` | Optional | - |
| `transcription` | [`TranscriptionMetadata`](/doc/Voice/models/transcription-metadata.md) | Optional | - |

## Example (as JSON)

```json
{
  "applicationId": null,
  "accountId": null,
  "callId": null,
  "parentCallId": null,
  "recordingId": null,
  "to": null,
  "from": null,
  "transferCallerId": null,
  "transferTo": null,
  "duration": null,
  "direction": null,
  "channels": null,
  "startTime": null,
  "endTime": null,
  "fileFormat": null,
  "status": null,
  "mediaUrl": null,
  "transcription": null
}
```
