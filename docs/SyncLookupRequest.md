# Bandwidth::SyncLookupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_numbers** | **Array&lt;String&gt;** | Telephone numbers in E.164 format. |  |
| **rcs_agent** | **String** | Override the default RCS sender/agent ID used when checking RCS capabilities. When provided, this value is used as the &#x60;sender&#x60; in the RCS capability-check request instead of the account default. Must be 1–40 characters and contain only letters, digits, underscores, or hyphens. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::SyncLookupRequest.new(
  phone_numbers: null,
  rcs_agent: MyCustomRcsAgent
)
```

