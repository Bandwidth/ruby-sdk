
# Call State

## Structure

`CallState`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `call_id` | `String` | Optional | - |
| `parent_call_id` | `String` | Optional | - |
| `application_id` | `String` | Optional | - |
| `account_id` | `String` | Optional | - |
| `to` | `String` | Optional | - |
| `from` | `String` | Optional | - |
| `direction` | `String` | Optional | - |
| `state` | `String` | Optional | The current state of the call. Current possible values are 'initiated', 'answered' and 'disconnected'. Additional states may be added in the future, so your application must be tolerant of unknown values. |
| `identity` | `String` | Optional | - |
| `stir_shaken` | `Hash` | Optional | - |
| `start_time` | `DateTime` | Optional | - |
| `answer_time` | `DateTime` | Optional | - |
| `end_time` | `DateTime` | Optional | - |
| `disconnect_cause` | `String` | Optional | The reason the call was disconnected, or null if the call is still active. Current values are 'cancel', 'timeout', 'busy', 'rejected', 'hangup', 'invalid-bxml', 'callback-error', 'application-error', 'error', 'account-limit', 'node-capacity-exceeded' and 'unknown'. Additional causes may be added in the future, so your application must be tolerant of unknown values. |
| `error_message` | `String` | Optional | - |
| `error_id` | `String` | Optional | - |
| `last_update` | `DateTime` | Optional | - |

## Example (as JSON)

```json
{
  "callId": null,
  "parentCallId": null,
  "applicationId": null,
  "accountId": null,
  "to": null,
  "from": null,
  "direction": null,
  "state": null,
  "identity": null,
  "stirShaken": null,
  "startTime": null,
  "answerTime": null,
  "endTime": null,
  "disconnectCause": null,
  "errorMessage": null,
  "errorId": null,
  "lastUpdate": null
}
```

