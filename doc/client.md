
# Client Class Documentation

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| `messaging_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `messaging_basic_auth_password` | `String` | The password to use with basic authentication |
| `multi_factor_auth_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `multi_factor_auth_basic_auth_password` | `String` | The password to use with basic authentication |
| `phone_number_lookup_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `phone_number_lookup_basic_auth_password` | `String` | The password to use with basic authentication |
| `voice_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `voice_basic_auth_password` | `String` | The password to use with basic authentication |
| `web_rtc_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `web_rtc_basic_auth_password` | `String` | The password to use with basic authentication |
| `base_url` | `String` | *Default*: `'https://www.example.com'` |
| `environment` | Environment | The API environment. <br> **Default: `Environment.PRODUCTION`** |
| `timeout` | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| `retry_statuses` | `Array` | A list of HTTP statuses to retry. <br> **Default: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524, 408, 413, 429, 500, 502, 503, 504, 521, 522, 524]** |
| `retry_methods` | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put get put]** |

The API client can be initialized as follows:

```ruby
client = Bandwidth::Client.new(
  messaging_basic_auth_user_name: 'MessagingBasicAuthUserName',
  messaging_basic_auth_password: 'MessagingBasicAuthPassword',
  multi_factor_auth_basic_auth_user_name: 'MultiFactorAuthBasicAuthUserName',
  multi_factor_auth_basic_auth_password: 'MultiFactorAuthBasicAuthPassword',
  phone_number_lookup_basic_auth_user_name: 'PhoneNumberLookupBasicAuthUserName',
  phone_number_lookup_basic_auth_password: 'PhoneNumberLookupBasicAuthPassword',
  voice_basic_auth_user_name: 'VoiceBasicAuthUserName',
  voice_basic_auth_password: 'VoiceBasicAuthPassword',
  web_rtc_basic_auth_user_name: 'WebRtcBasicAuthUserName',
  web_rtc_basic_auth_password: 'WebRtcBasicAuthPassword',
  environment: Environment::PRODUCTION,
  base_url: 'https://www.example.com',
)
```

API calls return an `ApiResponse` object that includes the following fields:

| Field | Description |
|  --- | --- |
| `status_code` | Status code of the HTTP response |
| `reason_phrase` | Reason phrase of the HTTP response |
| `headers` | Headers of the HTTP response as a Hash |
| `raw_body` | The body of the HTTP response as a String |
| `request` | HTTP request info |
| `errors` | Errors, if they exist |
| `data` | The deserialized body of the HTTP response |

## bandwidth Client

The gateway for the SDK. This class acts as a factory for the Controllers and also holds the configuration of the SDK.

