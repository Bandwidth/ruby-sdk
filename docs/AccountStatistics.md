# Bandwidth::AccountStatistics

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **current_call_queue_size** | **Integer** | The number of calls currently enqueued. | [optional] |
| **max_call_queue_size** | **Integer** | The maximum size of the queue before outgoing calls start being rejected. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::AccountStatistics.new(
  current_call_queue_size: 0,
  max_call_queue_size: 900
)
```

