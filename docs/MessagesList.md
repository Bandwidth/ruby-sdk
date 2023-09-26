# Bandwidth::MessagesList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_count** | **Integer** | The total number of messages matched by the search. When the request has limitTotalCount set to true this value is limited to 10,000. | [optional] |
| **page_info** | [**PageInfo**](PageInfo.md) |  | [optional] |
| **messages** | [**Array&lt;ListMessageItem&gt;**](ListMessageItem.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MessagesList.new(
  total_count: 100,
  page_info: null,
  messages: null
)
```

