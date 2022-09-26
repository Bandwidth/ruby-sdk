# Bandwidth::PageInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **prev_page** | **String** | The link to the previous page for pagination. | [optional] |
| **next_page** | **String** | The link to the next page for pagination. | [optional] |
| **prev_page_token** | **String** | The isolated pagination token for the previous page. | [optional] |
| **next_page_token** | **String** | The isolated pagination token for the next page. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::PageInfo.new(
  prev_page: https://messaging.bandwidth.com/api/v2/users/accountId/messages?messageStatus&#x3D;DLR_EXPIRED&amp;nextPage&#x3D;DLAPE902,
  next_page: https://messaging.bandwidth.com/api/v2/users/accountId/messages?messageStatus&#x3D;DLR_EXPIRED&amp;prevPage&#x3D;GL83PD3C,
  prev_page_token: DLAPE902,
  next_page_token: GL83PD3C
)
```

