# Bandwidth::RbmSuggestionResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | The text of the suggestion the user tapped. | [optional] |
| **postback_data** | **String** | Payload the customer receives when the reply is clicked. | [optional] |
| **paired_message_id** | **String** | Corresponding parent message ID (MT). | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::RbmSuggestionResponse.new(
  text: Track my order,
  postback_data: track-order-43654,
  paired_message_id: 1752697342534u24xerqdukke523x
)
```

