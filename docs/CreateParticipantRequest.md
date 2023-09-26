# Bandwidth::CreateParticipantRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **callback_url** | **String** | Full callback url to use for notifications about this participant. | [optional] |
| **publish_permissions** | [**Array&lt;PublishPermissionsEnum&gt;**](PublishPermissionsEnum.md) | Defines if this participant can publish audio or video. | [optional] |
| **tag** | **String** | User defined tag to associate with the participant. | [optional] |
| **device_api_version** | [**DeviceApiVersionEnum**](DeviceApiVersionEnum.md) |  | [optional][default to &#39;V3&#39;] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateParticipantRequest.new(
  callback_url: https://example.com/callback,
  publish_permissions: [&quot;VIDEO&quot;,&quot;AUDIO&quot;],
  tag: participant1,
  device_api_version: null
)
```

