# Bandwidth::RbmSuggestionResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The text associated with the suggestion response. | [optional] |
| **postback_data** | **String** | Base64 payload the customer receives when the reply is clicked. | [optional] |
| **paired_message_id** | **String** | Corresponding parent message ID (MT). | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmSuggestionResponse.new(
  text: Yes, I would like to proceed,
  postback_data: [B@20706e70,
  paired_message_id: 1752697342534u24xerqdukke523x
)
```

