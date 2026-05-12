# Bandwidth::EndpointsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_endpoint**](EndpointsApi.md#create_endpoint) | **POST** /accounts/{accountId}/endpoints | Create Endpoint |
| [**delete_endpoint**](EndpointsApi.md#delete_endpoint) | **DELETE** /accounts/{accountId}/endpoints/{endpointId} | Delete Endpoint |
| [**get_endpoint**](EndpointsApi.md#get_endpoint) | **GET** /accounts/{accountId}/endpoints/{endpointId} | Get Endpoint |
| [**list_endpoints**](EndpointsApi.md#list_endpoints) | **GET** /accounts/{accountId}/endpoints | List Endpoints |
| [**update_endpoint_bxml**](EndpointsApi.md#update_endpoint_bxml) | **PUT** /accounts/{accountId}/endpoints/{endpointId}/bxml | Update Endpoint BXML |


## create_endpoint

> <CreateEndpointResponse> create_endpoint(account_id, body)

Create Endpoint

Creates a new Endpoint for the specified account.

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

api_instance = Bandwidth::EndpointsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
body = 3.56 # CreateWebRtcConnectionRequest | 

begin
  # Create Endpoint
  result = api_instance.create_endpoint(account_id, body)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->create_endpoint: #{e}"
end
```

#### Using the create_endpoint_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateEndpointResponse>, Integer, Hash)> create_endpoint_with_http_info(account_id, body)

```ruby
begin
  # Create Endpoint
  data, status_code, headers = api_instance.create_endpoint_with_http_info(account_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateEndpointResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->create_endpoint_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **body** | **CreateWebRtcConnectionRequest** |  |  |

### Return type

[**CreateEndpointResponse**](CreateEndpointResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_endpoint

> delete_endpoint(account_id, endpoint_id)

Delete Endpoint

Deletes the specified endpoint. If the endpoint is actively streaming media, the media stream will be terminated.

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

api_instance = Bandwidth::EndpointsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
endpoint_id = 'e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | BRTC Endpoint ID.

begin
  # Delete Endpoint
  api_instance.delete_endpoint(account_id, endpoint_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->delete_endpoint: #{e}"
end
```

#### Using the delete_endpoint_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_endpoint_with_http_info(account_id, endpoint_id)

```ruby
begin
  # Delete Endpoint
  data, status_code, headers = api_instance.delete_endpoint_with_http_info(account_id, endpoint_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->delete_endpoint_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **endpoint_id** | **String** | BRTC Endpoint ID. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_endpoint

> <EndpointResponse> get_endpoint(account_id, endpoint_id)

Get Endpoint

Returns information about the specified endpoint.

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

api_instance = Bandwidth::EndpointsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
endpoint_id = 'e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | BRTC Endpoint ID.

begin
  # Get Endpoint
  result = api_instance.get_endpoint(account_id, endpoint_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->get_endpoint: #{e}"
end
```

#### Using the get_endpoint_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<EndpointResponse>, Integer, Hash)> get_endpoint_with_http_info(account_id, endpoint_id)

```ruby
begin
  # Get Endpoint
  data, status_code, headers = api_instance.get_endpoint_with_http_info(account_id, endpoint_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EndpointResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->get_endpoint_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **endpoint_id** | **String** | BRTC Endpoint ID. |  |

### Return type

[**EndpointResponse**](EndpointResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_endpoints

> <ListEndpointsResponse> list_endpoints(account_id, opts)

List Endpoints

Returns a list of endpoints associated with the specified account.

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

api_instance = Bandwidth::EndpointsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
opts = {
  type: Bandwidth::EndpointTypeEnum::WEBRTC, # EndpointTypeEnum | The type of endpoint.
  status: Bandwidth::EndpointStatusEnum::CONNECTED, # EndpointStatusEnum | The status of the endpoint.
  after_cursor: 'TWF5IHRoZSBmb3JjZSBiZSB3aXRoIHlvdQ==', # String | The cursor to use for pagination. This is the value of the `next` link in the previous response.
  limit: 2 # Integer | The maximum number of endpoints to return in the response.
}

begin
  # List Endpoints
  result = api_instance.list_endpoints(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->list_endpoints: #{e}"
end
```

#### Using the list_endpoints_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListEndpointsResponse>, Integer, Hash)> list_endpoints_with_http_info(account_id, opts)

```ruby
begin
  # List Endpoints
  data, status_code, headers = api_instance.list_endpoints_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListEndpointsResponse>
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->list_endpoints_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **type** | [**EndpointTypeEnum**](.md) | The type of endpoint. | [optional] |
| **status** | [**EndpointStatusEnum**](.md) | The status of the endpoint. | [optional] |
| **after_cursor** | **String** | The cursor to use for pagination. This is the value of the &#x60;next&#x60; link in the previous response. | [optional] |
| **limit** | **Integer** | The maximum number of endpoints to return in the response. | [optional][default to 100] |

### Return type

[**ListEndpointsResponse**](ListEndpointsResponse.md)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_endpoint_bxml

> update_endpoint_bxml(account_id, endpoint_id, body)

Update Endpoint BXML

Updates the BXML for the specified endpoint.

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

api_instance = Bandwidth::EndpointsApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
endpoint_id = 'e-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85' # String | BRTC Endpoint ID.
body = 'body_example' # String | 

begin
  # Update Endpoint BXML
  api_instance.update_endpoint_bxml(account_id, endpoint_id, body)
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->update_endpoint_bxml: #{e}"
end
```

#### Using the update_endpoint_bxml_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_endpoint_bxml_with_http_info(account_id, endpoint_id, body)

```ruby
begin
  # Update Endpoint BXML
  data, status_code, headers = api_instance.update_endpoint_bxml_with_http_info(account_id, endpoint_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling EndpointsApi->update_endpoint_bxml_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **endpoint_id** | **String** | BRTC Endpoint ID. |  |
| **body** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic), [OAuth2](../README.md#OAuth2)

### HTTP request headers

- **Content-Type**: application/xml
- **Accept**: application/json

