# Bandwidth::CreateWebRtcConnectionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**EndpointTypeEnum**](EndpointTypeEnum.md) |  |  |
| **direction** | [**EndpointDirectionEnum**](EndpointDirectionEnum.md) |  |  |
| **event_callback_url** | **String** | The URL to send event callbacks to. | [optional] |
| **event_fallback_url** | **String** | The URL to send event fallbacks to. | [optional] |
| **tag** | **String** | A tag for the endpoint. | [optional] |
| **connection_metadata** | **Object** |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateWebRtcConnectionRequest.new(
  type: null,
  direction: null,
  event_callback_url: https://myapp.com/callback,
  event_fallback_url: https://fallback.myapp.com/callback,
  tag: my-tag,
  connection_metadata: null
)
```

