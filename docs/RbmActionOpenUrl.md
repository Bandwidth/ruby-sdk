# Bandwidth::RbmActionOpenUrl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **post_back_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **url** | **String** | The URL to open in browser. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionOpenUrl.new(
  type: null,
  text: Hello world,
  post_back_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  url: https://dev.bandwidth.com
)
```

