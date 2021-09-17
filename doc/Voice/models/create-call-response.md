
# Create Call Response

## Structure

`CreateCallResponse`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Required | - |
| `call_id` | `String` | Required | - |
| `application_id` | `String` | Required | - |
| `to` | `String` | Required | - |
| `from` | `String` | Required | - |
| `start_time` | `DateTime` | Optional | - |
| `call_url` | `String` | Required | - |
| `call_timeout` | `Float` | Optional | - |
| `callback_timeout` | `Float` | Optional | - |
| `answer_url` | `String` | Required | - |
| `answer_method` | [`AnswerMethodEnum`](/doc/Voice/models/answer-method-enum.md) | Required | - |
| `answer_fallback_url` | `String` | Optional | - |
| `answer_fallback_method` | [`AnswerFallbackMethodEnum`](/doc/Voice/models/answer-fallback-method-enum.md) | Optional | - |
| `disconnect_url` | `String` | Optional | - |
| `disconnect_method` | [`DisconnectMethodEnum`](/doc/Voice/models/disconnect-method-enum.md) | Required | - |
| `username` | `String` | Optional | - |
| `password` | `String` | Optional | - |
| `fallback_username` | `String` | Optional | - |
| `fallback_password` | `String` | Optional | - |
| `tag` | `String` | Optional | - |

## Example (as JSON)

```json
{
  "accountId": "accountId0",
  "callId": "callId0",
  "applicationId": "applicationId0",
  "to": "to6",
  "from": "from2",
  "startTime": null,
  "callUrl": "callUrl2",
  "callTimeout": null,
  "callbackTimeout": null,
  "answerUrl": "answerUrl8",
  "answerMethod": "POST",
  "answerFallbackUrl": null,
  "answerFallbackMethod": null,
  "disconnectUrl": null,
  "disconnectMethod": "POST",
  "username": null,
  "password": null,
  "fallbackUsername": null,
  "fallbackPassword": null,
  "tag": null
}
```

