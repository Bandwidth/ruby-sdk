# Bandwidth::StatisticsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_statistics**](StatisticsApi.md#get_statistics) | **GET** /accounts/{accountId}/statistics | Get Account Statistics |


## get_statistics

> <AccountStatistics> get_statistics(account_id)

Get Account Statistics

Returns details about the current state of the account.

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

api_instance = Bandwidth::StatisticsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.

begin
  # Get Account Statistics
  result = api_instance.get_statistics(account_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling StatisticsApi->get_statistics: #{e}"
end
```

#### Using the get_statistics_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccountStatistics>, Integer, Hash)> get_statistics_with_http_info(account_id)

```ruby
begin
  # Get Account Statistics
  data, status_code, headers = api_instance.get_statistics_with_http_info(account_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountStatistics>
rescue Bandwidth::ApiError => e
  puts "Error when calling StatisticsApi->get_statistics_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |

### Return type

[**AccountStatistics**](AccountStatistics.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

