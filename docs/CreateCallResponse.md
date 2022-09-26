# Bandwidth::CreateCallResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **application_id** | **String** | The id of the application associated with the &#x60;from&#x60; number. |  |
| **account_id** | **String** | The bandwidth account ID associated with the call |  |
| **call_id** | **String** | Programmable Voice API Call ID |  |
| **to** | **String** | Recipient of the outgoing call |  |
| **from** | **String** | Phone number that created the outbound call |  |
| **enqueued_time** | **Time** | Time the call was accepted into the queue | [optional] |
| **call_url** | **String** | The URL to update call state |  |
| **call_timeout** | **Float** | The timeout (in seconds) for the callee to answer the call after it starts ringing. | [optional] |
| **callback_timeout** | **Float** | This is the timeout (in seconds) to use when delivering webhooks for the call. | [optional] |
| **tag** | **String** | Custom tag value | [optional] |
| **answer_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [default to &#39;POST&#39;] |
| **answer_url** | **String** | URL to deliver the &#x60;answer&#x60; event webhook. |  |
| **answer_fallback_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **answer_fallback_url** | **String** | Fallback URL to deliver the &#x60;answer&#x60; event webhook. | [optional] |
| **disconnect_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [default to &#39;POST&#39;] |
| **disconnect_url** | **String** | URL to deliver the &#x60;disconnect&#x60; event webhook. | [optional] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **fallback_username** | **String** | Basic auth username. | [optional] |
| **fallback_password** | **String** | Basic auth password. | [optional] |
| **priority** | **Float** | The priority of this call over other calls from your account. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateCallResponse.new(
  application_id: 04e88489-df02-4e34-a0ee-27a91849555f,
  account_id: 9900000,
  call_id: c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  to: +19195551234,
  from: +19195554321,
  enqueued_time: 2022-06-16T13:15:07.160Z,
  call_url: https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85,
  call_timeout: 30,
  callback_timeout: 15,
  tag: My custom tag value,
  answer_method: null,
  answer_url: https://myServer.com/bandwidth/webhooks/answer,
  answer_fallback_method: null,
  answer_fallback_url: https://myFallbackServer.com/bandwidth/webhooks/answer,
  disconnect_method: null,
  disconnect_url: https://myServer.com/bandwidth/webhooks/disconnect,
  username: mySecretUsername,
  password: mySecretPassword1!,
  fallback_username: mySecretUsername,
  fallback_password: mySecretPassword1!,
  priority: 5
)
```

