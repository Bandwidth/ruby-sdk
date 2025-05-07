# Bandwidth::MultiChannelAction

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelAction.openapi_one_of
# =>
# [
#   :'MultiChannelActionCalendarEvent',
#   :'RbmActionBase',
#   :'RbmActionDial',
#   :'RbmActionOpenUrl',
#   :'RbmActionViewLocation'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelAction.openapi_discriminator_name
# => :'type'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelAction.openapi_discriminator_mapping
# =>
# {
#   :'CREATE_CALENDAR_EVENT' => :'MultiChannelActionCalendarEvent',
#   :'DIAL_PHONE' => :'RbmActionDial',
#   :'OPEN_URL' => :'RbmActionOpenUrl',
#   :'REPLY' => :'RbmActionBase',
#   :'REQUEST_LOCATION' => :'RbmActionBase',
#   :'SHOW_LOCATION' => :'RbmActionViewLocation'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'bandwidth-sdk'

Bandwidth::MultiChannelAction.build(data)
# => #<MultiChannelActionCalendarEvent:0x00007fdd4aab02a0>

Bandwidth::MultiChannelAction.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `MultiChannelActionCalendarEvent`
- `RbmActionBase`
- `RbmActionDial`
- `RbmActionOpenUrl`
- `RbmActionViewLocation`
- `nil` (if no type matches)

