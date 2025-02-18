# Bandwidth::VerificationUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_address** | [**Address**](Address.md) |  |  |
| **business_contact** | [**Contact**](Contact.md) |  |  |
| **message_volume** | **Integer** | Estimated monthly volume of messages from the toll-free number. |  |
| **use_case** | **String** | The category of the use case. |  |
| **use_case_summary** | **String** | A general idea of the use case and customer. |  |
| **production_message_content** | **String** | Example of message content. |  |
| **opt_in_workflow** | [**OptInWorkflow**](OptInWorkflow.md) |  |  |
| **additional_information** | **String** | Any additional information. | [optional] |
| **isv_reseller** | **String** | ISV name. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::VerificationUpdateRequest.new(
  business_address: null,
  business_contact: null,
  message_volume: 10000,
  use_case: 2FA,
  use_case_summary: null,
  production_message_content: null,
  opt_in_workflow: null,
  additional_information: null,
  isv_reseller: Test ISV
)
```

