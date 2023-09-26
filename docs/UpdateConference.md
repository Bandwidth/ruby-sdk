# Bandwidth::UpdateConference

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | [**ConferenceStateEnum**](ConferenceStateEnum.md) |  | [optional][default to &#39;active&#39;] |
| **redirect_url** | **String** | The URL to send the [conferenceRedirect](/docs/voice/webhooks/conferenceRedirect) event which will provide new BXML. Not allowed if &#x60;state&#x60; is &#x60;completed&#x60;, but required if &#x60;state&#x60; is &#x60;active&#x60;. | [optional] |
| **redirect_method** | [**RedirectMethodEnum**](RedirectMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **username** | **String** | Basic auth username. | [optional] |
| **password** | **String** | Basic auth password. | [optional] |
| **redirect_fallback_url** | **String** | A fallback url which, if provided, will be used to retry the &#x60;conferenceRedirect&#x60; webhook delivery in case &#x60;redirectUrl&#x60; fails to respond.  Not allowed if &#x60;state&#x60; is &#x60;completed&#x60;. | [optional] |
| **redirect_fallback_method** | [**RedirectMethodEnum**](RedirectMethodEnum.md) |  | [optional][default to &#39;POST&#39;] |
| **fallback_username** | **String** | Basic auth username. | [optional] |
| **fallback_password** | **String** | Basic auth password. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::UpdateConference.new(
  status: null,
  redirect_url: https://myServer.example/bandwidth/webhooks/conferenceRedirect,
  redirect_method: null,
  username: mySecretUsername,
  password: mySecretPassword1!,
  redirect_fallback_url: https://myFallbackServer.example/bandwidth/webhooks/conferenceRedirect,
  redirect_fallback_method: null,
  fallback_username: mySecretUsername,
  fallback_password: mySecretPassword1!
)
```

