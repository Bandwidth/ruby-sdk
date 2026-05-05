# Bandwidth::Device

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device_id** | **String** | The unique ID of the device. |  |
| **device_name** | **String** | The name of the device. | [optional] |
| **status** | [**DeviceStatusEnum**](DeviceStatusEnum.md) |  |  |
| **creation_timestamp** | **Time** | The time the device was created. In ISO-8601 format. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Device.new(
  device_id: d-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  device_name: David&#39;s iPhone,
  status: null,
  creation_timestamp: 2021-01-01T00:00Z
)
```

