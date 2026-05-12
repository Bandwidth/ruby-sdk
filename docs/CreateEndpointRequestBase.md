# Bandwidth::CreateEndpointRequestBase

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**EndpointTypeEnum**](EndpointTypeEnum.md) |  |  |
| **direction** | [**EndpointDirectionEnum**](EndpointDirectionEnum.md) |  |  |
| **event_callback_url** | **String** | The URL to send event callbacks to. | [optional] |
| **event_fallback_url** | **String** | The URL to send event fallbacks to. | [optional] |
| **tag** | **String** | A tag for the endpoint. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateEndpointRequestBase.new(
  type: null,
  direction: null,
  event_callback_url: https://myapp.com/callback,
  event_fallback_url: https://fallback.myapp.com/callback,
  tag: my-tag
)
```

