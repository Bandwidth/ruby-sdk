# Bandwidth::MmsMessageContentFile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_url** | **String** | The URL of a media attachment.  For MMS, the API limits file size to 3.5MB. Specific carriers and channels may have a smaller limit that could cause a large file to fail, see [here](https://support.bandwidth.com/hc/en-us/articles/360014235473-What-are-the-MMS-file-size-limits) for more details. |  |

## Example

```ruby
require 'bandwidth-sdk'

instance = Bandwidth::MmsMessageContentFile.new(
  file_url: https://dev.bandwidth.com/images/bandwidth-logo.png
)
```

