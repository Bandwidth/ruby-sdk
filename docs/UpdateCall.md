# Bandwidth::UpdateCall

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **state** | [**CallStateEnum**](CallStateEnum.md) |  | [optional][default to &#39;active&#39;] |
| **redirect_url** | **String** | The URL to send the [Redirect](/docs/voice/bxml/redirect) event to which will provide new BXML.  Required if &#x60;state&#x60; is &#x60;active&#x60;.  Not allowed if &#x60;state&#x60; is &#x60;completed&#x60;. | [optional] |
| **redirect_method** | [**RedirectMethodEnum**](RedirectMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **redirect_fallback_url** | **String** | A fallback url which, if provided, will be used to retry the redirect callback delivery in case &#x60;redirectUrl&#x60; fails to respond. | [optional] |
| **redirect_fallback_method** | [**RedirectMethodEnum**](RedirectMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **fallback_username** | **String** | Basic auth username. | [optional] |
| **fallback_password** | **String** | Basic auth password. | [optional] |
| **tag** | **String** | A custom string that will be sent with this and all future callbacks unless overwritten by a future &#x60;tag&#x60; attribute or [&#x60;&lt;Tag&gt;&#x60;](/docs/voice/bxml/tag) verb, or cleared.  May be cleared by setting &#x60;tag&#x3D;\&quot;\&quot;&#x60;.  Max length 256 characters.  Not allowed if &#x60;state&#x60; is &#x60;completed&#x60;. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::UpdateCall.new(
  state: null,
  redirect_url: https://myServer.example/bandwidth/webhooks/redirect,
  redirect_method: null,
  username: mySecretUsername,
  password: mySecretPassword1!,
  redirect_fallback_url: https://myFallbackServer.example/bandwidth/webhooks/redirect,
  redirect_fallback_method: null,
  fallback_username: mySecretUsername,
  fallback_password: mySecretPassword1!,
  tag: My Custom Tag
)
```

