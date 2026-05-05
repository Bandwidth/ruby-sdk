# Bandwidth::Page

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page_size** | **Integer** | The number of items per page. |  |
| **total_elements** | **Integer** | The total number of items. | [optional] |
| **total_pages** | **Integer** | The total number of pages. | [optional] |
| **page_number** | **Integer** | The current page number. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::Page.new(
  page_size: 10,
  total_elements: 100,
  total_pages: 10,
  page_number: 0
)
```

