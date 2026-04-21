# Bandwidth::CreateEndpointResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **endpoint_id** | **String** | The unique ID of the endpoint. |  |
| **type** | [**EndpointTypeEnum**](EndpointTypeEnum.md) |  |  |
| **status** | [**EndpointStatusEnum**](EndpointStatusEnum.md) |  |  |
| **creation_timestamp** | **Time** | The time the endpoint was created. In ISO-8601 format. |  |
| **expiration_timestamp** | **Time** | The time the endpoint token will expire. In ISO-8601 format. Tokens last 24 hours. |  |
| **tag** | **String** | A tag for the endpoint. | [optional] |
| **devices** | [**Array&lt;Device&gt;**](Device.md) |  | [optional] |
| **token** | **String** | The json web token specific to the endpoint. Used to authenticate the client with the media gateway. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateEndpointResponseData.new(
  endpoint_id: e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  type: null,
  status: null,
  creation_timestamp: 2021-01-01T00:00Z,
  expiration_timestamp: 2021-01-02T00:00Z,
  tag: my-tag,
  devices: null,
  token: xxxxx.yyyyy.zzzzz
)
```

