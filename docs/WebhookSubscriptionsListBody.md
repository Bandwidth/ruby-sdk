# Bandwidth::WebhookSubscriptionsListBody

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **links** | [**LinksObject**](LinksObject.md) |  | [optional] |
| **errors** | [**Array&lt;WebhookSubscriptionError&gt;**](WebhookSubscriptionError.md) |  | [optional] |
| **data** | [**Array&lt;WebhookSubscription&gt;**](WebhookSubscription.md) |  |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::WebhookSubscriptionsListBody.new(
  links: null,
  errors: null,
  data: null
)
```

