
# Call Callback

This object represents all possible fields that may be included in callbacks related to call events, including events that come from BXML verbs

## Structure

`CallCallback`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | `String` | Optional | - |
| `event_time` | `String` | Optional | - |
| `account_id` | `String` | Optional | - |
| `application_id` | `String` | Optional | - |
| `from` | `String` | Optional | - |
| `to` | `String` | Optional | - |
| `direction` | `String` | Optional | - |
| `call_id` | `String` | Optional | - |
| `call_url` | `String` | Optional | - |
| `start_time` | `String` | Optional | - |
| `answer_time` | `String` | Optional | - |
| `transfer_caller_id` | `String` | Optional | - |
| `transfer_to` | `String` | Optional | - |
| `cause` | `String` | Optional | - |
| `error_message` | `String` | Optional | - |
| `error_id` | `String` | Optional | - |
| `end_time` | `String` | Optional | - |
| `digit` | `String` | Optional | - |
| `parent_call_id` | `String` | Optional | - |
| `recording_id` | `String` | Optional | - |
| `duration` | `String` | Optional | - |
| `file_format` | `String` | Optional | - |
| `media_url` | `String` | Optional | - |
| `tag` | `String` | Optional | - |
| `channels` | `Integer` | Optional | - |
| `status` | `String` | Optional | - |
| `digits` | `String` | Optional | - |
| `terminating_digit` | `String` | Optional | - |
| `transcription` | [`Transcription`](/doc/Voice/models/transcription.md) | Optional | - |
| `diversion` | [`Diversion`](/doc/Voice/models/diversion.md) | Optional | - |

## Example (as JSON)

```json
{
  "eventType": null,
  "eventTime": null,
  "accountId": null,
  "applicationId": null,
  "from": null,
  "to": null,
  "direction": null,
  "callId": null,
  "callUrl": null,
  "startTime": null,
  "answerTime": null,
  "transferCallerId": null,
  "transferTo": null,
  "cause": null,
  "errorMessage": null,
  "errorId": null,
  "endTime": null,
  "digit": null,
  "parentCallId": null,
  "recordingId": null,
  "duration": null,
  "fileFormat": null,
  "mediaUrl": null,
  "tag": null,
  "channels": null,
  "status": null,
  "digits": null,
  "terminatingDigit": null,
  "transcription": null,
  "diversion": null
}
```

