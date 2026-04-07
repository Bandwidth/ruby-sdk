# Bandwidth::TfvSubmissionInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_address** | [**Address**](Address.md) |  | [optional] |
| **business_contact** | [**Contact**](Contact.md) |  | [optional] |
| **message_volume** | **Integer** | Estimated monthly volume of messages from the toll-free number. | [optional] |
| **use_case** | **String** | The category of the use case. | [optional] |
| **use_case_summary** | **String** | A general idea of the use case and customer. | [optional] |
| **production_message_content** | **String** | Example of message content. | [optional] |
| **opt_in_workflow** | [**OptInWorkflow**](OptInWorkflow.md) |  | [optional] |
| **additional_information** | **String** | Any additional information. | [optional] |
| **isv_reseller** | **String** | ISV name. | [optional] |
| **privacy_policy_url** | **String** | The Toll-Free Verification request privacy policy URL. | [optional] |
| **terms_and_conditions_url** | **String** | The Toll-Free Verification request terms and conditions policy URL. | [optional] |
| **business_dba** | **String** | The company &#39;Doing Business As&#39;. | [optional] |
| **business_registration_number** | **String** | Government-issued business identifying number.  **Note: As of October 19th, 2026 this field will be required when &#x60;businessEntityType&#x60; is _not_ &#x60;SOLE_PROPRIETOR&#x60;. If this field is provided, &#x60;businessRegistrationType&#x60; and &#x60;businessRegistrationIssuingCountry&#x60; are also required.**  | [optional] |
| **business_registration_type** | [**BusinessRegistrationTypeEnum**](BusinessRegistrationTypeEnum.md) |  | [optional] |
| **business_registration_issuing_country** | **String** | The country issuing the business registration in ISO-3166-1 alpha-3 format. Alpha-2 format is accepted by the API, but alpha-3 is highly encouraged.  **Note: As of October 19th, 2026 this field will be required when &#x60;businessRegistrationNumber&#x60; is provided.**  | Registration Type     | Supported Countries                | |----------------------|------------------------------------| | EIN                  | USA                                | | CBN                  | CAN                                | | NEQ                  | CAN                                | | PROVINCIAL_NUMBER    | CAN                                | | CRN                  | GBR, HKG                           | | VAT                  | GBR, IRL, BRA, NLD                 | | ACN                  | AUS                                | | ABN                  | AUS                                | | BRN                  | HKG                                | | SIREN                | FRA                                | | SIRET                | FRA                                | | NZBN                 | NZL                                | | UST_IDNR             | DEU                                | | CIF                  | ESP                                | | NIF                  | ESP                                | | CNPJ                 | BRA                                | | UID                  | CHE                                | | OTHER                | Must Provide Country Code          | | [optional] |
| **business_entity_type** | [**BusinessEntityTypeEnum**](BusinessEntityTypeEnum.md) |  | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::TfvSubmissionInfo.new(
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
  business_registration_issuing_country: USA,
  business_entity_type: null
)
```

