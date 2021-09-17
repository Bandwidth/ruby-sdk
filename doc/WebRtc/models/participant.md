
# Participant

A participant object

## Structure

`Participant`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | Unique id of the participant |
| `callback_url` | `String` | Optional | Full callback url to use for notifications about this participant |
| `publish_permissions` | [`Array<PublishPermissionEnum>`](/doc/WebRtc/models/publish-permission-enum.md) | Optional | Defines if this participant can publish audio or video<br>**Constraints**: *Unique Items Required* |
| `sessions` | `Array<String>` | Optional | List of session ids this participant is associated with<br><br>Capped to one |
| `subscriptions` | [`Subscriptions`](/doc/WebRtc/models/subscriptions.md) | Optional | - |
| `tag` | `String` | Optional | User defined tag to associate with the participant |
| `device_api_version` | [`DeviceApiVersionEnum`](/doc/WebRtc/models/device-api-version-enum.md) | Optional | Optional field to define the device api version of this participant<br>**Default**: `DeviceApiVersionEnum::V2`<br>*Default: `DeviceApiVersionEnum::V2`* |

## Example (as JSON)

```json
{
  "id": null,
  "callbackUrl": null,
  "publishPermissions": null,
  "sessions": null,
  "subscriptions": null,
  "tag": null,
  "deviceApiVersion": null
}
```
