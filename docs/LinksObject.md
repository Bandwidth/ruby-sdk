# Bandwidth::LinksObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first** | **String** | The first (or only) page of results matching the query. | [optional] |
| **_next** | **String** | If more results exist than specified by &#39;size&#39;, this link returns the next page of &#39;size&#39; results. | [optional] |
| **previous** | **String** | If the results are more than one page, this link returns the previous page of &#39;size&#39; results. | [optional] |
| **last** | **String** | If more results exist than specified by &#39;size&#39;, this link return the last page of result. | [optional] |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::LinksObject.new(
  first: null,
  _next: null,
  previous: null,
  last: null
)
```

