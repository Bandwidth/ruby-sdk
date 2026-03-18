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
| **privacy_policy_url** | **String** | The Toll-Free Verification request privacy policy URL. | [optional] |
| **terms_and_conditions_url** | **String** | The Toll-Free Verification request terms and conditions policy URL. | [optional] |
| **business_dba** | **String** | The company &#39;Doing Business As&#39;. | [optional] |
| **business_registration_number** | **String** | Government-issued business identifying number.  **Note:** If this field is provided, it is strongly recommended to also provide &#x60;businessRegistrationType&#x60; and &#x60;businessRegistrationIssuingCountry&#x60;. Submissions missing these fields have a high likelihood of rejection.  | [optional] |
| **business_registration_type** | [**BusinessRegistrationTypeEnum**](BusinessRegistrationTypeEnum.md) |  | [optional] |
| **business_entity_type** | [**BusinessEntityTypeEnum**](BusinessEntityTypeEnum.md) |  | [optional] |
| **business_registration_issuing_country** | [**BusinessRegistrationIssuingCountryEnum**](BusinessRegistrationIssuingCountryEnum.md) |  | [optional] |
| **help_message_response** | **String** | A message that gets sent to users requesting help. | [optional] |
| **age_gated_content** | **Boolean** | Indicates whether the content is age-gated. | [optional] |
| **cv_token** | **String** | The token provided by Campaign Verify to validate your political use case. Only required for 527 political organizations. If you are not a 527 political organization, this field should be omitted. Supplying an empty string will likely result in rejection. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::VerificationUpdateRequest.new(
  business_address: null,
  business_contact: null,
  message_volume: 10000,
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
  business_registration_issuing_country: null,
  help_message_response: Please contact support for assistance.,
  age_gated_content: false,
  cv_token: cv.user123|sess456|mno|tfree|read_write|X7yZ9aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVw
)
```

