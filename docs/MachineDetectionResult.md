# Bandwidth::MachineDetectionResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **value** | **String** | Possible values are answering-machine, human, silence, timeout, or error. | [optional] |
| **duration** | **String** | The amount of time it took to determine the result. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MachineDetectionResult.new(
  value: answering-machine,
  duration: PT4.9891287S
)
```

