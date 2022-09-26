# Bandwidth::Diversion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | The reason for the diversion. Common values: unknown, user-busy, no-answer, unavailable, unconditional, time-of-day, do-not-disturb, deflection, follow-me, out-of-service, away. | [optional] |
| **privacy** | **String** | off or full | [optional] |
| **screen** | **String** | No if the number was provided by the user, yes if the number was provided by the network | [optional] |
| **counter** | **String** | The number of diversions that have occurred | [optional] |
| **limit** | **String** | The maximum number of diversions allowed for this session | [optional] |
| **unknown** | **String** | The normal list of values is not exhaustive. Your application must be tolerant of unlisted keys and unlisted values of those keys. | [optional] |
| **orig_to** | **String** | Always present. Indicates the last telephone number that the call was diverted from. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Diversion.new(
  reason: unavailable,
  privacy: off,
  screen: no,
  counter: 2,
  limit: 3,
  unknown: unknownValue,
  orig_to: +15558884444
)
```

