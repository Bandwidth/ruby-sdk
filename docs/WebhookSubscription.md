# Bandwidth::WebhookSubscription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **account_id** | **String** |  | [optional] |
| **callback_url** | **String** | Callback URL to receive status updates from Bandwidth. When a webhook subscription is registered with Bandwidth under a given account ID, it will be used to send status updates for all requests submitted under that account ID. |  |
| **type** | [**WebhookSubscriptionTypeEnum**](WebhookSubscriptionTypeEnum.md) |  | [optional] |
| **basic_authentication** | [**WebhookSubscriptionBasicAuthentication**](WebhookSubscriptionBasicAuthentication.md) |  | [optional] |
| **created_date** | **Time** |  | [optional] |
| **modified_date** | **Time** |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::WebhookSubscription.new(
  id: 7hICGStfAfeGxEq3N0lQwO,
  account_id: 1234567,
  callback_url: https://www.example.com/path/to/resource,
  type: null,
  basic_authentication: null,
  created_date: 2023-05-15T13:56:39.965Z,
  modified_date: 2023-05-15T13:56:39.965Z
)
```

