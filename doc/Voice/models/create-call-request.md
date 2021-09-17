
# Create Call Request

## Structure

`CreateCallRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `from` | `String` | Required | Format is E164 |
| `to` | `String` | Required | Format is E164 or SIP URI |
| `uui` | `String` | Optional | A comma-separated list of 'User-To-User' headers to be sent in the INVITE when calling a SIP URI. Each value must end with an 'encoding' parameter as described in https://tools.ietf.org/html/rfc7433. Only 'jwt' and 'base64' encodings are allowed. The entire value cannot exceed 350 characters, including parameters and separators. |
| `call_timeout` | `Float` | Optional | - |
| `callback_timeout` | `Float` | Optional | - |
| `answer_url` | `String` | Required | - |
| `answer_fallback_url` | `String` | Optional | - |
| `username` | `String` | Optional | - |
| `password` | `String` | Optional | - |
| `fallback_username` | `String` | Optional | - |
| `fallback_password` | `String` | Optional | - |
| `answer_method` | [`AnswerMethodEnum`](/doc/Voice/models/answer-method-enum.md) | Optional | - |
| `answer_fallback_method` | [`AnswerFallbackMethodEnum`](/doc/Voice/models/answer-fallback-method-enum.md) | Optional | - |
| `disconnect_url` | `String` | Optional | - |
| `disconnect_method` | [`DisconnectMethodEnum`](/doc/Voice/models/disconnect-method-enum.md) | Optional | - |
| `tag` | `String` | Optional | - |
| `application_id` | `String` | Required | - |
| `machine_detection` | [`MachineDetectionRequest`](/doc/Voice/models/machine-detection-request.md) | Optional | - |

## Example (as JSON)

```json
{
  "from": "+15555555555",
  "to": "+15555555555, sip:john@doe.com",
  "answerUrl": null,
  "applicationId": null
}
```

