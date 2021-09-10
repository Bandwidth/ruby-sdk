
# Modify Call Request

## Structure

`ModifyCallRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `state` | [`StateEnum`](/doc/Voice/models/state-enum.md) | Optional | **Default**: `StateEnum::ACTIVE`<br>*Default: `StateEnum::ACTIVE`* |
| `redirect_url` | `String` | Optional | Required if state is 'active' |
| `redirect_fallback_url` | `String` | Optional | - |
| `redirect_method` | [`RedirectMethodEnum`](/doc/Voice/models/redirect-method-enum.md) | Optional | - |
| `redirect_fallback_method` | [`RedirectFallbackMethodEnum`](/doc/Voice/models/redirect-fallback-method-enum.md) | Optional | - |
| `username` | `String` | Optional | - |
| `password` | `String` | Optional | - |
| `fallback_username` | `String` | Optional | - |
| `fallback_password` | `String` | Optional | - |
| `tag` | `String` | Optional | - |

## Example (as JSON)

```json
{
  "state": null,
  "redirectUrl": null,
  "redirectFallbackUrl": null,
  "redirectMethod": null,
  "redirectFallbackMethod": null,
  "username": null,
  "password": null,
  "fallbackUsername": null,
  "fallbackPassword": null,
  "tag": null
}
```

