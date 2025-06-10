# Bandwidth::VerificationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_address** | [**Address**](Address.md) |  |  |
| **business_contact** | [**Contact**](Contact.md) |  |  |
| **message_volume** | **Integer** | Estimated monthly volume of messages from the toll-free number. |  |
| **phone_numbers** | **Array&lt;String&gt;** |  |  |
| **use_case** | **String** | The category of the use case. |  |
| **use_case_summary** | **String** | A general idea of the use case and customer. |  |
| **production_message_content** | **String** | Example of message content. |  |
| **opt_in_workflow** | [**OptInWorkflow**](OptInWorkflow.md) |  |  |
| **additional_information** | **String** | Any additional information. | [optional] |
| **isv_reseller** | **String** | ISV name. | [optional] |
| **privacy_policy_url** | **String** | The Toll-Free Verification request privacy policy URL. | [optional] |
| **terms_and_conditions_url** | **String** | The Toll-Free Verification request terms and conditions policy URL. | [optional] |
| **business_dba** | **String** | The company &#39;Doing Business As&#39;. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::VerificationRequest.new(
  business_address: null,
  business_contact: null,
  message_volume: 10000,
  phone_numbers: null,
  use_case: 2FA,
  use_case_summary: Text summarizing the use case for the toll-free number,
  production_message_content: Production message content,
  opt_in_workflow: null,
  additional_information: Any additional information,
  isv_reseller: Test ISV,
  privacy_policy_url: http://your-company.com/privacyPolicy,
  terms_and_conditions_url: http://your-company.com/termsAndConditions,
  business_dba: Another Company Name Inc.
)
```

