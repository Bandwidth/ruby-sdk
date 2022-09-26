# Bandwidth::MessagesList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_count** | **Integer** | Total number of messages matched by the search. | [optional] |
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

