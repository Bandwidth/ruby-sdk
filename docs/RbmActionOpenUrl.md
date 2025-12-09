# Bandwidth::RbmActionOpenUrl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **url** | **String** | The URL to open in browser. |  |
| **application** | [**RbmOpenUrlEnum**](RbmOpenUrlEnum.md) |  | [optional] |
| **webview_view_mode** | [**RbmWebViewEnum**](RbmWebViewEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionOpenUrl.new(
  type: null,
  text: Hello world,
  postback_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  url: https://dev.bandwidth.com,
  application: null,
  webview_view_mode: null
)
```

