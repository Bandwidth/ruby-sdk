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
| **business_registration_number** | **String** | US Federal Tax ID Number (EIN) or Canada Business Number (CBN). Optional until early 2026. If a value is provided for this field, a value must be provided for &#x60;businessRegistrationType&#x60; and &#x60;businessEntityType&#x60;. Available starting October 1st, 2025. | [optional] |
| **business_registration_type** | [**BusinessRegistrationTypeEnum**](BusinessRegistrationTypeEnum.md) |  | [optional] |
| **business_entity_type** | [**BusinessEntityTypeEnum**](BusinessEntityTypeEnum.md) |  | [optional] |
| **help_message_response** | **String** | A message that gets sent to users requesting help. | [optional] |
| **age_gated_content** | **Boolean** | Indicates whether the content is age-gated. | [optional] |

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
  business_dba: Another Company Name Inc.,
  business_registration_number: 12-3456789,
  business_registration_type: null,
  business_entity_type: null,
  help_message_response: Please contact support for assistance.,
  age_gated_content: false
)
```

