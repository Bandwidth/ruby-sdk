# Bandwidth Ruby SDK

[![Nightly Tests](https://github.com/Bandwidth/ruby-sdk/actions/workflows/test-nightly.yml/badge.svg)](https://github.com/Bandwidth/ruby-sdk/actions/workflows/test-nightly.yml)


| **OS** | **Ruby** |
|:---:|:---:|
| Windows 2016 | 2.6, 2.7, 3.0 |
| Windows 2019 | 2.6, 2.7, 3.0 |
| Ubuntu 20.04 | 2.6, 2.7, 3.0 |
| Ubuntu 22.04 | 2.6, 2.7, 3.0 |

## Getting Started

### Installation

```
gem install bandwidth-sdk
```

### Initialize

```ruby
require 'bandwidth'

include Bandwidth
include Bandwidth::Voice
include Bandwidth::Messaging
include Bandwidth::WebRtc
include Bandwidth::TwoFactorAuth

bandwidth_client = Bandwidth::Client.new(
    voice_basic_auth_user_name: 'username',
    voice_basic_auth_password: 'password',
    messaging_basic_auth_user_name: 'username',
    messaging_basic_auth_password: 'username',
    two_factor_auth_basic_auth_user_name: 'username',
    two_factor_auth_basic_auth_password: 'password',
    web_rtc_basic_auth_user_name: 'username',
    web_rtc_basic_auth_password: 'password'
)
account_id = "12345"
```

### Create Phone Call

```ruby
voice_client = bandwidth_client.voice_client.client

body = ApiCreateCallRequest.new
body.from = '+16666666666'
body.to = '+17777777777'
body.answer_url = 'https://test.com'
body.application_id = '3-d-4-b-5'

begin
    response = voice_client.create_call(account_id,:body => body)
    puts response.data.call_id #c-d45a41e5-bcb12581-b18e-4bdc-9874-6r3235dfweao
    puts response.status_code #201
rescue Bandwidth::ErrorResponseException => e
    puts e.description #Invalid to: must be an E164 telephone number
    puts e.response_code #400
end
```

### Generate BXML

```ruby
response = Bandwidth::Voice::Response.new()
hangup = Bandwidth::Voice::Hangup.new()

response.push(hangup)
puts response.to_bxml()
```

### Send Text Message

```ruby
messaging_client = bandwidth_client.messaging_client.client

body = MessageRequest.new
body.application_id = '1-2-3'
body.to = ['+17777777777']
body.from = '+18888888888'
body.text = 'Hello from Bandwidth'

begin
    response = messaging_client.create_message(account_id, body)
    puts response.data.id #1570740275373xbn7mbhsfewasdr
    puts response.status_code #202
rescue Bandwidth::GenericClientException => e
    puts e.description #Access is denied
    puts e.response_code #403
rescue Bandwidth::PathClientException => e
    puts e.message #Your request could not be accepted.
    puts e.response_code #400
end
```

### Create A MFA Request

```ruby
auth_client = bandwidth_client.two_factor_auth_client.mfa

from_phone = "+18888888888"
to_phone = "+17777777777"
messaging_application_id = "1-d-b"
scope = "scope"
digits = 6

body = TwoFactorCodeRequestSchema.new
body.from = from_phone
body.to = to_phone
body.application_id = messaging_application_id
body.scope = scope
body.digits = digits
body.message = "Your temporary {NAME} {SCOPE} code is {CODE}"

auth_client.create_messaging_two_factor(account_id, body)

code = "123456" #This is the user input to validate

body = TwoFactorVerifyRequestSchema.new
body.from = from_phone
body.to = to_phone
body.application_id = application_id
body.scope = scope
body.code = code
body.digits = digits
body.expiration_time_in_minutes = 3

response = auth_client.create_verify_two_factor(account_id, body)
puts "Auth status: " + response.data.valid.to_s
```

### WebRtc Participant & Session Management

```ruby
web_rtc_client = bandwidth_client.web_rtc_client.client

create_session_body = Session.new
create_session_body.tag = 'new-session'

create_session_response = web_rtc_client.create_session(account_id, :body => create_session_body)
session_id = create_session_response.data.id
puts session_id

create_participant_body = Participant.new
create_participant_body.publish_permissions = [
    PublishPermissionEnum::AUDIO,
    PublishPermissionEnum::VIDEO
]
create_participant_body.callback_url = "https://sample.com"

create_participant_response = web_rtc_client.create_participant(account_id, :body => create_participant_body)
participant_id = create_participant_response.data.participant.id
puts participant_id

body = Subscriptions.new
body.session_id = "1234-abcd"

web_rtc_client.add_participant_to_session(account_id, session_id, participant_id, body: body)
```

## Supported Ruby Versions

This package can be used with Ruby >= 2.0 

## Documentation

Documentation for this package can be found at https://dev.bandwidth.com/sdks/ruby.html

## Credentials

Information for credentials for this package can be found at https://dev.bandwidth.com/guides/accountCredentials.html
