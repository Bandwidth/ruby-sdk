# Bandwidth::LookupResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_number** | **String** | The telephone number in E.164 format. | [optional] |
| **line_type** | [**LineTypeEnum**](LineTypeEnum.md) |  | [optional] |
| **messaging_provider** | **String** | The messaging service provider of the telephone number. | [optional] |
| **voice_provider** | **String** | The voice service provider of the telephone number. | [optional] |
| **country_code_a3** | **String** | The country code of the telephone number in ISO 3166-1 alpha-3 format. | [optional] |
| **deactivation_reporter** | **String** | [DNI-Only](#section/DNI-Only). The carrier that reported a deactivation event for this phone number.  | [optional] |
| **deactivation_date** | **String** | [DNI-Only](#section/DNI-Only). The datetime the carrier reported a deactivation event. | [optional] |
| **deactivation_event** | [**DeactivationEventEnum**](DeactivationEventEnum.md) |  | [optional] |
| **latest_message_delivery_status** | [**LatestMessageDeliveryStatusEnum**](LatestMessageDeliveryStatusEnum.md) |  | [optional] |
| **initial_message_delivery_status_date** | **Date** | [DNI-Only](#section/DNI-Only). The date the phone number entered the status described in &#x60;latestMessageDeliveryStatus&#x60;.  Think of this as the \&quot;start time\&quot; for that status. Value resets every time the &#x60;latestMessageDeliveryStatus&#x60; changes. | [optional] |
| **latest_message_delivery_status_date** | **Date** | [DNI-Only](#section/DNI-Only). The date bandwidth last received delivery status information for this phone number.  Use this field to understand how up-to-date the &#x60;latestMessageDeliveryStatus&#x60; is. Value resets every time the &#x60;latestMessageDeliveryStatus&#x60; changes. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LookupResult.new(
  phone_number: +10072904498,
  line_type: null,
  messaging_provider: Verizon Wireless,
  voice_provider: Verizon Wireless,
  country_code_a3: USA,
  deactivation_reporter: null,
  deactivation_date: 2025-06-20 18:35,
  deactivation_event: null,
  latest_message_delivery_status: null,
  initial_message_delivery_status_date: Thu Jun 19 20:00:00 EDT 2025,
  latest_message_delivery_status_date: Fri Jun 20 20:00:00 EDT 2025
)
```

