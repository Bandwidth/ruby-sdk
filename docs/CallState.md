# Bandwidth::CallState

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **application_id** | **String** | The application id associated with the call. | [optional] |
| **account_id** | **String** | The account id associated with the call. | [optional] |
| **call_id** | **String** | The programmable voice API call ID. | [optional] |
| **parent_call_id** | **String** | The A-leg call id, set only if this call is the B-leg of a [&#x60;&lt;Transfer&gt;&#x60;](/docs/voice/bxml/transfer). | [optional] |
| **to** | **String** | The phone number that received the call, in E.164 format (e.g. +15555555555), or if the call was to a SIP URI, the SIP URI | [optional] |
| **from** | **String** | The phone number that made the call, in E.164 format (e.g. +15555555555). | [optional] |
| **direction** | [**CallDirectionEnum**](CallDirectionEnum.md) |  | [optional] |
| **state** | **String** | The current state of the call. Current possible values are &#x60;queued&#x60;, &#x60;initiated&#x60;, &#x60;answered&#x60; and &#x60;disconnected&#x60;. Additional states may be added in the future, so your application must be tolerant of unknown values. | [optional] |
| **stir_shaken** | **Hash&lt;String, String&gt;** | For inbound calls, the Bandwidth STIR/SHAKEN implementation will verify the information provided in the inbound invite request &#x60;Identity&#x60; header. The verification status is stored in the call state &#x60;stirShaken&#x60; property as follows.  | Property          | Description | |:------------------|:------------| | verstat | (optional) The verification status indicating whether the verification was successful or not. Possible values are &#x60;TN-Verification-Passed&#x60; or &#x60;TN-Verification-Failed&#x60;. | | attestationIndicator | (optional) The attestation level verified by Bandwidth. Possible values are &#x60;A&#x60; (full), &#x60;B&#x60; (partial) or &#x60;C&#x60; (gateway). | | originatingId | (optional) A unique origination identifier. |  Note that these are common properties but that the &#x60;stirShaken&#x60; object is free form and can contain other key-value pairs.  More information: [Understanding STIR/SHAKEN](https://www.bandwidth.com/regulations/stir-shaken) | [optional] |
| **identity** | **String** | The value of the &#x60;Identity&#x60; header from the inbound invite request. Only present for inbound calls and if the account is configured to forward this header. | [optional] |
| **enqueued_time** | **Time** | The time this call was placed in queue. | [optional] |
| **start_time** | **Time** | The time the call was initiated, in ISO 8601 format. &#x60;null&#x60; if the call is still in your queue. | [optional] |
| **answer_time** | **Time** | Populated once the call has been answered, with the time in ISO 8601 format. | [optional] |
| **end_time** | **Time** | Populated once the call has ended, with the time in ISO 8601 format. | [optional] |
| **disconnect_cause** | **String** | | Cause | Description | |:------|:------------| | &#x60;hangup&#x60;| One party hung up the call, a [&#x60;&lt;Hangup&gt;&#x60;](../../bxml/verbs/hangup.md) verb was executed, or there was no more BXML to execute; it indicates that the call ended normally. | | &#x60;busy&#x60; | Callee was busy. | | &#x60;timeout&#x60; | Call wasn&#39;t answered before the &#x60;callTimeout&#x60; was reached. | | &#x60;cancel&#x60; | Call was cancelled by its originator while it was ringing. | | &#x60;rejected&#x60; | Call was rejected by the callee. | | &#x60;callback-error&#x60; | BXML callback couldn&#39;t be delivered to your callback server. | | &#x60;invalid-bxml&#x60; | Invalid BXML was returned in response to a callback. | | &#x60;application-error&#x60; | An unsupported action was tried on the call, e.g. trying to play a .ogg audio. | | &#x60;account-limit&#x60; | Account rate limits were reached. | | &#x60;node-capacity-exceeded&#x60; | System maximum capacity was reached. | | &#x60;error&#x60; | Some error not described in any of the other causes happened on the call. | | &#x60;unknown&#x60; | Unknown error happened on the call. |  Note: This list is not exhaustive and other values can appear in the future. | [optional] |
| **error_message** | **String** | Populated only if the call ended with an error, with text explaining the reason. | [optional] |
| **error_id** | **String** | Populated only if the call ended with an error, with a Bandwidth internal id that references the error event. | [optional] |
| **last_update** | **Time** | The last time the call had a state update, in ISO 8601 format. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CallState.new(
  application_id: 04e88489-df02-4e34-a0ee-27a91849555f,
  account_id: 9900000,
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  parent_call_id: c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  to: +19195551234,
  from: 19195554321,
  direction: null,
  state: disconnected,
  stir_shaken: {&quot;verstat&quot;:&quot;TN-Verification-Passed&quot;,&quot;attestationIndicator&quot;:&quot;A&quot;,&quot;originatingId&quot;:&quot;abc123&quot;},
  identity: eyJhbGciOiJFUzI1NiIsInBwdCI6InNoYWtlbiIsInR5cCI6InBhc3Nwb3J0IiwieDV1IjoiaHR0cHM6Ly9idy1zaGFrZW4tY2VydC1wdWIuczMuYW1hem9uYXdzLmNvbS9iYW5kd2lkdGgtc2hha2VuLWNlcnRfMjAyMzA3MTYucGVtIn0.eyJhdHRlc3QiOiJBIiwiZGVzdCI6eyJ0biI6WyIxOTg0MjgyMDI4MCJdfSwiaWF0IjoxNjU2NTM0MzM2LCJvcmlnIjp7InRuIjoiMTkxOTQ0NDI2ODMifSwib3JpZ2lkIjoiNDk0NTlhOGEtNDJmNi0zNTFjLTkzNjEtYWRmNTdhOWUwOGNhIn0.56un9sRw_uH-sbJvnUsqdevlVxbOVjn8MVlGTlBMicjaZuRRwxfiNp-C9zYCMKTTCbc-QdYPN05F61XNVN4D3w;info&#x3D;&lt;https://bw-shaken-cert-pub.s3.amazonaws.com/bandwidth-shaken-cert_20230716.pem&gt;;alg&#x3D;ES256;ppt&#x3D;shaken,
  enqueued_time: 2022-06-16T13:15:07.160Z,
  start_time: 2022-06-16T13:15:07.160Z,
  answer_time: 2022-06-16T13:15:18.126Z,
  end_time: 2022-06-16T13:15:18.314Z,
  disconnect_cause: null,
  error_message: null,
  error_id: null,
  last_update: 2022-06-16T13:15:18.314Z
)
```

