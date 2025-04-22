# Bandwidth::MultiChannelChannelListObjectContent

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelChannelListObjectContent.openapi_one_of
# =>
# [
#   :'MmsMessageContent',
#   :'RbmMessageContentRichCard',
#   :'RbmMessageContentText',
#   :'RbmMessageMedia',
#   :'SmsMessageContent'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelChannelListObjectContent.build(data)
# => #<MmsMessageContent:0x00007fdd4aab02a0>

Bandwidth::MultiChannelChannelListObjectContent.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `MmsMessageContent`
- `RbmMessageContentRichCard`
- `RbmMessageContentText`
- `RbmMessageMedia`
- `SmsMessageContent`
- `nil` (if no type matches)

