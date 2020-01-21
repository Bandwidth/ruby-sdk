# Getting Started with bandwidth

Bandwidth's set of APIs

## Install the Package

Install the gem from the command line:

```ruby
gem install bandwidth-sdk -v 2.1.0
```

Or add the gem to your Gemfile and run `bundle`:

```ruby
gem 'bandwidth-sdk', '2.1.0'
```

For additional gem details, see the [RubyGems page for the bandwidth-sdk gem](https://rubygems.org/gems/bandwidth-sdk/versions/2.1.0).

## Initialize the API Client

The following parameters are configurable for the API Client.

| Parameter | Type | Description |
|  --- | --- | --- |
| `messaging_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `messaging_basic_auth_password` | `String` | The password to use with basic authentication |
| `voice_basic_auth_user_name` | `String` | The username to use with basic authentication |
| `voice_basic_auth_password` | `String` | The password to use with basic authentication |
| `environment` | Environment | The API environment. <br> **Default: `Environment.PRODUCTION`** |
| `timeout` | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 1** |

The API client can be initialized as following.

```ruby
client = Bandwidth::Client.new(
  messaging_basic_auth_user_name: 'MessagingBasicAuthUserName',
  messaging_basic_auth_password: 'MessagingBasicAuthPassword',
  voice_basic_auth_user_name: 'VoiceBasicAuthUserName',
  voice_basic_auth_password: 'VoiceBasicAuthPassword',
  environment: Environment::PRODUCTION,
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

## Authorization

This API does not require authentication.

## API Reference

### List of APIs

*

