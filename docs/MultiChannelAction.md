# Bandwidth::MultiChannelAction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**RbmActionTypeEnum**](RbmActionTypeEnum.md) |  |  |
| **text** | **String** | Displayed text for user to click |  |
| **postback_data** | **String** | Base64 payload the customer receives when the reply is clicked. |  |
| **phone_number** | **String** | The phone number to dial. Must be E164 format. |  |
| **latitude** | **Float** | The latitude of the location. Must be in range [-90.000000, 90.000000]. |  |
| **longitude** | **Float** | The longitude of the location. Must be in range [-180.000000, 180.000000]. |  |
| **label** | **String** | The label of the location. | [optional] |
| **title** | **String** | The title of the event. |  |
| **start_time** | **Time** | The start time of the event. Must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. |  |
| **end_time** | **Time** | The end time of the event. Must be a valid RFC-3339 value, e.g., 2021-03-14T01:59:26Z or 2021-03-13T20:59:26-05:00. |  |
| **description** | **String** | The description of the event. | [optional] |
| **url** | **String** | The URL to open in browser. Must use http:// or https:// scheme. |  |
| **application** | [**RbmOpenUrlEnum**](RbmOpenUrlEnum.md) |  | [optional] |
| **webview_view_mode** | [**RbmWebViewEnum**](RbmWebViewEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MultiChannelAction.new(
  type: null,
  text: Hello world,
  postback_data: U0dWc2JHOGdkMjl5YkdRPQ&#x3D;&#x3D;,
  phone_number: +15552223333,
  latitude: 37.7749,
  longitude: -122.4194,
  label: San Francisco,
  title: Meeting with John,
  start_time: 2022-09-14T18:20:16Z,
  end_time: 2022-09-14T18:20:16Z,
  description: Discuss the new project,
  url: https://dev.bandwidth.com,
  application: null,
  webview_view_mode: null
)
```

