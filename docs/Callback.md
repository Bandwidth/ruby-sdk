# Bandwidth::Callback

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::Callback.openapi_one_of
# =>
# [
#   :'InboundCallback',
#   :'StatusCallback'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::Callback.openapi_discriminator_name
# => :'type'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::Callback.openapi_discriminator_mapping
# =>
# {
#   :'message-delivered' => :'StatusCallback',
#   :'message-failed' => :'StatusCallback',
#   :'message-read' => :'StatusCallback',
#   :'message-received' => :'InboundCallback',
#   :'message-sent' => :'StatusCallback',
#   :'request-location-response' => :'InboundCallback',
#   :'suggestion-response' => :'InboundCallback'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::Callback.build(data)
# => #<InboundCallback:0x00007fdd4aab02a0>

Bandwidth::Callback.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `InboundCallback`
- `StatusCallback`
- `nil` (if no type matches)

