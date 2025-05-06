# Bandwidth::RbmActionViewLocation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **post_back_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **latitude** | **Float** | The latitude of the location. |  |
| **longitude** | **Float** | The longitude of the location. |  |
| **label** | **String** | The label of the location. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionViewLocation.new(
  type: null,
  text: Hello world,
  post_back_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  latitude: 37.7749,
  longitude: -122.4194,
  label: San Francisco
)
```

