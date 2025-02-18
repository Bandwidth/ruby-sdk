# Bandwidth::Contact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** | The first name of the business contact using the toll-free number. |  |
| **last_name** | **String** | The last name of the business contact using the toll-free number. |  |
| **email** | **String** |  |  |
| **phone_number** | **String** | Contact telephone number |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Contact.new(
  first_name: John,
  last_name: Doe,
  email: foo@bar.com,
  phone_number: +19192654500
)
```

