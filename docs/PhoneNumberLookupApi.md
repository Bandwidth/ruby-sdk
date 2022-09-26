# Bandwidth::PhoneNumberLookupApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_lookup**](PhoneNumberLookupApi.md#create_lookup) | **POST** /accounts/{accountId}/tnlookup | Create Lookup |
| [**get_lookup_status**](PhoneNumberLookupApi.md#get_lookup_status) | **GET** /accounts/{accountId}/tnlookup/{requestId} | Get Lookup Request Status |


## create_lookup

> <CreateLookupResponse> create_lookup(account_id, lookup_request)

Create Lookup

Create a Phone Number Lookup Request.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::PhoneNumberLookupApi.new
account_id = '9900000' # String | The ID of the Bandwidth account that the user belongs to.
lookup_request = Bandwidth::LookupRequest.new({tns: ['tns_example']}) # LookupRequest | Phone number lookup request.

begin
  # Create Lookup
  result = api_instance.create_lookup(account_id, lookup_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_lookup: #{e}"
end
```

#### Using the create_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateLookupResponse>, Integer, Hash)> create_lookup_with_http_info(account_id, lookup_request)

```ruby
begin
  # Create Lookup
  data, status_code, headers = api_instance.create_lookup_with_http_info(account_id, lookup_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateLookupResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The ID of the Bandwidth account that the user belongs to. |  |
| **lookup_request** | [**LookupRequest**](LookupRequest.md) | Phone number lookup request. |  |

### Return type

[**CreateLookupResponse**](CreateLookupResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_lookup_status

> <LookupStatus> get_lookup_status(account_id, request_id)

Get Lookup Request Status

Get an existing Phone Number Lookup Request.

### Examples

```ruby
require 'time'
require 'bandwidth-sdk'
# setup authorization
Bandwidth.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Bandwidth::PhoneNumberLookupApi.new
account_id = '9900000' # String | The ID of the Bandwidth account that the user belongs to.
request_id = '004223a0-8b17-41b1-bf81-20732adf5590' # String | The phone number lookup request ID from Bandwidth.

begin
  # Get Lookup Request Status
  result = api_instance.get_lookup_status(account_id, request_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->get_lookup_status: #{e}"
end
```

#### Using the get_lookup_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LookupStatus>, Integer, Hash)> get_lookup_status_with_http_info(account_id, request_id)

```ruby
begin
  # Get Lookup Request Status
  data, status_code, headers = api_instance.get_lookup_status_with_http_info(account_id, request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LookupStatus>
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->get_lookup_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The ID of the Bandwidth account that the user belongs to. |  |
| **request_id** | **String** | The phone number lookup request ID from Bandwidth. |  |

### Return type

[**LookupStatus**](LookupStatus.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

