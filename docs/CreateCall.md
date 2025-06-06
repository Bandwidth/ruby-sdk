# Bandwidth::CreateCall

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | The destination to call (must be an E.164 formatted number (e.g. &#x60;+15555551212&#x60;) or a SIP URI (e.g. &#x60;sip:user@server.example&#x60;)). |  |
| **from** | **String** | A Bandwidth phone number on your account the call should come from (must be in E.164 format, like &#x60;+15555551212&#x60;) even if &#x60;privacy&#x60; is set to true. |  |
| **privacy** | **Boolean** | Hide the calling number. The &#x60;displayName&#x60; field can be used to customize the displayed name. | [optional] |
| **display_name** | **String** | The caller display name to use when the call is created.  May not exceed 256 characters nor contain control characters such as new lines. If &#x60;privacy&#x60; is true, only the following values are valid: &#x60;Restricted&#x60;, &#x60;Anonymous&#x60;, &#x60;Private&#x60;, or &#x60;Unavailable&#x60;. | [optional] |
| **uui** | **String** | A comma-separated list of &#39;User-To-User&#39; headers to be sent in the INVITE when calling a SIP URI. Each value must end with an &#39;encoding&#39; parameter as described in &lt;a href&#x3D;&#39;https://tools.ietf.org/html/rfc7433&#39;&gt;RFC 7433&lt;/a&gt;. Only &#39;jwt&#39;, &#39;base64&#39; and &#39;hex&#39; encodings are allowed. The entire value cannot exceed 350 characters, including parameters and separators. | [optional] |
| **application_id** | **String** | The id of the application associated with the &#x60;from&#x60; number. |  |
| **answer_url** | **String** | The full URL to send the &lt;a href&#x3D;&#39;/docs/voice/webhooks/answer&#39;&gt;Answer&lt;/a&gt; event to when the called party answers. This endpoint should return the first &lt;a href&#x3D;&#39;/docs/voice/bxml&#39;&gt;BXML document&lt;/a&gt; to be executed in the call.  Must use &#x60;https&#x60; if specifying &#x60;username&#x60; and &#x60;password&#x60;. |  |
| **answer_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **answer_fallback_url** | **String** | A fallback url which, if provided, will be used to retry the &#x60;answer&#x60; webhook delivery in case &#x60;answerUrl&#x60; fails to respond  Must use &#x60;https&#x60; if specifying &#x60;fallbackUsername&#x60; and &#x60;fallbackPassword&#x60;. | [optional] |
| **answer_fallback_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **fallback_username** | **String** | Basic auth username. | [optional] |
| **fallback_password** | **String** | Basic auth password. | [optional] |
| **disconnect_url** | **String** | The URL to send the &lt;a href&#x3D;&#39;/docs/voice/webhooks/disconnect&#39;&gt;Disconnect&lt;/a&gt; event to when the call ends. This event does not expect a BXML response. | [optional] |
| **disconnect_method** | [**CallbackMethodEnum**](CallbackMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **call_timeout** | **Float** | The timeout (in seconds) for the callee to answer the call after it starts ringing. If the call does not start ringing within 30s, the call will be cancelled regardless of this value.  Can be any numeric value (including decimals) between 1 and 300. | [optional][default to 30] |
| **callback_timeout** | **Float** | This is the timeout (in seconds) to use when delivering webhooks for the call. Can be any numeric value (including decimals) between 1 and 25. | [optional][default to 15] |
| **machine_detection** | [**MachineDetectionConfiguration**](MachineDetectionConfiguration.md) |  | [optional] |
| **priority** | **Integer** | The priority of this call over other calls from your account. For example, if during a call your application needs to place a new call and bridge it with the current call, you might want to create the call with priority 1 so that it will be the next call picked off your queue, ahead of other less time sensitive calls. A lower value means higher priority, so a priority 1 call takes precedence over a priority 2 call. | [optional][default to 5] |
| **tag** | **String** | A custom string that will be sent with all webhooks for this call unless overwritten by a future &lt;a href&#x3D;&#39;/docs/voice/bxml/tag&#39;&gt;&#x60;&lt;Tag&gt;&#x60;&lt;/a&gt; verb or &#x60;tag&#x60; attribute on another verb, or cleared.  May be cleared by setting &#x60;tag&#x3D;\&quot;\&quot;&#x60;  Max length 256 characters. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::CreateCall.new(
  to: +19195551234,
  from: +15555551212,
  privacy: false,
  display_name: John Doe,
  uui: eyJhbGciOiJIUzI1NiJ9.WyJoaSJd.-znkjYyCkgz4djmHUPSXl9YrJ6Nix_XvmlwKGFh5ERM;encoding&#x3D;jwt,aGVsbG8gd29ybGQ;encoding&#x3D;base64,
  application_id: 1234-qwer-5679-tyui,
  answer_url: https://www.myCallbackServer.example/webhooks/answer,
  answer_method: null,
  username: mySecretUsername,
  password: mySecretPassword1!,
  answer_fallback_url: https://www.myFallbackServer.example/webhooks/answer,
  answer_fallback_method: null,
  fallback_username: mySecretUsername,
  fallback_password: mySecretPassword1!,
  disconnect_url: https://www.myCallbackServer.example/webhooks/disconnect,
  disconnect_method: null,
  call_timeout: 30,
  callback_timeout: 15,
  machine_detection: null,
  priority: 5,
  tag: arbitrary text here
)
```

