# Bandwidth::MediaApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_media**](MediaApi.md#delete_media) | **DELETE** /users/{accountId}/media/{mediaId} | Delete Media |
| [**get_media**](MediaApi.md#get_media) | **GET** /users/{accountId}/media/{mediaId} | Get Media |
| [**list_media**](MediaApi.md#list_media) | **GET** /users/{accountId}/media | List Media |
| [**upload_media**](MediaApi.md#upload_media) | **PUT** /users/{accountId}/media/{mediaId} | Upload Media |


## delete_media

> delete_media(account_id, media_id)

Delete Media

Deletes a media file from Bandwidth API server. Make sure you don't have any application scripts still using the media before you delete.  If you accidentally delete a media file you can immediately upload a new file with the same name.

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

api_instance = Bandwidth::MediaApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
media_id = '14762070468292kw2fuqty55yp2b2/0/bw.png' # String | Media ID to retrieve.

begin
  # Delete Media
  api_instance.delete_media(account_id, media_id)
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->delete_media: #{e}"
end
```

#### Using the delete_media_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_media_with_http_info(account_id, media_id)

```ruby
begin
  # Delete Media
  data, status_code, headers = api_instance.delete_media_with_http_info(account_id, media_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->delete_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **media_id** | **String** | Media ID to retrieve. |  |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_media

> File get_media(account_id, media_id)

Get Media

Downloads a media file you previously uploaded.

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

api_instance = Bandwidth::MediaApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
media_id = '14762070468292kw2fuqty55yp2b2/0/bw.png' # String | Media ID to retrieve.

begin
  # Get Media
  result = api_instance.get_media(account_id, media_id)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->get_media: #{e}"
end
```

#### Using the get_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> get_media_with_http_info(account_id, media_id)

```ruby
begin
  # Get Media
  data, status_code, headers = api_instance.get_media_with_http_info(account_id, media_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->get_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **media_id** | **String** | Media ID to retrieve. |  |

### Return type

**File**

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/octet-stream, application/json


## list_media

> <Array<Media>> list_media(account_id, opts)

List Media

Gets a list of your media files. No query parameters are supported.

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

api_instance = Bandwidth::MediaApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
opts = {
  continuation_token: '1XEi2tsFtLo1JbtLwETnM1ZJ+PqAa8w6ENvC5QKvwyrCDYII663Gy5M4s40owR1tjkuWUif6qbWvFtQJR5/ipqbUnfAqL254LKNlPy6tATCzioKSuHuOqgzloDkSwRtX0LtcL2otHS69hK343m+SjdL+vlj71tT39' # String | Continuation token used to retrieve subsequent media.
}

begin
  # List Media
  result = api_instance.list_media(account_id, opts)
  p result
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->list_media: #{e}"
end
```

#### Using the list_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Media>>, Integer, Hash)> list_media_with_http_info(account_id, opts)

```ruby
begin
  # List Media
  data, status_code, headers = api_instance.list_media_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Media>>
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->list_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **continuation_token** | **String** | Continuation token used to retrieve subsequent media. | [optional] |

### Return type

[**Array&lt;Media&gt;**](Media.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## upload_media

> upload_media(account_id, media_id, body, opts)

Upload Media

Upload a file. You may add headers to the request in order to provide some control to your media file.  A list of supported media types can be found [here](https://support.bandwidth.com/hc/en-us/articles/360014128994-What-MMS-file-types-are-supported-).

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

api_instance = Bandwidth::MediaApi.new
account_id = '9900000' # String | Your Bandwidth Account ID.
media_id = '14762070468292kw2fuqty55yp2b2/0/bw.png' # String | Media ID to retrieve.
body = File.new('/path/to/some/file') # File | 
opts = {
  content_type: 'audio/wav', # String | The media type of the entity-body.
  cache_control: 'no-cache' # String | General-header field is used to specify directives that MUST be obeyed by all caching mechanisms along the request/response chain.
}

begin
  # Upload Media
  api_instance.upload_media(account_id, media_id, body, opts)
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->upload_media: #{e}"
end
```

#### Using the upload_media_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> upload_media_with_http_info(account_id, media_id, body, opts)

```ruby
begin
  # Upload Media
  data, status_code, headers = api_instance.upload_media_with_http_info(account_id, media_id, body, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Bandwidth::ApiError => e
  puts "Error when calling MediaApi->upload_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Your Bandwidth Account ID. |  |
| **media_id** | **String** | Media ID to retrieve. |  |
| **body** | **File** |  |  |
| **content_type** | **String** | The media type of the entity-body. | [optional] |
| **cache_control** | **String** | General-header field is used to specify directives that MUST be obeyed by all caching mechanisms along the request/response chain. | [optional] |

### Return type

nil (empty response body)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

- **Content-Type**: application/json, application/ogg, application/pdf, application/rtf, application/zip, application/x-tar, application/xml, application/gzip, application/x-bzip2, application/x-gzip, application/smil, application/javascript, audio/mp4, audio/mpeg, audio/ogg, audio/flac, audio/webm, audio/wav, audio/amr, audio/3gpp, image/bmp, image/gif, image/jpeg, image/pjpeg, image/png, image/svg+xml, image/tiff, image/webp, image/x-icon, text/css, text/csv, text/calendar, text/plain, text/javascript, text/vcard, text/vnd.wap.wml, text/xml, video/avi, video/mp4, video/mpeg, video/ogg, video/quicktime, video/webm, video/x-ms-wmv
- **Accept**: application/json

