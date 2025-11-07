# Bandwidth::PhoneNumberLookupApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_async_bulk_lookup**](PhoneNumberLookupApi.md#create_async_bulk_lookup) | **POST** /accounts/{accountId}/phoneNumberLookup/bulk | Create Asynchronous Bulk Number Lookup |
| [**create_sync_lookup**](PhoneNumberLookupApi.md#create_sync_lookup) | **POST** /accounts/{accountId}/phoneNumberLookup | Create Synchronous Number Lookup |
| [**get_async_bulk_lookup**](PhoneNumberLookupApi.md#get_async_bulk_lookup) | **GET** /accounts/{accountId}/phoneNumberLookup/bulk/{requestId} | Get Asynchronous Bulk Number Lookup |


## create_async_bulk_lookup

> <CreateAsyncBulkLookupResponse> create_async_bulk_lookup(account_id, async_lookup_request)

Create Asynchronous Bulk Number Lookup

Creates an asynchronous bulk phone number lookup request. Maximum of 15,000 telephone numbers per request. Use the [Get Asynchronous Bulk Number Lookup](#tag/Phone-Number-Lookup/operation/getAsyncBulkLookup) endpoint to check the status of the request and view the results.

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
account_id = '9900000' # String | 
async_lookup_request = Bandwidth::AsyncLookupRequest.new({phone_numbers: ['phone_numbers_example']}) # AsyncLookupRequest | Asynchronous bulk phone number lookup request.

begin
  # Create Asynchronous Bulk Number Lookup
  result = api_instance.create_async_bulk_lookup(account_id, async_lookup_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_async_bulk_lookup: #{e}"
end
```

#### Using the create_async_bulk_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateAsyncBulkLookupResponse>, Integer, Hash)> create_async_bulk_lookup_with_http_info(account_id, async_lookup_request)

```ruby
begin
  # Create Asynchronous Bulk Number Lookup
  data, status_code, headers = api_instance.create_async_bulk_lookup_with_http_info(account_id, async_lookup_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateAsyncBulkLookupResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_async_bulk_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **async_lookup_request** | [**AsyncLookupRequest**](AsyncLookupRequest.md) | Asynchronous bulk phone number lookup request. |  |

### Return type

[**CreateAsyncBulkLookupResponse**](CreateAsyncBulkLookupResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_sync_lookup

> <CreateSyncLookupResponse> create_sync_lookup(account_id, sync_lookup_request)

Create Synchronous Number Lookup

Creates a synchronous phone number lookup request. Maximum of 100 telephone numbers per request.

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
account_id = '9900000' # String | 
sync_lookup_request = Bandwidth::SyncLookupRequest.new({phone_numbers: ['phone_numbers_example']}) # SyncLookupRequest | Synchronous phone number lookup request.

begin
  # Create Synchronous Number Lookup
  result = api_instance.create_sync_lookup(account_id, sync_lookup_request)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_sync_lookup: #{e}"
end
```

#### Using the create_sync_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateSyncLookupResponse>, Integer, Hash)> create_sync_lookup_with_http_info(account_id, sync_lookup_request)

```ruby
begin
  # Create Synchronous Number Lookup
  data, status_code, headers = api_instance.create_sync_lookup_with_http_info(account_id, sync_lookup_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateSyncLookupResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->create_sync_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **sync_lookup_request** | [**SyncLookupRequest**](SyncLookupRequest.md) | Synchronous phone number lookup request. |  |

### Return type

[**CreateSyncLookupResponse**](CreateSyncLookupResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_async_bulk_lookup

> <GetAsyncBulkLookupResponse> get_async_bulk_lookup(account_id, request_id)

Get Asynchronous Bulk Number Lookup

Get an existing [Asynchronous Bulk Number Lookup](#tag/Phone-Number-Lookup/operation/createAsyncBulkLookup). Use this endpoint to check the status of the request and view the results.

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
account_id = '9900000' # String | 
request_id = '004223a0-8b17-41b1-bf81-20732adf5590' # String | 

begin
  # Get Asynchronous Bulk Number Lookup
  result = api_instance.get_async_bulk_lookup(account_id, request_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->get_async_bulk_lookup: #{e}"
end
```

#### Using the get_async_bulk_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAsyncBulkLookupResponse>, Integer, Hash)> get_async_bulk_lookup_with_http_info(account_id, request_id)

```ruby
begin
  # Get Asynchronous Bulk Number Lookup
  data, status_code, headers = api_instance.get_async_bulk_lookup_with_http_info(account_id, request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAsyncBulkLookupResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling PhoneNumberLookupApi->get_async_bulk_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **request_id** | **String** |  |  |

### Return type

[**GetAsyncBulkLookupResponse**](GetAsyncBulkLookupResponse.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

