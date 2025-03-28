# Bandwidth::InitiateCallback

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_type** | **String** | The event type, value can be one of the following: answer, bridgeComplete, bridgeTargetComplete, conferenceCreated, conferenceRedirect, conferenceMemberJoin, conferenceMemberExit, conferenceCompleted, conferenceRecordingAvailable, disconnect, dtmf, gather, initiate, machineDetectionComplete, recordingComplete, recordingAvailable, redirect, transcriptionAvailable, transferAnswer, transferComplete, transferDisconnect. | [optional] |
| **event_time** | **Time** | The approximate UTC date and time when the event was generated by the Bandwidth server, in ISO 8601 format. This may not be exactly the time of event execution. | [optional] |
| **account_id** | **String** | The user account associated with the call. | [optional] |
| **application_id** | **String** | The id of the application associated with the call. | [optional] |
| **from** | **String** | The provided identifier of the caller. Must be a phone number in E.164 format (e.g. +15555555555). | [optional] |
| **to** | **String** | The phone number that received the call, in E.164 format (e.g. +15555555555). | [optional] |
| **direction** | [**CallDirectionEnum**](CallDirectionEnum.md) |  | [optional] |
| **call_id** | **String** | The call id associated with the event. | [optional] |
| **call_url** | **String** | The URL of the call associated with the event. | [optional] |
| **start_time** | **Time** | Time the call was started, in ISO 8601 format. | [optional] |
| **diversion** | [**Diversion**](Diversion.md) |  | [optional] |
| **stir_shaken** | [**StirShaken**](StirShaken.md) |  | [optional] |
| **uui** | **String** | The value of the &#x60;User-To-User&#x60; header to send within the initial &#x60;INVITE&#x60;. Must include the encoding parameter as specified in RFC 7433. Only &#x60;base64&#x60;, &#x60;jwt&#x60; and &#x60;hex&#x60; encoding are currently allowed. This value, including the encoding specifier, may not exceed 256 characters. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::InitiateCallback.new(
  event_type: bridgeComplete,
  event_time: 2022-06-17T22:19:40.375Z,
  account_id: 9900000,
  application_id: 04e88489-df02-4e34-a0ee-27a91849555f,
  from: +15555555555,
  to: +15555555555,
  direction: null,
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  call_url: https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  start_time: 2022-06-17T22:19:40.375Z,
  diversion: null,
  stir_shaken: null,
  uui: bXktdXVp
)
```

