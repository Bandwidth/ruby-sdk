# Bandwidth::OptInWorkflow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** |  |  |
| **image_urls** | **Array&lt;String&gt;** |  |  |
| **confirmation_response** | **String** |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::OptInWorkflow.new(
  description: Opt In Flow,
  image_urls: null,
  confirmation_response: Thank you for opting in!
)
```

