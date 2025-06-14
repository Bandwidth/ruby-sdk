# Bandwidth::VerificationDenialWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | User&#39;s account ID. | [optional] |
| **additional_denial_reasons** | [**Array&lt;AdditionalDenialReason&gt;**](AdditionalDenialReason.md) | An optional list of denial reasons in addition to declineReasonDescription when multiple reasons apply. | [optional] |
| **decline_reason_description** | **String** | Explanation for why a verification request was declined. | [optional] |
| **denial_status_code** | **Integer** | Reason code for denial. | [optional] |
| **internal_ticket_number** | **String** | Unique identifier (UUID) generated by Bandwidth to assist in tracking the verification status of a toll-free number. | [optional] |
| **phone_number** | **String** | Toll-free telephone number in E.164 format. | [optional] |
| **resubmit_allowed** | **Boolean** | Whether a Toll-Free Verification request qualifies for resubmission via PUT. | [optional] |
| **status** | **String** |  | [optional][default to &#39;UNVERIFIED&#39;] |
| **blocked** | **Boolean** | Whether a Toll-Free Verification is blocked. This attribute will only be defined when the number is blocked. | [optional] |
| **blocked_reason** | **String** | The reason why the Toll-Free Verification is blocked. This attribute will only be defined when the number is blocked. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::VerificationDenialWebhook.new(
  account_id: 1234567,
  additional_denial_reasons: [{&quot;statusCode&quot;:512,&quot;reason&quot;:&quot;Reason A&quot;,&quot;resubmitAllowed&quot;:true},{&quot;statusCode&quot;:513,&quot;reason&quot;:&quot;Reason B&quot;,&quot;resubmitAllowed&quot;:true}],
  decline_reason_description: Invalid Information - Can&#39;t Validate URL - Website is not accessible / not available,
  denial_status_code: 511,
  internal_ticket_number: acde070d-8c4c-4f0d-9d8a-162843c10333,
  phone_number: +18005555555,
  resubmit_allowed: true,
  status: UNVERIFIED,
  blocked: true,
  blocked_reason: Toll-free number was used to send spam messages
)
```

