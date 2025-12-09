# Bandwidth::MFAApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_messaging_code**](MFAApi.md#generate_messaging_code) | **POST** /accounts/{accountId}/code/messaging | Messaging Authentication Code |
| [**generate_voice_code**](MFAApi.md#generate_voice_code) | **POST** /accounts/{accountId}/code/voice | Voice Authentication Code |
| [**verify_code**](MFAApi.md#verify_code) | **POST** /accounts/{accountId}/code/verify | Verify Authentication Code |


## generate_messaging_code

> <MessagingCodeResponse> generate_messaging_code(account_id, code_request)

Messaging Authentication Code

Send an MFA code via text message (SMS).

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'

  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Bandwidth::MFAApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
code_request = Bandwidth::CodeRequest.new({to: '+19195551234', from: '+19195554321', application_id: '66fd98ae-ac8d-a00f-7fcd-ba3280aeb9b1', message: 'Your temporary {NAME} {SCOPE} code is {CODE}', digits: 6}) # CodeRequest | MFA code request body.

begin
  # Messaging Authentication Code
  result = api_instance.generate_messaging_code(account_id, code_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->generate_messaging_code: #{e}"
end
```

#### Using the generate_messaging_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagingCodeResponse>, Integer, Hash)> generate_messaging_code_with_http_info(account_id, code_request)

```ruby
begin
  # Messaging Authentication Code
  data, status_code, headers = api_instance.generate_messaging_code_with_http_info(account_id, code_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagingCodeResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->generate_messaging_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **code_request** | [**CodeRequest**](CodeRequest.md) | MFA code request body. |  |

### Return type

[**MessagingCodeResponse**](MessagingCodeResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_voice_code

> <VoiceCodeResponse> generate_voice_code(account_id, code_request)

Voice Authentication Code

Send an MFA Code via a phone call.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'

  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Bandwidth::MFAApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
code_request = Bandwidth::CodeRequest.new({to: '+19195551234', from: '+19195554321', application_id: '66fd98ae-ac8d-a00f-7fcd-ba3280aeb9b1', message: 'Your temporary {NAME} {SCOPE} code is {CODE}', digits: 6}) # CodeRequest | MFA code request body.

begin
  # Voice Authentication Code
  result = api_instance.generate_voice_code(account_id, code_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->generate_voice_code: #{e}"
end
```

#### Using the generate_voice_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VoiceCodeResponse>, Integer, Hash)> generate_voice_code_with_http_info(account_id, code_request)

```ruby
begin
  # Voice Authentication Code
  data, status_code, headers = api_instance.generate_voice_code_with_http_info(account_id, code_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VoiceCodeResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->generate_voice_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **code_request** | [**CodeRequest**](CodeRequest.md) | MFA code request body. |  |

### Return type

[**VoiceCodeResponse**](VoiceCodeResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_code

> <VerifyCodeResponse> verify_code(account_id, verify_code_request)

Verify Authentication Code

Verify a previously sent MFA code.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'

  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Bandwidth::MFAApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
verify_code_request = Bandwidth::VerifyCodeRequest.new({to: '+19195551234', expiration_time_in_minutes: 3, code: '123456'}) # VerifyCodeRequest | MFA code verify request body.

begin
  # Verify Authentication Code
  result = api_instance.verify_code(account_id, verify_code_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->verify_code: #{e}"
end
```

#### Using the verify_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VerifyCodeResponse>, Integer, Hash)> verify_code_with_http_info(account_id, verify_code_request)

```ruby
begin
  # Verify Authentication Code
  data, status_code, headers = api_instance.verify_code_with_http_info(account_id, verify_code_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VerifyCodeResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling MFAApi->verify_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **verify_code_request** | [**VerifyCodeRequest**](VerifyCodeRequest.md) | MFA code verify request body. |  |

### Return type

[**VerifyCodeResponse**](VerifyCodeResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

