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
| **business_registration_number** | **String** | Government-issued business identifying number.  **Note: As of October 19th, 2026 this field will be required when &#x60;businessEntityType&#x60; is _not_ &#x60;SOLE_PROPRIETOR&#x60;. If this field is provided, &#x60;businessRegistrationType&#x60; and &#x60;businessRegistrationIssuingCountry&#x60; are also required.**  | [optional] |
| **business_registration_type** | [**BusinessRegistrationTypeEnum**](BusinessRegistrationTypeEnum.md) |  | [optional] |
| **business_registration_issuing_country** | **String** | The country issuing the business registration in ISO-3166-1 alpha-3 format. Alpha-2 format is accepted by the API, but alpha-3 is highly encouraged.  **Note: As of October 19th, 2026 this field will be required when &#x60;businessRegistrationNumber&#x60; is provided.**  | Registration Type     | Supported Countries                | |----------------------|------------------------------------| | EIN                  | USA                                | | CBN                  | CAN                                | | NEQ                  | CAN                                | | PROVINCIAL_NUMBER    | CAN                                | | CRN                  | GBR, HKG                           | | VAT                  | GBR, IRL, BRA, NLD                 | | ACN                  | AUS                                | | ABN                  | AUS                                | | BRN                  | HKG                                | | SIREN                | FRA                                | | SIRET                | FRA                                | | NZBN                 | NZL                                | | UST_IDNR             | DEU                                | | CIF                  | ESP                                | | NIF                  | ESP                                | | CNPJ                 | BRA                                | | UID                  | CHE                                | | OTHER                | Must Provide Country Code          | | [optional] |
| **business_entity_type** | [**BusinessEntityTypeEnum**](BusinessEntityTypeEnum.md) |  |  |
| **help_message_response** | **String** | A message that gets sent to users requesting help. | [optional] |
| **age_gated_content** | **Boolean** | Indicates whether the content is age-gated. | [optional] |
| **cv_token** | **String** | The token provided by Campaign Verify to validate your political use case. Only required for 527 political organizations. If you are not a 527 political organization, this field should be omitted. Supplying an empty string will likely result in rejection. | [optional] |

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
  business_registration_issuing_country: USA,
  business_entity_type: null,
  help_message_response: Please contact support for assistance.,
  age_gated_content: false,
  cv_token: cv.user123|sess456|mno|tfree|read_write|X7yZ9aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVwXyZ0123456789aBcDeFgHiJkLmNoPqRsTuVw
)
```

