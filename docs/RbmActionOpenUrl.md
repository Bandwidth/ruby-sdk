# Bandwidth::RbmActionOpenUrl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Payload the customer receives when the reply is clicked. |  |
| **url** | **String** | The URL to open in browser. Must use http:// or https:// scheme. |  |
| **application** | [**RbmOpenUrlEnum**](RbmOpenUrlEnum.md) |  | [optional] |
| **webview_view_mode** | [**RbmWebViewEnum**](RbmWebViewEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmActionOpenUrl.new(
  type: null,
  text: Track my order,
  postback_data: track-order-43654,
  url: https://dev.bandwidth.com,
  application: null,
  webview_view_mode: null
)
```

