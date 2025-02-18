# Bandwidth::WebhookSubscriptionRequestSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **basic_authentication** | [**TfvBasicAuthentication**](TfvBasicAuthentication.md) |  | [optional] |
| **callback_url** | **String** | Callback URL to receive status updates from Bandwidth. When a webhook subscription is registered with Bandwidth under a given account ID, it will be used to send status updates for all requests submitted under that account ID. |  |
| **shared_secret_key** | **String** | An ASCII string submitted by the user as a shared secret key for generating an HMAC header for callbacks. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::WebhookSubscriptionRequestSchema.new(
  basic_authentication: null,
  callback_url: https://www.example.com/path/to/resource,
  shared_secret_key: This is my $3cret
)
```

