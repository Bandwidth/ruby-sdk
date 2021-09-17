
# Two Factor Verify Request Schema

## Structure

`TwoFactorVerifyRequestSchema`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `to` | `String` | Required | The phone number to send the 2fa code to. |
| `application_id` | `String` | Required | The application unique ID, obtained from Bandwidth. |
| `scope` | `String` | Optional | An optional field to denote what scope or action the 2fa code is addressing.  If not supplied, defaults to "2FA". |
| `expiration_time_in_minutes` | `Float` | Required | The time period, in minutes, to validate the 2fa code.  By setting this to 3 minutes, it will mean any code generated within the last 3 minutes are still valid.  The valid range for expiration time is between 0 and 15 minutes, exclusively and inclusively, respectively. |
| `code` | `String` | Required | The generated 2fa code to check if valid |

## Example (as JSON)

```json
{
  "to": "to6",
  "applicationId": "applicationId0",
  "scope": null,
  "expirationTimeInMinutes": 31.04,
  "code": "code8"
}
```
